package com.dao.impl;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.dao.IAllDao;
import com.entity.Article;
import com.util.DButil;

public class AllDaoImpl implements IAllDao {
	/**
	 * 解析javaBean
	 * 将一个javaBean的有用属性解析成map键值对形式
	 * @param javaBean 
	 * @return 存值map
	 */
	public static <T> Map<String,String> resolverBean(T javaBean){
		//获取字节码文件
		Class<? extends Object> clazz = javaBean.getClass();
		//得到该javaBean类所有方法
		Method[] methods = clazz.getDeclaredMethods();
		//map结果
		Map<String,String> resultMap = new HashMap<String,String>();
		//遍历方法，得到所有键值对
		for(Method method : methods){
			if(method.getName().startsWith("get")){//调用所有get方法
				try {
					//结果
					Object o = method.invoke(javaBean);
					//筛去默认初始值
					if(o != null && !o.toString().equals("0")){
						String colName = method.getName().substring(3);
						colName = colName.substring(0,1).toLowerCase()+colName.substring(1);
						//存入键值对
						resultMap.put(colName, o.toString());
					}
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
		return resultMap;
	}
	/**
	 * 编写sql语句时用于并列字段
	 * @param map 键值对
	 * @param separator 并列分割符
	 * @param params 存储参数容器
	 * @return
	 */
	private static void parataxis(Map<String,String> map, String separator, Sql_params sqlP){
		StringBuilder sql = sqlP.getSql();
		ArrayList<String> params = sqlP.getParams();
		//字段连接
		for(Entry<String, String> en : map.entrySet()){
			sql.append(" "+en.getKey()+" = ? "+separator+" ");
			//参数放入
			params.add(en.getValue());
		}
		//结尾处理
		sql.delete(sql.length()-(separator.length()+1), sql.length());
		//sql语句更新
		sqlP.setSql(sql);
	}
	/**
	 * 配置update sql 语句
	 * @param table 表名
	 * @param queryMap 查询键值对
	 * @param updateMap 更新键值对
	 * @return Sql_params 对象
	 */
	static Sql_params getUpdateSql(String table,Map<String,String> queryMap,Map<String,String> updateMap){
		//参数存储
		ArrayList<String> params = new ArrayList<String>(0);
		//编写sql语句
		StringBuilder sql = new StringBuilder("update "+table+" set");
		//创建存储
		Sql_params sqlP = new Sql_params(sql,params);
		//set段
		parataxis(updateMap, ",", sqlP);
		//where段
		sql.append(" where");
		parataxis(queryMap, "and", sqlP);
		return sqlP;
	}
	/**
	 * 配置query sql语句
	 * @param table 表名
	 * @param queryMap 查询键值对
	 * @return Sql_params对象
	 */
	//select a.*,u.user_name,u.user_head from article a,userinfo u where article_id=? and a.user_id=u.user_id
	static Sql_params getQuerySql(String table, Map<String,String> queryMap){
		//参数存储
		ArrayList<String> params = new ArrayList<String>(0);
		//编写sql语句
		StringBuilder sql = new StringBuilder("select * from "+table);
		//创建存储
		Sql_params sqlP = new Sql_params(sql,params);
		//where段
		sql.append(" where");
		parataxis(queryMap, "and", sqlP);
		return sqlP;
	}
	
	@Override
	public <T> int insert(T BeanOfinsert) {
		
		return 0;
	}
	
	@Override
	public <T> int update(T BeanOfSelect, T BeanOfupdate) {
		// TODO Auto-generated method stub
		//存放查询键值对
		Map<String,String> queryMap = resolverBean(BeanOfSelect);
		//存放修改键值对
		Map<String,String> updateMap = resolverBean(BeanOfupdate);
		//获取字节码文件
		Class<? extends Object> clazz = BeanOfSelect.getClass();
		//确定操作类型（确定表名）
		String table = clazz.getSimpleName().substring(0,1).toLowerCase()+clazz.getSimpleName().substring(1);
		//获取Sql_params对象
		Sql_params sqlP = getUpdateSql(table, queryMap, updateMap);
		//取出sql语句
		String sql = sqlP.getSql().toString();
		//取出参数
		String[] params = sqlP.getParams().toArray(new String[sqlP.getParams().size()]);
		System.out.println("更新语句："+sql);
		System.out.println(Arrays.toString(params)+params.length);
		return DButil.update(sql, params);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public <T> List<T> query(T BeanOfQuery) {
		// TODO Auto-generated method stub
		//存放查询键值对
		Map<String,String> queryMap = resolverBean(BeanOfQuery);
		//获取字节码文件
		Class<? extends Object> clazz = BeanOfQuery.getClass();
		//确定操作类型（确定表名）
		String table = clazz.getSimpleName().substring(0,1).toLowerCase()+clazz.getSimpleName().substring(1);
		//获取Sql_params对象
		Sql_params sqlP = getQuerySql(table, queryMap);
		//取出sql语句
		String sql = sqlP.getSql().toString();
		//取出参数
		String[] params = sqlP.getParams().toArray(new String[sqlP.getParams().size()]);
		return (List<T>) DButil.query(sql, clazz, params);
	}
	
	/*public static void main(String[] args) {
		Article a1 = new Article();
		Article a2 = new Article();
		a1.setArticle_id(3);
		a1.setArticle_title("agas");
		a2.setArticle_file("article");
		a2.setArticle_tag("jsp");
		int a = new AllDaoImpl().update(a1, a2);
		List<Article> s = new AllDaoImpl().query(a1);
		System.out.println(s);
	}*/
}


/**
 * 用来存储sql语句与相关参数
 * @author luyang
 *	
 */
class Sql_params{
	private StringBuilder sql;
	private ArrayList<String> params;
	
	public Sql_params(){}
	public Sql_params(StringBuilder sql, ArrayList<String> params) {
		super();
		this.sql = sql;
		this.params = params;
	}

	public StringBuilder getSql() {
		return sql;
	}
	public void setSql(StringBuilder sql) {
		this.sql = sql;
	}
	public ArrayList<String> getParams() {
		return params;
	}
	public void setParams(ArrayList<String> params) {
		this.params = params;
	}
	@Override
	public String toString() {
		return "Sql_params [sql=" + sql + ", params=" + params + "]";
	}
}
