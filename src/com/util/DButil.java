package com.util;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.mchange.v2.c3p0.ComboPooledDataSource;
/**
 * 工具类，用于数据库连接的增删改查
 * @author HYZ
 *
 */
public class DButil {
	private static ComboPooledDataSource dataSource = null;
	static{
		dataSource = new ComboPooledDataSource();
	}
	
	/**
	 * 获取数据库连接
	 * @return
	 */
	public static Connection getConn(){
		//1. 创建connection 对象
		Connection conn = null;
			try {
				conn = dataSource.getConnection();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return conn;
	}
	/**
	 * 增删改：用户，文章，评论
	 * @param sql 查询语句
	 * @param args 参数列表
	 * @return 受影响行数
	 */
	public static int update(String sql,String...args){
		QueryRunner qr = new QueryRunner();
		Connection conn = DButil.getConn();
		int num = 0;
		try {
			num = qr.update(conn, sql, args);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return num;
	}
	/**
	 * 根据id获取：用户，文章，评论
	 * @param sql 查询语句
	 * @param clazz 返回值类型
	 * @param args 参数列表
	 * @return 查找结果对象
	 */
	public static <T> T queryById(String sql,Class<T> clazz,long args){
		QueryRunner qr = new QueryRunner();
		Connection conn = null;
		conn = DButil.getConn();
		T t = null;
		try {
			t = qr.query(conn, sql, 
					new BeanHandler<T>(clazz), args);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			if(conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
		return t;
	}
	/**
	 * 查询操作
	 * @param sql
	 * @param clazz
	 * @param params
	 * @return List<javaBean类型>
	 */
	public static <T> List<T> query(String sql,Class<T> clazz,String... params){
		QueryRunner qr = new QueryRunner();
		Connection conn = null;
		conn = DButil.getConn();
		List<T> result = null;
		try {
			result = qr.query(conn, sql, new BeanListHandler<T>(clazz), params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	/**
	 * 根据用户id获取：用户，文章，评论
	 * @param sql 查询语句
	 * @param clazz 返回值类型
	 * @param args 参数列表
	 * @return 查找结果对象列表
	 */
	public static <T> List<T> queryByUserId(String sql,Class<T> clazz,String... args){
		QueryRunner qr = new QueryRunner();
		Connection conn = null;
		conn = DButil.getConn();
		List<T> list = null;
		try {
			list = qr.query(conn, sql, 
					new BeanListHandler<T>(clazz), args);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			if(conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
		return list;
	}
	/**
	 * 根据关键词查找：用户，文章，评论
	 * @param sql 查询语句
	 * @param clazz 返回值类型
	 * @param args 参数列表
	 * @return 查找结果对象列表
	 */
	public static <T> List<T> queryByKeyWord(String sql,Class<T> clazz,String... args){
		QueryRunner qr = new QueryRunner();
		Connection conn = null;
		conn = DButil.getConn();
		List<T> list = null;
		try {
			list = qr.query(conn, sql, 
					new BeanListHandler<T>(clazz), args);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			if(conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return list;
	}
	/**
	 * 获取总数：用户，文章，评论
	 * @param sql 查询语句
	 * @param args 参数列表
	 * @return 查找结果对象
	 */
	public static BigDecimal queryCount(String sql,String... args){
		QueryRunner qr = new QueryRunner();
		Connection conn = null;
		conn = DButil.getConn();
		BigDecimal count = null;
		try {
			count = qr.query(conn, sql, 
					new ScalarHandler<BigDecimal>(), args);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			if(conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
		return count;
	}
	/**
	 * 根据登陆信息查找
	 * @param sql 查询语句
	 * @param clazz 返回值类型
	 * @param args 参数列表
	 * @return 查找结果对象
	 */
	public static <T> T queryByLogin(String sql,Class<T> clazz,String... args){
		QueryRunner qr = new QueryRunner();
		Connection conn = null;
		conn = DButil.getConn();
		T t = null;
		try {
			t = qr.query(conn, sql, 
					new BeanHandler<T>(clazz), args);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			if(conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return t;
	}
}
