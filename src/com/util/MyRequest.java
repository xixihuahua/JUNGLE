package com.util;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class MyRequest extends HttpServletRequestWrapper {

	public MyRequest(HttpServletRequest request) {
		super(request);
		// TODO Auto-generated constructor stub
	}
	 @Override
	    public String getParameter(String name) {
	        String str = super.getParameter(name);
	        if("article_title".equals(name) || "article_content".equals(name) || "comment_content".equals(name) ){
	        	System.out.println(str);
	        	List<String> list = WordsUtil.getWords();
		        for(String word : list){
		            str = str.replaceAll(word, "*");
		        }
	        }
	       if(str != null && ("article_content".equals(name)==false)  && ("comment_content".equals(name) == false)){
	    	   str = str.replace("&", "&amp;");
		    	str = str.replace("<", "&lt;");
			    str = str.replace(">", "&gt;");
		        str = str.replace("%", "&#37;");
		       
	       }
	       return str;
	    }
}
