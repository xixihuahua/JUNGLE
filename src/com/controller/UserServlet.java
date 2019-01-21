package com.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.json.Json;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.RepaintManager;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;

import com.entity.Article;
import com.entity.UserInfo;
import com.service.IUserInfoService;
import com.service.impl.UserInfoServiceImpl;
import com.util.DButil;
import com.util.NumberUtil;
import com.util.PageUtil;
import com.util.SendMailUtil;
/**
 * 用户的controller实现层
 * @author Administrator
 *
 */
public class UserServlet extends BaseServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//创建service层 UserInfo实体对象
	IUserInfoService userinfoService = new UserInfoServiceImpl();
	//创建日志对象
	private static Logger log = Logger.getLogger(UserServlet.class);
	/**
	 * 注册用户的方法
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public void insertUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		//获取用户输入的用户名
		String username = request.getParameter("username");
		//获取用户输入的密码
		String password = request.getParameter("password");
		//获取用户输入的邮箱验证码
		String email = request.getParameter("email");
		
		System.out.println(username+" "+password+" "+email);
		
		//输入的非空判断
		if(username != null && password != null && email != null){
			//用户名格式验证
			if(username.matches("[\u4e00-\u9fa5_a-zA-Z0-9]{2,10}")){
				//密码格式验证
				if(password.matches("[^\u4e00-\u9fa5^\\s]{6,18}")){
					//email格式验证
					if(email.matches(".+@.+")){
						//如果用户输入的数据没问题,先查找用户名是否重复
						if(userinfoService.queryUserByUserName(username) != null){//有重复用户名,返回注册页
							//准备数据回显
							request.setAttribute("username", username);//用户名
							request.setAttribute("password", password);//密码
							request.setAttribute("email", email);//邮箱
							//错误备注
							request.setAttribute("error", "用户名已存在");
							log.warn("用户名已存在");
						}else{//无重复用户名,直接注册
							//配置userinfo JavaBean
							UserInfo userinfo = new UserInfo();
							userinfo.setUser_name(username);
							userinfo.setUser_pwd(password);
							userinfo.setUser_email(email);
							//调用service层进行操作
							if(userinfoService.insertUser(userinfo)){//注册成功
								//直接登录
								queryUserByLogin(request,response);
								/*//操作成功,收到返回结果
								request.setAttribute("success","注册成功");
								//跳转登录页面
								response.sendRedirect("login.jsp");*/
							}else{
								//注册失败
								request.setAttribute("error","注册失败");
								log.info("注册失败");
								response.sendRedirect("regist.jsp");
							}
						}
					}else{
						//邮箱格式不正确
						request.setAttribute("error","邮箱格式不正确");
						log.warn("注册时,邮箱格式不正确");
					}
				}else{
					//密码格式不正确
					request.setAttribute("error","密码格式不正确");
					log.warn("注册时,密码格式不正确");
				}
			}else{
				//用户名格式不正确
				request.setAttribute("error","用户名格式不正确");
				log.warn("注册时,用户名格式不正确");
			}
		}else{
			//有一项为空的时候
			request.setAttribute("error","用户名,密码,邮箱不能为空");
			log.warn("注册时,用户名,密码,邮箱存在空值");
		}
		//没跳转，执行到此处返回注册界面
		try {
			request.getRequestDispatcher("regist.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(request.getAttribute("error"));
	}

	/**
	 * 登录的方法
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public void queryUserByLogin(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		//获取用户输入的用户名
		String username = request.getParameter("username");
		//获取用户输入的密码
		String password = request.getParameter("password");
		//获取登陆设置
		boolean autoLogin = false;
		boolean savePassword = false;
		if(request.getParameter("autoLogin")!= null)autoLogin = true;
		if(request.getParameter("savePassword")!= null)savePassword = true;
		//获取用户的滑块是否通过   暂不实现后台
		
		//输入的非空判断
		if(username != null && password != null){
			//用户名格式验证
			if(username.matches("[\u4e00-\u9fa5_a-zA-Z0-9]{2,10}")){
				//密码格式验证
				if(password.matches("[^\u4e00-\u9fa5^\\s]{6,18}")){
					//调用service层进行操作收到返回结果
					UserInfo userinfo =  userinfoService.queryUserByLogin(username, password);
					//调用service层进行操作
					if(userinfo!= null){
						//把用户的信息存起来
						request.getSession().setAttribute("userinfo",userinfo);
						System.out.println("登录成功");
						//登录成功
						if(autoLogin){//存放自动登陆的信息（为期7天）
							Cookie cookie1 = new Cookie("autoLogin","true");
							Cookie cookie2 = new Cookie("username",URLEncoder.encode(username));
							Cookie cookie3 = new Cookie("password",URLEncoder.encode(password));
							cookie1.setMaxAge(7*24*60*60);
							cookie2.setMaxAge(7*24*60*60);
							cookie3.setMaxAge(7*24*60*60);
							response.addCookie(cookie1);
							response.addCookie(cookie2);
							response.addCookie(cookie3);
						}
						if(savePassword){//存放用户名密码信息（为期7天）
							Cookie cookie1 = new Cookie("savePassword","true");
							Cookie cookie2 = new Cookie("username",URLEncoder.encode(username));
							Cookie cookie3 = new Cookie("password",URLEncoder.encode(password));
							cookie1.setMaxAge(7*24*60*60);
							cookie2.setMaxAge(7*24*60*60);
							cookie3.setMaxAge(7*24*60*60);
							response.addCookie(cookie1);
							response.addCookie(cookie2);
							response.addCookie(cookie3);
						}
						response.sendRedirect("index.jsp");
					}else{//登录失败 未查询到该用户
						//判断错误原因
						UserInfo userinfo2 = userinfoService.queryUserByUserName(username);
						if(userinfo2 !=null ){//用户名存在
							request.setAttribute("usernameMsg", true);
							request.setAttribute("passwordMsg", false);
						}else{//用户名不存在
							request.setAttribute("usernameMsg", false);
							log.warn("登录时,用户名不存在");
						}
						//用于数据回显
						request.setAttribute("username", username);
						request.setAttribute("password", password);
						request.setAttribute("error","登录失败 未查询到该用户");
					}
				}else{
					//密码格式不正确
					request.setAttribute("error","密码格式不正确");
					log.warn("登录时,密码格式不正确");
				}
			}else{
				//用户名格式不正确
				request.setAttribute("error","用户名格式不正确");
				log.warn("登录时,用户名格式不正确");
			}
		}else{
			//有一项为空的时候
			request.setAttribute("error","用户名,密码,邮箱不能为空");
			log.warn("登录时,用户名,密码,邮箱存在空值");
		}
		if(request.getAttribute("error") != null){//有错误
			//登陆失败，跳转
			request.getRequestDispatcher("login.jsp").forward(request, response);
			log.debug("登录失败");
		}
	}
	/**
	 * 处理充值
	 * @param request
	 * @param response
	 */
	public void payCoin(HttpServletRequest request, HttpServletResponse response){
		System.out.println("支付处理");
		//获取订单编号
		String orderid = (String) request.getParameter("orderid");
		//获取用户id
		long user_id = new Long(request.getParameter("user_id"));
		UserInfo user = (UserInfo)request.getSession().getAttribute("userinfo");
		//获取session中的值
		String Sorderid = (String) request.getSession().getAttribute("orderid");
		String Sprice = (String) request.getSession().getAttribute("price");
		
		System.out.println("orderid："+orderid);
		System.out.println("Sorderid："+Sorderid);
		System.out.println("Sprice："+Sprice);
		System.out.println("user_id:"+user_id);
		//充值处理
		if(Sorderid.equals(orderid)){//判断交易是否成功
			System.out.println("充值进了了");
			if(userinfoService.payCoin(user_id, new Long(Sprice)*10) != -1){
				try {
					//清空除session记录
					request.getSession().setAttribute("orderid",null);
					request.getSession().setAttribute("price", null);
					//更新用户金额
					long oldCoin = user.getUser_coin();
					long newCoin = (oldCoin+=new Long(Sprice)*10);
					user.setUser_coin(newCoin);
					request.getSession().setAttribute("userinfo", user);
					//返回充值结果
					request.setAttribute("payCoin", true);
					System.out.println("充值成功");
					request.getRequestDispatcher("left.jsp").forward(request, response);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else{
				//返回充值结果
				try {
					request.setAttribute("payCoin", false);
					System.out.println("充值失败");
					request.getRequestDispatcher("left.jsp").forward(request, response);
				} catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}else{
			try {
				request.getRequestDispatcher("left.jsp").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 发送邮箱验证码的方法
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public void sendMail(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		String inbox = request.getParameter("inbox");
		if(inbox!=null && inbox!=""){
			//创建6位随机数作为验证码
			String mailCode = NumberUtil.generateVerifyCode(6);
			//回响给页面
			response.getWriter().print(mailCode);
			System.out.println(mailCode);
			new SendMailUtil().send("hyz804762373@163.com","JUNGLE验证码",mailCode);
			//request.setAttribute("mailCode", mailCode);
			//System.out.println(request.getAttribute("mailCode"));
			//request.getRequestDispatcher("regist.jsp").forward(request, response);
			new SendMailUtil().send(inbox, "JUNGLE验证码", mailCode);
		}else{
			log.warn("请求邮箱验证码时，邮箱为空");
		}
	}
	/**
	 * 访问查找用户
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void findUser(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		//获取用户信息
		UserInfo user = (UserInfo) request.getSession().getAttribute("userinfo");
		//被访问的用户id
		String visitedUser_idstr = request.getParameter("visitedUser_id");
		//判断是否为long
		long visitedUser_id = 0;
		UserInfo userinfo = null;
		if(visitedUser_idstr.matches("\\d+")){
			visitedUser_id = new Long(visitedUser_idstr);
			if(user !=null && visitedUser_id == user.getUser_id()){
				response.sendRedirect("left.jsp");
			}else{
				userinfo = userinfoService.queryUserById(visitedUser_id);
			}
		}
		//设置参数
		request.setAttribute("userinfo", userinfo);
		//跳转页面
		request.getRequestDispatcher("visited.jsp").forward(request, response);
	}
	/**
	 * 退出登录
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void logout(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		//把用户的信息存起来
		request.getSession().setAttribute("userinfo",null);
		//消除Cookie的自动登录
		Cookie[] cookies = request.getCookies();
		if(cookies.length>0){
			for(Cookie c : cookies){
				if(c.getName().equals("autoLogin")){
					c.setValue("false");
					response.addCookie(c);
					System.out.println(c.getValue());
					break;
				}
			}
		}
		//登录成功
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	
	public void changeMessage(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, IOException{
		//获取参数
		String user_name = request.getParameter("uname");
		String user_head = request.getParameter("head");
		String user_sex = request.getParameter("sex");
		String user_email = request.getParameter("email");
		long user_id = ((UserInfo)request.getSession().getAttribute("userinfo")).getUser_id();
		//创建用户，设置用户参数
		UserInfo newUser = new UserInfo(user_head,user_name,user_sex,user_email,user_id);
		
/*		String bir = request.getParameter("birth");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date user_bir = null;
		try {
			user_bir = sdf.parse(bir);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("user_bir:"+user_bir);
		long user_id = ((UserInfo)request.getSession().getAttribute("userinfo")).getUser_id();
		UserInfo newUser = new UserInfo(user_head,user_name,user_sex,user_bir,user_email,user_id);
	*/	//
		if(userinfoService.changeMessage(newUser)){
			//获取session里的参数
			UserInfo updateSessionUser = (UserInfo)request.getSession().getAttribute("userinfo");
			updateSessionUser.setUser_name(user_name);
			updateSessionUser.setUser_sex(user_sex);
			updateSessionUser.setUser_email(user_email);
			updateSessionUser.setUser_head(user_head);
//			updateSessionUser.setUser_bir(user_bir);
			System.out.println("个人信息修改成功");
			response.sendRedirect("index.jsp");
		}else{
			System.out.println("个人信息未修改");
			log.warn("个人信息修改出错");
		}
	}
	
	//------11-09------//
	/**
	 * 关注用户
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	public void insertRelationship(HttpServletRequest request, HttpServletResponse response) throws IOException{
		//获取用户信息
		UserInfo user = (UserInfo) request.getSession().getAttribute("userinfo");
		//判断参数是否为空
		if(user != null){
			//获取用户属性
			String follow_id = request.getParameter("user_id");
			System.out.println("follow:"+follow_id);
			boolean ifid = (!follow_id.equals(user.getUser_id()+""));
			
			if(ifid && userinfoService.insertRelationship(Integer.valueOf(follow_id), (int)user.getUser_id())){
				//查询关注信息
				boolean flag=userinfoService.ifRelationship(Integer.valueOf(follow_id), (int)user.getUser_id());
				System.out.println(flag);
				if(flag){
					System.out.println("已关注");
					response.getWriter().print(true);
				}else{
					System.out.println("未关注");
					response.getWriter().print(false);
				}
			}else{
				System.out.println("关注操作失败");
				log.warn("关注用户失败");
			}
		}else{
			System.out.println("请先登录");
		}
	}
	/**
	 * 是否已经关注
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public void ifFollow(HttpServletRequest request, HttpServletResponse response) throws IOException{
		UserInfo user = (UserInfo) request.getSession().getAttribute("userinfo");
		if(user != null){
			String follow_id = request.getParameter("user_id");
			boolean flag = userinfoService.ifRelationship(Integer.valueOf(follow_id), (int)user.getUser_id());
			response.getWriter().print(flag);
		}else{
			System.out.println("请先登录");
			response.getWriter().print(false);
		}
	}
	/**	
	 * 分页查询关注用户/粉丝
	 * @date 2018-11-06
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	public void queryRelationshipUserPage(HttpServletRequest request, HttpServletResponse response) throws IOException{
		UserInfo user = (UserInfo) request.getSession().getAttribute("userinfo");
		Integer currentPage = new Integer(request.getParameter("currentPage"));
		Integer pageSize = new Integer(request.getParameter("pageSize"));
		String flag = request.getParameter("flag");
		PageUtil pageUtil = new PageUtil();
		pageUtil.setCurrentPage(currentPage);//因为我们写的插件是从1开始计算页面的，jQuery查询从0开始计算
		pageUtil.setPageRow(pageSize);
		if(user!=null && flag != "" && currentPage != null && pageSize != null && flag != null){
			List<UserInfo> list = null;
			if("follow".equals(flag)){
				list = userinfoService.queryFollowByUserId(user.getUser_id(),
						pageUtil.getStartRow(),pageUtil.getEndRow());
			}else if("fans".equals(flag)){
				list = userinfoService.queryFansByUserId(user.getUser_id(),
						pageUtil.getStartRow(),pageUtil.getEndRow());
			}
			//将集合转换为json格式
			JSONArray arr = new JSONArray(list);
			
			response.getWriter().print(arr);
		}else{
			System.out.println("queryRelationshipUserPage方法收到空值");
			log.warn("分页查询关注用户/粉丝失败");
		}
		
	}
	/**
	 * 查询关注/粉丝总行数
	 * @date 2018-11-06
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void RelationshipUserCount(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		UserInfo user = (UserInfo) request.getSession().getAttribute("userinfo");
		String flag = request.getParameter("flag");
		BigDecimal count = null;
		if("follow".equals(flag)){
		//查询数据库的总行数
		count = userinfoService.queryFollowCountByUserId((int)user.getUser_id());
		}else if("fans".equals(flag)){
			log.info("查询关注/粉丝总行数错误");
			count = userinfoService.queryFansCountByUserId((int)user.getUser_id());
		}
		response.getWriter().print(count);
	}
	
	/**
	 * 查询所有用户
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	public void alluser(HttpServletRequest request,HttpServletResponse response) throws IOException{
		Integer currentPage = new Integer(request.getParameter("currentPage"));
		Integer pageSize = new Integer(request.getParameter("pageSize"));
		
		PageUtil pageUtil = new PageUtil();
		pageUtil.setCurrentPage(currentPage);//因为我们写的插件是从1开始计算页面的，jQuery查询从0开始计算
		pageUtil.setPageRow(pageSize);
		
		if(currentPage != null && pageSize != null){
			List<UserInfo> list = userinfoService.alluser(pageUtil.getStartRow(),pageUtil.getEndRow());
			//将集合转换为json格式
			JSONArray arr = new JSONArray(list);
			//回响给ajax
			response.getWriter().print(arr);
		}else{
			System.out.println("alluser方法收到空值");
			log.warn("查询所有用户出错");
		}
		
	}
	
	/**
	 * 查询所有用户总数
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public void alluserNumber(HttpServletRequest request,HttpServletResponse response) throws IOException{
		BigDecimal userber = userinfoService.alluserNumber();
		//回响给ajax
		response.getWriter().print(userber);
	}
	
	/**
	 * 查询所有管理员总数
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public void allAdminNumber(HttpServletRequest request,HttpServletResponse response) throws IOException{
		BigDecimal adminuser = userinfoService.allAdminNumber();
		//回响给ajax
		response.getWriter().print(adminuser);
	}
	
	/**
	 * 查询所有管理员
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public void allAdmin(HttpServletRequest request,HttpServletResponse response) throws IOException{
		Integer currentPage = new Integer(request.getParameter("currentPage"));
		Integer pageSize = new Integer(request.getParameter("pageSize"));
		
		PageUtil pageUtil = new PageUtil();
		pageUtil.setCurrentPage(currentPage);//因为我们写的插件是从1开始计算页面的，jQuery查询从0开始计算
		pageUtil.setPageRow(pageSize);
		
		if(currentPage != null && pageSize != null){
			List<UserInfo> list = userinfoService.allAdmin(pageUtil.getStartRow(),pageUtil.getEndRow());
			//将集合转换为json格式
			JSONArray arr = new JSONArray(list);
			//回响给ajax
			response.getWriter().print(arr);
		}else{
			System.out.println("allAdmin方法收到空值");
			log.warn("查询所有管理员错误");
		}
	}
	
	/**
	 * 签到
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void signDate(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		UserInfo user = (UserInfo) request.getSession().getAttribute("userinfo");
		if(user != null){
			 Format f = new SimpleDateFormat("yyyy-MM-dd");
		        String date_now = f.format(new Date());
		        System.out.println(user.getSign_date());
		        String date_user = f.format(user.getSign_date());
		        if(date_now.equals(date_user)){
		        	//表示今日已经签到
		        	response.getWriter().print("1");
		        	System.out.println("今日已签到");
		        }else if(userinfoService.signDate(user.getUser_id())){
		        	user = userinfoService.queryUserById(user.getUser_id());
		        	request.getSession().setAttribute("userinfo",user);
		        	//更新成功
		        	System.out.println("签到成功");
		        	response.getWriter().print("2");
		        }else{
		        	//更新失败
		        	System.out.println("签到失败");
		        	log.info("签到错误");
		        	response.getWriter().print("3");
		        }
		}else{
			System.out.println("用户未登录");
			log.debug("用户未登录情况下，执行签到操作");
		}
	}
	
	/**
	 * 增加管理员
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	public void addAdmin(HttpServletRequest request,HttpServletResponse response) throws IOException{
		//获取参数
		String adminid = request.getParameter("addAdmin_user_id");
		//判断参数是否为空
		if(adminid != null && adminid != "" && adminid.matches("\\d*") &&  (!adminid.equals("5"))){
			//增加管理员
			boolean flag = userinfoService.addAdmin(new Long(adminid));
			if(flag){
				response.getWriter().print("已成功增加管理员");
			}else{
				response.getWriter().print("增加管理员失败");
				log.warn("添加管理员失败");
			}
		}else{
			//响应客户端
			response.getWriter().print("您无法增加此用户");
		}
	}
	
	/**
	 * 删除管理员
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public void deleAdmin(HttpServletRequest request,HttpServletResponse response) throws IOException{
		//获取参数
		String adminid = request.getParameter("addAdmin_user_id");
		//判断参数是否为空
		if(adminid != null && adminid != "" && adminid.matches("\\d*") &&  (!adminid.equals("5"))){
			//删除管理员
			boolean flag = userinfoService.deleAdmin(new Long(adminid));
			if(flag){
				response.getWriter().print("已成功删除管理员");
			}else{
				response.getWriter().print("删除管理员失败");
				log.warn("删除管理员失败");
			}
		}else{
			//响应客户端
			response.getWriter().print("您无法删除此用户");
		}
	}
	
	public void queryUserById(HttpServletRequest request,HttpServletResponse response) throws IOException{
		//获取参数
		String user_id = request.getParameter("user_id");
		//判断参数是否为空
		if(user_id != null && user_id != "" && user_id.matches("\\d*") &&  (!user_id.equals("5"))){
			System.out.println("user_id "+ user_id);
			//管理员查询
			UserInfo userinfo_admin = userinfoService.queryUserById(new Long(user_id));
			System.out.println("userinfo_admin "+ userinfo_admin);
			//包装成json对象
			JSONObject userinfoAdmin = new JSONObject(userinfo_admin);
			response.getWriter().print(userinfoAdmin);
		}else{
			//响应客户端
			response.getWriter().print("您无法修改该用户");
		}
	}
	
	/**
	 * 修改用户信息-管理员界面
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public void updateUser_Admin(HttpServletRequest request,HttpServletResponse response) throws IOException{
		//获取参数
		String user_name = request.getParameter("user_name");
		String user_id = request.getParameter("user_id");
		String user_pwd = request.getParameter("user_pwd");
		String user_sex = request.getParameter("user_sex");
		String user_coin = request.getParameter("user_coin");
		
		//判断参数是否为空
		if(user_name != "" && user_name!= null && user_name.trim() != "" && user_name.matches("[\u4e00-\u9fa5_a-zA-Z0-9]{2,10}")){
			if(user_id != "" &&  (!user_id.equals("5"))){
				if(user_pwd !="" && user_pwd != null && user_pwd.trim() != "" && user_pwd.matches("[^\u4e00-\u9fa5^\\s]{6,18}")){
					if(user_sex.trim().equals("男") || user_sex.trim().equals("女")){
						if(user_coin != "" && user_coin != null){
							//设置属性
							UserInfo userinfo = new UserInfo();
							userinfo.setUser_name(user_name);
							userinfo.setUser_id(new Long(user_id));
							userinfo.setUser_pwd(user_pwd);
							userinfo.setUser_sex(user_sex);
							userinfo.setUser_coin(new Long(user_coin));
							//更新管理员
							boolean flag = userinfoService.updateUser_Admin(userinfo);
							
							if(flag){
								response.getWriter().print("修改成功");
							}else{
								response.getWriter().print("修改失败");
								log.warn("管理员修改用户信息出错");
							}
						}
					}else{
						response.getWriter().print("性别格式错误");
						log.debug("管理员修改用户信息时，性别格式错误");
					}
				}else{
					response.getWriter().print("密码格式错误");
					log.debug("管理员修改用户信息时，密码格式错误");
				}
			}else{
				response.getWriter().print("用户名格式错误");
				log.debug("管理员修改用户信息时，ID格式错误或者修改ID为管理员ID");
			}
		}else{
			response.getWriter().print("用户名格式错误");
			log.debug("管理员修改用户信息时，用户名格式错误");
		}
	}
	
	/**
	 * 删除用户-管理员界面
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	public void deleteUser_Admin(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String user_id = request.getParameter("user_id");
		if(user_id != "" && user_id.matches("\\d*") && (!user_id.equals("5"))){
			boolean flag = userinfoService.deleteUser_Admin(new Long(user_id));
			if(flag){
				response.getWriter().print("移除用户成功");
			}else{
				response.getWriter().print("移除用户失败");
				log.info("管理员界面，删除用户失败");
			}
		}else{
			response.getWriter().print("用户ID格式错误,您无法删除该用户");
			log.info("管理员界面，用户ID格式错误");
		}
	}
	/**
	 * 新增用户-管理员页面
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public void admin_insertUser(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String user_name = request.getParameter("user_name");
		String user_email = request.getParameter("user_email");
		String user_pwd = request.getParameter("user_pwd");
		String user_sex = request.getParameter("user_sex");
		String user_coin = request.getParameter("user_coin");
		

		if(user_name != "" && user_name!= null && user_name.trim() != "" && user_name.matches("[\u4e00-\u9fa5_a-zA-Z0-9]{2,10}")){
			if(user_email != "" && user_email.matches(".+@.+")){
				if(user_pwd !="" && user_pwd != null && user_pwd.trim() != "" && user_pwd.matches("[^\u4e00-\u9fa5^\\s]{6,18}")){
					if(user_sex.trim().equals("男") || user_sex.trim().equals("女")){
						if(user_coin != "" && user_coin != null){
							UserInfo userinfo = new UserInfo();
							userinfo.setUser_name(user_name);
							userinfo.setUser_email(user_email);
							userinfo.setUser_pwd(user_pwd);
							userinfo.setUser_sex(user_sex);
							userinfo.setUser_coin(new Long(user_coin));
							
							boolean flag = userinfoService.admin_insertUser(userinfo);
							
							if(flag){
								response.getWriter().print("注册新用户成功");
							}else{
								response.getWriter().print("注册新用户失败");
								log.warn("管理员界面，注册新用户失败");
							}
						}
					}else{
						response.getWriter().print("性别格式错误");
						log.warn("管理员注册新用户时，性别格式错误");
					}
				}else{
					response.getWriter().print("密码格式错误");
					log.warn("管理员注册新用户时，性别格式错误");
				}
			}else{
				response.getWriter().print("邮箱格式错误");
				log.warn("管理员注册新用户时，性别格式错误");
			}
		}else{
			response.getWriter().print("用户名格式错误");
			log.warn("管理员注册新用户时，性别格式错误");
		}
	}
	/**
	 * 搜索查找用户总数
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void searchUserCount(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		//记录搜索到的文章的总行数
		BigDecimal count = null;
		String searchWord = request.getParameter("q").trim();
		if(searchWord == null || searchWord == ""){
			response.sendRedirect("index.jsp");
		}else{
			count = userinfoService.queryDimBig(searchWord);
			response.getWriter().print(count);
		}	
	}
	/**
	 * 根据用户名查找用户
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public void searchUserByName(HttpServletRequest request,HttpServletResponse response) throws IOException{
		Integer currentPage = new Integer(request.getParameter("currentPage"));
		Integer pageSize = new Integer(request.getParameter("pageSize"));
		PageUtil pageUtil = new PageUtil();
		pageUtil.setCurrentPage(currentPage);//因为我们写的插件是从1开始计算页面的，jQuery查询从0开始计算
		pageUtil.setPageRow(pageSize);
		//System.out.println("上传参数 起始行："+pageUtil.getStartRow()+pageUtil.getEndRow());
		
		String searchWord = request.getParameter("q");
		List<UserInfo> list = null;
		
		if(currentPage!=null && pageSize!=null && searchWord!=null && searchWord != ""){
			if(searchWord.matches("[a-zA-Z]+"))		//一串字母
				searchWord = searchWord.toLowerCase();
			list = userinfoService.queryDim(pageUtil.getStartRow(),pageUtil.getEndRow(),searchWord);			
		
			//将集合转换为json格式
			JSONArray arr = new JSONArray(list);
			
			try {
				response.getWriter().print(arr);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			System.out.println("searchUserByName收到空值");
			log.info("根据用户名模糊查询用户错误");
		}
	}
}
