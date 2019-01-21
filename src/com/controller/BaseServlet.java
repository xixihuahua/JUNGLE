package com.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class BaseServlet extends HttpServlet{
	//生成日志对象
	Logger log = Logger.getLogger(BaseServlet.class);
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//获取请求的方法参数
		String methodName = request.getParameter("method");
		if(methodName != null){
			//获取被访问的servlet的字节码文件
			Class clazz = this.getClass();
			try {
				//获取提交上来的参数中的方法名对应的方法
				Method m = clazz.getDeclaredMethod(methodName, HttpServletRequest.class,HttpServletResponse.class);
				if(m!=null){
					//通过反射调用需要执行的对应的方法
					m.invoke(this, request,response);
				}else{
					log.warn("用户请求没有提供方法参数");
				}
			} catch (NoSuchMethodException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
