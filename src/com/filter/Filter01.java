package com.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.MyRequest;
import com.util.WordsUtil;

public class Filter01 implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		arg0.setCharacterEncoding("utf-8");
		MyRequest req = new MyRequest((HttpServletRequest)arg0);
		HttpServletResponse response = (HttpServletResponse)arg1;
		
		response.setCharacterEncoding("utf-8");
		
		if(req != null && arg1 != null){
			chain.doFilter(req, arg1);
		}
	}
	public String filterString(String str){
        List<String> list = WordsUtil.getWords();
        for(String word : list){
            str = str.replaceAll(word, "*");
        }
        return str;
	}
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
	}

}
