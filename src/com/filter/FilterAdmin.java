package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.UserInfo;

public class FilterAdmin implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		//向下转型
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		
		if(req.getRequestURI().equals(req.getContextPath()+"/admin/admin.jsp")){
			UserInfo userinfo = (UserInfo) req.getSession().getAttribute("userinfo");
			
			if(userinfo != null && (userinfo.getUser_type() == 0l || userinfo.getUser_type() == 1l )){
				//通过过滤器链对请求进行放行
				chain.doFilter(request, response);
			}else{
				resp.sendRedirect(req.getContextPath()+"/error404.jsp");
			}
		}else{
			resp.sendRedirect(req.getContextPath()+"/error404.jsp");
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	
}
