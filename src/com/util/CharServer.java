package com.util;

import java.io.IOException;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

/**
 * 这是WebSocket的服务器类
 * @ServerEndpoint 申明当前类是WebSocket的服务器端
 * 其中/chat表示WebSocket的名字 客户端调用时使用
 * @author wenwuGuo
 *
 */
@ServerEndpoint("/JUNGLE")
public class CharServer {
	/**
	 * 获取客户端session的变量  
	 * 这是客户端的连接会话,需要通过他给客户端发送数据
	 */
	private Session session = null;
	
	/**
	 * 储存客户端对象的集合CopyOnWriteArraySet  
	 * CopyOnWriteArraySet为concurrent包下的线程安全Set
	 */
	private static CopyOnWriteArraySet<CharServer> servers = new CopyOnWriteArraySet<CharServer>();
	
	/**
	 * 当服务器调用成功后执行的方法
	 * @param session
	 */
	@OnOpen
	public void onOpen(Session session){
		//把客户端的session存起来
		this.session = session;
		//把新的客户端对象放入集合中
		servers.add(this);
		//System.out.println("连接已建立,客户机ID:"+session.getId());
	}
	
	/**
	 * 接收客户端发送的消息 并处理
	 * @param msg  客户端发送的消息
	 * @throws MyException 
	 */
	@OnMessage
	public void omMessage(String msg){
		String head = mySubString(msg);
		String name = mySubStringName(msg);
		String sucmsg ="";
		if(head != "" && head != null && name != "" && name != null){
			
			sucmsg = msg.substring(head.length()+name.length()+2);
		}
		
		
		String suc = name+"<li>"+"<img src="+head+ " style='width:25px;height:25px;'>&nbsp;&nbsp;"+"&nbsp;&nbsp;"+sucmsg+"</li>";
		try {
			if(servers.size() != 0){
				//遍历客户端集合
				for(CharServer server : servers){
					//将拿到的消息发送给每一个客户端对象
					server.session.getBasicRemote().sendText(suc);
				}
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 当发生错误时会调用的方法
	 * @param error
	 */
	@OnError
	public void onErroer(Throwable error){
		System.out.println("发生一个错误");
		error.printStackTrace();
	}
	
	/**
	 * 当用户会话结束时调用的方法
	 */
	@OnClose
	public void onClose(){
		//删除这个客户端的对象
		servers.remove(this);
		//System.out.println("连接已关闭");
	}
	
	/**
	 * 解析用户头像  
	 * @param str 
	 * @return
	 */
	public String mySubString(String str){
		String user_head = "";
		char[] charstr = str.toCharArray();
		for(char charstr2 : charstr){
			if(charstr2 != '%'){
				user_head += charstr2;
			}else{
				return user_head;
			}
			
		}
		
		return "解析错误";
	}
	
	public String mySubStringName(String str){
		String user_name = "";
		String newname = "";
		char[] charstr = str.toCharArray();
		for(char charstr2 : charstr){
			if(charstr2 != '*'){	
				user_name += charstr2;
				String[] name = user_name.split("%");
				for(int i=0;i<name.length;i++){
					newname = name[i].toString();
				}
			}else{
				return newname;
			}
		}
		
		return "解析错误";
	}
}
