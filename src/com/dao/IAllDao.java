package com.dao;

import java.util.List;

public interface IAllDao {
	/**
	 * 更新操作
	 * @param <T>javabean 类型
	 * @param BeanOfSelect 用于查找的javabean对象
	 * @param BeanOfupdate 用于更新数据的javabean对象
	 * @return
	 */
	 <T> int update(T BeanOfSelect, T BeanOfupdate);
	 /**
	  * 插入操作
	  * @param <T>javabean 类型
	  * @param BeanOfinsert 用于插入的javabean对象
	  * @return
	  */
	 <T> int insert(T BeanOfinsert);
	 /**
	  * 查询操作
	  * @param BeanOfQuery 含有查询字段的Bean对象
	  * @return
	  */
	 <T> List<T> query(T BeanOfQuery);
}
