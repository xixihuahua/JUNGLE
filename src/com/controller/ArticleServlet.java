package com.controller;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.log4j.Logger;
import org.json.JSONArray;

import com.dao.IAllDao;
import com.dao.impl.AllDaoImpl;
import com.dao.impl.FileDaoImpl;
import com.entity.Article;
import com.entity.Coin;
import com.entity.Files;
import com.entity.UserInfo;
import com.service.IArticleService;
import com.service.IUserInfoService;
import com.service.impl.ArticleServiceImpl;
import com.service.impl.UserInfoServiceImpl;
import com.util.PageUtil;

/**
 * 文章的controller层
 * @author Administrator
 *
 */
@MultipartConfig
public class ArticleServlet extends BaseServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//创建service层 Article实体对象
	IArticleService articleService = new ArticleServiceImpl();
	//创建service层File处理对象
	FileDaoImpl fileService = new FileDaoImpl();
	//创建service层UserInfo处理积分
	IUserInfoService userinfoService = new UserInfoServiceImpl();
	//创建日志对象
	private static Logger log = Logger.getLogger(ArticleServlet.class);
	//处理javaBean对象
	IAllDao allDao = new AllDaoImpl();
	/**
	 * 添加文章的方法
	 * @param request
	 * @param response
	 */
	public void insertArticle(HttpServletRequest request, HttpServletResponse response){
		//非空判断
		if(request.getParameter("article_title")==""){
			request.setAttribute("error","文章标题不能为空");
			log.info("文章提交错误，文章标题为空");
		}else if(request.getParameter("article_content")==""){
			request.setAttribute("error", "文章内容不能为空");
			log.info("文章提交错误，文章内容为空");
		}else if(request.getParameter("article_tag")==null){
			request.setAttribute("error", "文章标签不能为空");
			log.info("文章提交错误，文章标签为空");
		}
		//有空值返回页面
		if(request.getAttribute("error") != null){
			try {
				request.getRequestDispatcher("publish.jsp").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//获取文章属性
		String article_title = request.getParameter("article_title");
		String article_content = request.getParameter("article_content");
		String article_tag = request.getParameter("article_tag");
		long user_id = new Long(request.getParameter("user_id"));
		//创建article JavaBean
		Article article = new Article();
		
		//向article添加属性
		article.setArticle_title(article_title);
		article.setArticle_content(article_content);
		article.setArticle_tag(article_tag);
		article.setUser_id(new Long(user_id));
		//文章入表,获取文章id
		long article_id = articleService.insertArticleReturnId(article);
		//用户积分增加
		boolean insertUserScore = userinfoService.updateScore(user_id);
		if(insertUserScore){
			request.getSession().setAttribute("userinfo", userinfoService.queryUserById(user_id));
		}
		//文件传输
		try {
			Collection<Part> parts = request.getParts();
			for(Part p : parts){
				if(p.getName().equals("article_video") && p.getSize() > 0){//判断是是视频
					//文章article_file属性设为video
					Article art1 = new Article();
					Article art2 = new Article();
					art1.setArticle_id(new Long(article_id));
					art2.setArticle_file("video");
					allDao.update(art1, art2);
					//文件存放
					Part part1 = p;
					//获取HTTP头信息headerInfo=（form-data; name="file" filename="文件名"）
			        String headerInfo  = part1.getHeader("Content-Disposition");
			        //从HTTP头信息中获取文件名fileName=（文件名）
			        String fileName = headerInfo.substring(headerInfo .lastIndexOf("=")+2, headerInfo .length()-1);
			        //生成存放路径 项目路径（文件夹路径）
			        String direc = "D:"+File.separator+"upload"+File.separator+"video";
			        //检测路径是否存在
		 	        File dirf = new File(direc);
		 	        if(!dirf.exists()){
		 	            dirf.mkdirs();
		 	        }
		 	        //生成文件绝对路径 文件夹路径+（文件名前缀+文件名）
		 	        String realPath = direc+File.separator+(new Date().getTime()+fileName);
		 	        //写入到位置
		 	        part1.write(realPath);
		 	        //文件信息入库 （标题，绝对路径，下载金币）
		 	        Files file = new Files(fileName, realPath, new Long(request.getParameter("file_coin")),article_id);
		 	        //插入文件到数据库
		 	        int flag = fileService.uploadFile(file);
		 	        if(flag == 0){
		 	        	System.out.println("视频插入失败");
		 	        	log.warn("视频插入失败");
		 	        }else{
		 	        	System.out.println("视频插入成功");
		 	        }
				}else if(p.getName().equals("article_file")){//判断是否是文件
					if(p.getSize()>0){//有内容
						Part part1 = p;
						//获取HTTP头信息headerInfo=（form-data; name="file" filename="文件名"）
				        String headerInfo  = part1.getHeader("Content-Disposition");
				        //从HTTP头信息中获取文件名fileName=（文件名）
				        String fileName = headerInfo.substring(headerInfo .lastIndexOf("=")+2, headerInfo .length()-1);
				        //生成存放路径 项目路径（文件夹路径）
				        String direc = "D:"+File.separator+"upload";
				        //检测路径是否存在
			 	        File dirf = new File(direc);
			 	        if(!dirf.exists()){
			 	            dirf.mkdirs();
			 	        }
			 	        //生成文件绝对路径 文件夹路径+（文件名前缀+文件名）
			 	        String realPath = direc+File.separator+(new Date().getTime()+fileName);
			 	        //写入到位置
			 	        part1.write(realPath);
			 	        //文件信息入库 （标题，绝对路径，下载金币）
			 	        Files file = new Files(fileName, realPath, new Long(request.getParameter("file_coin")),article_id);
			 	        //插入文件到数据库
			 	        fileService.uploadFile(file);
					}
				}
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//跳回文章编辑页面
		try {
			response.sendRedirect("index.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//---------11-10-------//
	/**	
	 * 分页查询
	 * @date 2018-11-06
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	public void queryArticlePage(HttpServletRequest request, HttpServletResponse response) throws IOException{
		//获取参数
		UserInfo user = (UserInfo) request.getSession().getAttribute("userinfo");
		Integer currentPage = new Integer(request.getParameter("currentPage"));
		Integer pageSize = new Integer(request.getParameter("pageSize"));
		//判断参数是否为空
		if(user != null && currentPage != null && pageSize!=null){
			PageUtil pageUtil = new PageUtil();
			pageUtil.setCurrentPage(currentPage);//因为我们写的插件是从1开始计算页面的，jQuery查询从0开始计算
			pageUtil.setPageRow(pageSize);
			//用于存放文章
			List<Article> list = null;
			String user_id = request.getParameter("user_id");
					if(user_id == null){
						 list = articleService.queryArticleByUserId(user.getUser_id(),user.getUser_type(),
									pageUtil.getStartRow(),pageUtil.getEndRow());
					}else{
						//如果是游客,也可以查看
						long user_type=2l;
						list = articleService.queryArticleByUserId(new Long(user_id),user_type,
								pageUtil.getStartRow(),pageUtil.getEndRow());
					}
			//将集合转换为json格式
			JSONArray arr = new JSONArray(list);
			
			try {
				response.getWriter().print(arr);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			System.out.println("queryArticlePage方法分页存在空值");
			log.warn("queryArticlePage方法分页存在空值");
		}
	}
	//--------------11-10------------//
	/**
	 * 查询总行数
	 * @date 2018-11-06
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void ArticleCount(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		//获取用户信息
		UserInfo user = (UserInfo) request.getSession().getAttribute("userinfo");
		BigDecimal count = null;
		String user_id = request.getParameter("user_id");
		if(user_id == null){
			//查询数据库的总行数
			count = articleService.queryArticleCount(user.getUser_id(),user.getUser_type());
		}else{
			//如果是游客,也可以查看
			long user_type=2l;
			count = articleService.queryArticleCount(new Long(user_id),user_type);
		}
		response.getWriter().print(count);
	}
	/**
	 * 查询所有文章--分页
	 * @param request
	 * @param response
	 */
	public void queryAllArticlePage(HttpServletRequest request, HttpServletResponse response){
		//获取参数
		Integer currentPage = new Integer(request.getParameter("currentPage"));
		Integer pageSize = new Integer(request.getParameter("pageSize"));
		//判断参数是否为空
		if(currentPage != null && pageSize !=null){
			PageUtil pageUtil = new PageUtil();
			pageUtil.setCurrentPage(currentPage);//因为我们写的插件是从1开始计算页面的，jQuery查询从0开始计算
			pageUtil.setPageRow(pageSize);
			List<Article> list = articleService.queryArticleByUserId(0,0,
										pageUtil.getStartRow(),pageUtil.getEndRow());
			//将集合转换为json格式
			JSONArray arr = new JSONArray(list);
			
			try {
				response.getWriter().print(arr);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			System.out.println("queryAllArticlePage方法收到空值");
			log.warn("文章分页查询错误");
		}
	}
	/**
	 * 查询总文章数
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void AllArticleCount(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		BigDecimal count = null;
		//查询数据库的总行数
		count = articleService.queryArticleCount(0,0);
		response.getWriter().print(count);
	}
	
	/**
	 * 根据文章id查找文章
	 * 附加查询文章相关文件
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void queryArticleByArticleId(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		//获取参数
		String article_id = request.getParameter("article_id");
		UserInfo user = (UserInfo)request.getSession().getAttribute("userinfo");
		//做非空判断
		if(article_id != null && article_id !=""){
			//调用service层插入数据库
			Article article = articleService.queryArticleById(new Long(article_id));
			//获取文件数组
			Files[] files = fileService.queryFileByArticleId(new Long(article_id));
			
			//确认是否已购买
			Coin coin = new Coin();
			coin.setArticle_id(new Long(article_id));
			coin.setUser_id(user.getUser_id());
			//查询交易记录(用户id 文章id)
			List<Coin> coins = allDao.query(coin);
			//设置金币数
			if(coins.size()>0){
				for(Files f : files){
					f.setFile_coin(0);
				}
			}
			//往request放入文件
			request.setAttribute("files",new JSONArray(files));
			request.setAttribute("article", article);
			//判断是否为文章
			if("video".equals(article.getArticle_file())){//是视频
				//找出视频路径
				for(Files f : files){
					if(f.getFile_src().contains(File.separator+"video"+File.separator)){
						//路径处理存入request
						String videoDir = f.getFile_src();
						videoDir = "../../../"+videoDir.replace(File.separator, "/").substring(3);
						request.setAttribute("video", videoDir);
					}
				}
				request.getRequestDispatcher("video.jsp").forward(request, response);
			}else{//是文章
				request.getRequestDispatcher("article.jsp").forward(request, response);
			}
		}else{
			System.out.println("queryArticleByArticleId方法收到空值");
			log.warn("通过文章id查询文章错误");
		}
		
	}
	
	/**
	 * 点赞
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void agreeArticle(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		String article_id = request.getParameter("article_id");
		UserInfo user = (UserInfo) request.getSession().getAttribute("userinfo");
		//做非空判断
		if(user != null && article_id != null && article_id != ""){
			//如果点赞操作成功，返回点赞数量到页面
			//System.out.println(article_id);
			//System.out.println(user.getUser_id());
			if(articleService.agreeArticle(new Long(article_id), user.getUser_id())){
				System.out.println("点赞成功");
			}
		}else{
				System.out.println("点赞失败");
				log.info("点赞失败");
			}
			Article article = articleService.queryArticleById(new Long(article_id));
			//System.out.println(article.getAgree_number());
			response.getWriter().print(article.getAgree_number());
	}
	
	/**
	 * 根据文章标签查找文章
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	public void queryArticleByTag(HttpServletRequest request,HttpServletResponse response) throws IOException{
		//获取参数
		Integer currentPage = new Integer(request.getParameter("currentPage"));
		Integer pageSize = new Integer(request.getParameter("pageSize"));
		
		//获取需要查找的文章标签
		String article_tag = request.getParameter("article_tag");
		//判断参数是否为空
		if(currentPage!=null && pageSize!=null && article_tag != null && article_tag!= "" && article_tag.trim() != ""){
			//System.out.println("上传参数:"+currentPage+" --"+pageSize+" --"+article_tag);
			PageUtil pageUtil = new PageUtil();
			pageUtil.setCurrentPage(currentPage);//因为我们写的插件是从1开始计算页面的，jQuery查询从0开始计算
			pageUtil.setPageRow(pageSize);
			//存储查询文章
			List<Article> taglist = articleService.queryArticleByTag(article_tag,
										pageUtil.getStartRow(),pageUtil.getEndRow());
			//System.out.println(article_tag+"起始结束行:"+pageUtil.getStartRow()+" --"+pageUtil.getEndRow());
			//System.out.println(taglist);
			//将集合转换为json格式
			JSONArray tagarr = new JSONArray(taglist);
			
			//响应客户端
			response.getWriter().print(tagarr);
		}else{
			//错误提示
			response.getWriter().print("您输入的字符不合格呦");
			System.out.println("queryArticleByTag方法收到空值");
			log.info("queryArticleByTag方法收到空值");
		}
	}
	
	/**
	 * 根据文章标签查找文章数量
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	public void queryArticleTagNum(HttpServletRequest request,HttpServletResponse response) throws IOException{
		//获取需要查找的文章标签
		String article_tag = request.getParameter("article_tag");
		//非空判断
		if(article_tag != null && article_tag != ""){
			BigDecimal tagnum = articleService.queryArticleTagNum(article_tag);
			response.getWriter().print(tagnum);
		}
	}
	
	/**
	 * 热门话题的排行  按照点赞数量筛选出十个
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	public void queryArticleByAgreeNumber(HttpServletRequest request,HttpServletResponse response) throws IOException{
		//查询热门话题文章
		List<Article> ArList = articleService.queryArticleByAgreeNumber();
		//System.out.println("点赞的十个名额:"+ArList);
		//响应客户端
		response.getWriter().print(new JSONArray(ArList));
	}
	/**
	 * 浏览数+1
	 * @param request
	 * @param response
	 */
	public void browseArticle(HttpServletRequest request,HttpServletResponse response){
		//获取属性
		String aid = request.getParameter("article_id");
		if(aid != null && aid != ""){
			long article_id = new Long(aid);
			articleService.browseArticle(article_id);
		}
	}
	/**
	 * 是否已收藏
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public void ifCollect(HttpServletRequest request,HttpServletResponse response) throws IOException{
		//获取需要查找的文章标签
		String article_id = request.getParameter("article_id");
		UserInfo user = (UserInfo) request.getSession().getAttribute("userinfo");
		//非空判断
		if(article_id != null && article_id != "" && user != null){
			boolean flag=articleService.ifCollect(new Long(article_id), user.getUser_id());
			//System.out.println(flag);
			response.getWriter().print(flag);
		}
	}
	//-------------11-09----------//
	/**
	 * 收藏/取消收藏
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void collectArticle(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		//获取参数
		String article_id = request.getParameter("article_id");
		UserInfo user = (UserInfo) request.getSession().getAttribute("userinfo");
		//做非空判断
		if(user != null && article_id != "" && article_id != null){//不为空则执行后续操作
			//如果收藏操作成功，返回到页面
			//System.out.println(article_id);
			//System.out.println(user.getUser_id());
			//查询文章
			if(articleService.collectArticle(new Long(article_id), user.getUser_id())){
				//判断是否收藏
				boolean flag=articleService.ifCollect(new Long(article_id), user.getUser_id());
				if(flag){
					System.out.println("已收藏");
					response.getWriter().print(true);
				}else{
					System.out.println("未收藏");
					log.warn("收藏文章，执行错误");
					response.getWriter().print(false);
				}
			}else{
				System.out.println("操作失败");
				log.warn("收藏文章，进入失败");
				response.getWriter().print(false);
			}
		}
	}
	//-------------11-09----end------//
	/**	
	 * 分页查询收藏文章
	 * @date 2018-11-06
	 * @param request
	 * @param response
	 */
	public void queryCollectArticlePage(HttpServletRequest request, HttpServletResponse response){
		//获取相关参数
		UserInfo user = (UserInfo) request.getSession().getAttribute("userinfo");
		Integer currentPage = new Integer(request.getParameter("currentPage"));
		Integer pageSize = new Integer(request.getParameter("pageSize"));
		//判断参数是否为空
		if(user != null && currentPage !=null && pageSize !=null){
			//计算分页
			PageUtil pageUtil = new PageUtil();
			pageUtil.setCurrentPage(currentPage);//因为我们写的插件是从1开始计算页面的，jQuery查询从0开始计算
			pageUtil.setPageRow(pageSize);
			//存储文章
			List<Article> list = articleService.queryArticleByCollect(user.getUser_id(),
										pageUtil.getStartRow(),pageUtil.getEndRow());
			//将集合转换为json格式
			JSONArray arr = new JSONArray(list);
			
			try {
				response.getWriter().print(arr);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			System.out.println("queryCollectArticlePage方法收到空值");
			log.warn("分页查询收藏文章错误");
		}
	}
	/**
	 * 查询总行数
	 * @date 2018-11-06
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void collectArticleCount(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		//获取用户信息
		UserInfo user = (UserInfo) request.getSession().getAttribute("userinfo");
		if(user!=null){
			BigDecimal count = null;
			//查询数据库的总行数
			count = articleService.queryCollectArticleCount(user.getUser_id());
			//响应客户端
			response.getWriter().print(count);
		}else{
			//错误提示
			System.out.println("collectArticleCount方法收到空值");
			log.warn("查询总行数错误");
		}
	}
	
	/**
	 * 搜索到的文章的总行数
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void searchArticleCount(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		//记录搜索到的文章的总行数
		BigDecimal count = null;
		//获取参数
		String searchWord = request.getParameter("q");
		//判断参数是否为空
		if(searchWord == null || searchWord == ""){
			//页面跳转
			response.sendRedirect("index.jsp");
		}else{
			//查询文章总行数
			count = articleService.queryDimBig(searchWord);
			//响应客户端
			response.getWriter().print(count);
		}	
	}
	
	public void searchArticle(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		//获取需要的参数
		Integer currentPage = new Integer(request.getParameter("currentPage"));
		Integer pageSize = new Integer(request.getParameter("pageSize"));
		//计算分页
		PageUtil pageUtil = new PageUtil();
		pageUtil.setCurrentPage(currentPage);//因为我们写的插件是从1开始计算页面的，jQuery查询从0开始计算
		pageUtil.setPageRow(pageSize);
		//System.out.println("上传参数 起始行："+pageUtil.getStartRow()+pageUtil.getEndRow());
		
		String searchWord = request.getParameter("q");
		List<Article> list = null;
		//判断参数是否为空
		if(currentPage!=null && pageSize!=null && searchWord!=null && searchWord != ""){
			if(searchWord.matches("[a-zA-Z]+"))		//一串字母
				searchWord = searchWord.toLowerCase();
			list = articleService.queryDim(pageUtil.getStartRow(),pageUtil.getEndRow(),searchWord);			
		
			//将集合转换为json格式
			JSONArray arr = new JSONArray(list);
			
			try {
				response.getWriter().print(arr);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			System.out.println("searchArticle收到空值");
			log.info("搜索文章查到空值");
		}
	}
	/**
	 * 查询用户评论总文章数量
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void queryCommentArticleCount(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		//获取参数
		UserInfo user = (UserInfo) request.getSession().getAttribute("userinfo");
		//判断参数是否为空
		if(user!=null){
			BigDecimal count = null;
			//查询数据库的总行数
			count = articleService.queryCommentArticleCount(user.getUser_id());
			response.getWriter().print(count);
		}else{
			System.out.println("commentArticleCount方法收到空值");
			log.info("查询用户评论总文章数量错误");
		}
	}
	
	/**
	 * 查询用户评论文章
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void queryArticleCommentById(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		//获取参数
		UserInfo user = (UserInfo) request.getSession().getAttribute("userinfo");
		Integer currentPage = new Integer(request.getParameter("currentPage"));
		Integer pageSize = new Integer(request.getParameter("pageSize"));
		//判断参数是否为空
		if(user != null && currentPage !=null && pageSize !=null){
			PageUtil pageUtil = new PageUtil();
			pageUtil.setCurrentPage(currentPage);//因为我们写的插件是从1开始计算页面的，jQuery查询从0开始计算
			pageUtil.setPageRow(pageSize);
			List<Article> list = articleService.queryArticleByCommentUserId(user.getUser_id(),
										pageUtil.getStartRow(),pageUtil.getEndRow());
			//将集合转换为json格式
			JSONArray arr = new JSONArray(list);
			
			try {
				response.getWriter().print(arr);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			System.out.println("queryArticleCommentById方法收到空值");
			log.info("查询文章评论出错");
		}
	}
	/**
	 * 删除文章
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void deleArticle(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		//获取要删除文章的id
		String[] article_id = request.getParameterValues("article_id");
		if(article_id.length > 0){//查询到文章
			//删除文章操作
			boolean flag = articleService.deleArticle(article_id);
			if(flag){
				response.getWriter().print("删除成功");
			}else{
				response.getWriter().print("删除失败");
			}
		}else{ //未查询到文章
			response.getWriter().print("格式错误");
		}
	}
}
