package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.entity.Article;
import com.entity.Message;
import com.entity.UserInfo;
import com.service.IMessageService;
import com.service.impl.MessageServiceImpl;
import com.util.PageUtil;

public class MessageServlet extends BaseServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//消息处理对象
	IMessageService messageService = new MessageServiceImpl();
	
	public void messageCount(HttpServletRequest request, HttpServletResponse response) throws IOException{
		//获取用户信息
		UserInfo user = (UserInfo) request.getSession().getAttribute("userinfo");
		if(user!=null){//判断参数是否为空
			//查询消息
			long count = messageService.queryMessageReadCountByUserId(user.getUser_id());
			response.getWriter().print(count);
		}else{
			System.out.println("messageCount方法收到空值");
		}
	}
	/**
	 * 分页方法
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public void queryMessage(HttpServletRequest request, HttpServletResponse response) throws IOException{
		//获取用户信息
		UserInfo user = (UserInfo) request.getSession().getAttribute("userinfo");
		//获取分页信息
		Integer currentPage = new Integer(request.getParameter("currentPage"));
		Integer pageSize = new Integer(request.getParameter("pageSize"));
		//判断参数是否为空
		if(user != null && currentPage !=null && pageSize !=null){
			//分页查询
			PageUtil pageUtil = new PageUtil();
			pageUtil.setCurrentPage(currentPage);//因为我们写的插件是从1开始计算页面的，jQuery查询从0开始计算
			pageUtil.setPageRow(pageSize);
			//存值
			List<Message> list = messageService.queryMessageByUserId(user.getUser_id(),
													pageUtil.getStartRow(),pageUtil.getEndRow());
			//将集合转换为json格式
			JSONArray arr = new JSONArray(list);
			try {
				//响应客户端
				response.getWriter().print(arr);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			System.out.println("queryMessage方法收到空值");
		}
	}
	/**
	 * 更新消息状态
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public void updateMessage(HttpServletRequest request, HttpServletResponse response) throws IOException{
		//获取消息参数
		long message_id =new Long( request.getParameter("message_id"));
		//判断消息是否为空
		if("".equals(message_id) == false){
			//更新消息
			boolean update = messageService.updateMessage(message_id);
			//响应客户端
			response.getWriter().print(update);
		}
	}
}
