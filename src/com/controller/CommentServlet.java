package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.json.JSONArray;

import com.entity.Article;
import com.entity.Commenter;
import com.service.IArticleService;
import com.service.ICommentService;
import com.service.IMessageService;
import com.service.impl.ArticleServiceImpl;
import com.service.impl.CommentServiceImpl;
import com.service.impl.MessageServiceImpl;
import com.util.PageUtil;
/**
 * 评论入库
 * @author Administrator
 *
 */
public class CommentServlet extends BaseServlet {
	//创建评论处理服务对象
	ICommentService commentService = new CommentServiceImpl();
	//创建文章处理服务对象
	IArticleService articleService = new ArticleServiceImpl();
	//创建消息处理服务对象
	IMessageService messageService = new MessageServiceImpl();
	//创建日志对象
	private static Logger log = Logger.getLogger(CommentServlet.class);
	/**
	 * 插入评论
	 * @param request 
	 * 必要参数(article_id 文章ID,comment_content 评论内容,user_id 用户ID,) 
	 * 可设置参数(commenter_file 文件)
	 * @param response
	 * @throws IOException 
	 */
	public void insertComment(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		//创建评论javaBean用来插入数据库
		Commenter comment = new Commenter();
		
		if(request.getParameter("article_id")!=null && 
				request.getParameter("comment_content")!=null && 
				request.getParameter("user_id")!=null){
			//获取请求中的属性
			long article_id = new Long(request.getParameter("article_id"));
			String comment_content = request.getParameter("comment_content");
			long user_id = new Long(request.getParameter("user_id"));
			//设置属性
			comment.setArticle_id(article_id);
			comment.setCommenter_content(comment_content);
			comment.setCommenter_file("暂不设置");
			comment.setUser_id(user_id);
			/********** 已修改 **********/
			//请求入库
			boolean flag = commentService.insertComment(comment);
			if(flag){
				//根据文章id进行评论+1操作
				articleService.commenterArticle(article_id);
				try {
					Article article = articleService.queryArticleById(article_id);
					System.out.println("用户id"+user_id);
					if(user_id != article.getUser_id()){
						
						boolean msg_insert = messageService.insertMessage(user_id, article_id, article.getUser_id());
						if(!msg_insert){
							System.out.println("消息插入失败");
							log.warn("消息插入失败");
						}
					}
					//返回处理结果
					long count = article.getCommenter_number();
					response.getWriter().print(count);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else{
				System.out.println("评论失败");
				log.warn("评论错误");
			}
		}
		/********** 结束已修改 **********/
	}
	//----------2018-11-08---------//
	/**
	 * 查询评论通过文章id
	 * @param request
	 * 必要参数(article_id 文章ID)
	 * @param response
	 * 返回评论列表
	 * @throws IOException 
	 */
	public void queryCommentByArticleId(HttpServletRequest request, HttpServletResponse response) throws IOException{
		//获取参数
		String str = request.getParameter("currentPage");
		//判断参数是否为空
		if(str == null){
			str = "0";
		}
		//分页计算
		Integer currentPage = new Integer(str);
		Integer pageSize = new Integer(request.getParameter("pageSize"));
		PageUtil pageUtil = new PageUtil();
		pageUtil.setCurrentPage(currentPage);//因为我们写的插件是从1开始计算页面的，jQuery查询从0开始计算
		pageUtil.setPageRow(pageSize);
			//获取参数
			long article_id = new Long(request.getParameter("article_id"));
			//查询结果
			List<Commenter> comments = commentService.queryCommentByPage(article_id, 
					pageUtil.getStartRow(),pageUtil.getEndRow());
			//转成json对象
			JSONArray arr = new JSONArray(comments);
			//响应客户端
			response.getWriter().print(arr);
		
	}
}
