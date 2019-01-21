package com.dao;

import java.math.BigDecimal;
import java.util.List;

import com.entity.Article;
import com.entity.UserInfo;

public interface IUserInfoDao {
	/**
	 * 添加用户
	 * @param userInfo 用户对象
	 * @return
	 */
	int insertUser(UserInfo userInfo);
	/**
	 * 更改用户信息
	 * @param userInfo 用户对象
	 * @return 受影响行数
	 */
	int updateUser(UserInfo userInfo);
	int updateUser2(UserInfo userInfo);
	/**
	 * 根据用户id查找用户
	 * @param user_id 用户id
	 * @return 受影响行数
	 */
	UserInfo queryUserById(int user_id);
	/**
	 * 根据关注者id查找用户
	 * @param user_id 用户id
	 * @return 用户对象
	 */
	List<UserInfo> queryUserByFollow(int user_id);
	/**
	 * 根据粉丝id查找用户
	 * @param user_id 用户id
	 * @return 用户对象列表
	 */
	List<UserInfo> queryUserByFans(int user_id);
	/**
	 * 根据用户名查找用户
	 * @param keyWord 关键词
	 * @return 用户对象列表
	 */
	List<UserInfo> queryUserByKeyWord(String keyWord);
	/**
	 * 根据用户名密码查找，用于登陆
	 * @param user_name 用户名
	 * @param user_pwd 密码
	 * @return 用户对象
	 */
	UserInfo queryUserByLogin(String user_name,String user_pwd);
	/**
	 * 根据用户名精确查找用户
	 * @param user_name
	 * @return
	 */
	 UserInfo queryUserByUserName(String user_name);
	 //----2018-11-09-----//
	 /**
	 * 是否已经关注
	 * @param article_id
	 * @param user_id
	 * @return
	 */
	 BigDecimal ifRelationship(int follow_id,int fans_id);
	 /**
	  * 插入关注关系
	  * @param follow_id
	  * @param user_id
	  * @return
	  */
	 int insertRelationship(int follow_id,int user_id);
	 
	 /**
	  * 根据用户id查询该用户粉丝数量
	  * @param user_id
	  * @return
	  */
	 BigDecimal queryFansCountByUserId(int user_id);
	 /**
	  * 根据用户id查询该用户关注数量
	  * @param user_id
	  * @return
	  */
	 BigDecimal queryFollowCountByUserId(int user_id);
	 /**
	  * 分页查询粉丝列表
	  * @param user_id
	  * @param startRow
	  * @param endRow
	  * @return
	  */
	 List<UserInfo> queryFansByUserId(long user_id,  long startRow, long endRow);
	 /**
	  * 分页查询关注列表
	  * @param user_id
	  * @param startRow
	  * @param endRow
	  * @return
	  */
	 List<UserInfo> queryFollowByUserId(long user_id,  long startRow, long endRow);
	 
	 /**
	  * 查询所有用户
	  * @return
	  */
	 List<UserInfo> alluser(long startRow, long endRow);
	 
	 /**
	  * 查询所有用户总数
	  * @return
	  */
	 BigDecimal alluserNumber();
	 
	 /**
	  * 查询所有管理员总数
	  * @return
	  */
	 BigDecimal allAdminNumber();
	 
	 /**
	  * 查询所有管理员
	  * @return
	  */
	 List<UserInfo> allAdmin(long startRow, long endRow);
	 
	 /**
	  * 更新最后签到时间
	  * @param user_id
	  * @return
	  */
	 int signDate(long user_id);
	 
	 /**
	  * 增加管理员
	  * @param user_id
	  * @return
	  */
	 int addAdmin(long user_id);
	 
	 /**
	  * 删除管理员
	  * @param user_id
	  * @return
	  */
	 int deleAdmin(long user_id);
	 
	 /**
	  * 管理员页面修改用户信息
	  * @param user_id
	  * @return
	  */
	 int updateUser_Admin(UserInfo userinfo);
	 
	 /**
	  * 管理员页面删除用户
	  * @param user_id
	  * @return
	  */
	 int deleteUser_Admin(long user_id);
	 
	 /**
		 * 添加用户-管理员页面
		 * @param userInfo 用户对象
		 * @return
		 */
	int admin_insertUser(UserInfo userInfo);
	
	/**
	 * 模糊查询用户的方法
	 * @param str
	 * @param startRow
	 * @param endRow
	 * @return
	 */
	List<UserInfo> queryDim(long startRow, long endRow,String str);
	
	/**
	 * 模糊查询用户数的方法
	 * @param str
	 * @param startRow
	 * @param endRow
	 * @return
	 */
	BigDecimal queryDimBig(String str);
	/**
	 * 查询积分
	 * @param user_id
	 * @return
	 */
	BigDecimal queryScore(long user_id);
	/**
	 * 查询等级
	 * @param user_id
	 * @return 
	 */
	BigDecimal queryGrade(long user_id);
	/**
	 * 更新等级和积分
	 * @param user_id
	 * @return
	 */
	int updateScore(long user_id);
}
