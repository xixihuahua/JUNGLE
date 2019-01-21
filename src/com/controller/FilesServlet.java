package com.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;

import com.dao.IAllDao;
import com.dao.impl.AllDaoImpl;
import com.entity.Coin;
import com.entity.Files;
import com.entity.UserInfo;
import com.service.IFilesService;
import com.service.IUserInfoService;
import com.service.impl.FilesServiceImpl;
import com.service.impl.UserInfoServiceImpl;

public class FilesServlet extends BaseServlet {
	//文件处理对象
	IFilesService filesService = new FilesServiceImpl();
	//创建日志对象
	private static Logger log = Logger.getLogger(FilesServlet.class);
	//javaBean处理
	IAllDao allDao = new AllDaoImpl();
	//创建用户处理对象
	IUserInfoService userinfo = new UserInfoServiceImpl();
	
	/**
	 * 查询文件通过文件路径
	 * @param request
	 * @param response
	 */
	public void queryFileBySrc(HttpServletRequest request,HttpServletResponse response){
		//判断参数是否为空
		if(request.getParameter("Files_src") != null){
			//参数存值
			String dir = request.getParameter("Files_src");
			//查询文件
			Files files = filesService.queryFileBySrc(dir);
			//文件存入request
			request.setAttribute("files", files);
			try {
				//页面跳转
				request.getRequestDispatcher("article.jsp").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println("文件路径为空");
		log.warn("查询文件时，文件路径为空");
	}
	/**
	 * 处理下载请求
	 * @param request
	 * @param response
	 */
	public void download(HttpServletRequest request,HttpServletResponse response){
		//判断参数是否为空
		if(request.getParameter("file_id") != "" && request.getParameter("user_id") != ""){
			//获取参数
			long file_id = new Long(request.getParameter("file_id"));
			long user_id = new Long(request.getParameter("user_id"));
			Files file = filesService.queryFileById(file_id);
			String basePath = file.getFile_src();
			//确认是否已购买
			Coin coin = new Coin();
			long article_id = file.getArticle_id();
			coin.setArticle_id(article_id);
			coin.setUser_id(user_id);
			//查询交易记录(用户id 文章id)
			boolean flag = false;
			List<Coin> coins = allDao.query(coin);
			if(coins.size() > 0){//查询到交易记录
				coin = coins.get(0);
				System.out.println("下载处理,文章附件已购买");
				//已购买，无须再次支付
				flag = true;
			}else if(coins.size() == 0){//未购买
				//扣钱
				flag = (filesService.downloadFile(file, user_id)!=-1);
				//更新用户信息
				UserInfo user = userinfo.queryUserById(user_id);
				request.getSession().setAttribute("userinfo", user);
				System.out.println("扣钱"+flag);
			}else{
				flag = false;
				System.out.println("查询交易记录参数错误");
			}
			if(basePath != null && flag == true){//判断参数是否为空
				try {
					//获取输入流
					FileInputStream input = new FileInputStream(basePath);
					//获取文件名
					String filename = basePath.substring(basePath.lastIndexOf(File.separator)+1);
					//设置响应头
					response.setHeader("content-disposition",  "attachment;filename=" +  URLEncoder.encode(filename, "UTF-8"));
					//获取输出流
					OutputStream output = response.getOutputStream();
					IOUtils.copy(input, output);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else{
				log.info("金币扣除错误");
			}
		}else{
			log.info("下载参数错误");
		}
	}
}
