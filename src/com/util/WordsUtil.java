package com.util;

import java.util.ArrayList;
import java.util.List;

public class WordsUtil {
	 private static List<String> list = new ArrayList<String>();
	    static{
	        //这里应该从数据库中导入敏感词的，我在这里就直接用词来模拟了
	        list.add("骂人");
	        list.add("sb");
	        list.add("傻逼");
	        list.add("杂种");
	        list.add("习近平");
	        list.add("草");
	        list.add("你妈");
	        list.add("狗");
	        list.add("你大爷");
	        list.add("老马");
	    }
	    public static List<String> getWords(){
	        return list;
	    }
	    public static void reBuild(){
	       //把list中的内容存储到数据库---每一段时间存储一次
	    }
}
