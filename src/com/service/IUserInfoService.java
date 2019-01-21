package com.service;

import java.math.BigDecimal;
import java.util.List;

import com.entity.UserInfo;
/**
 * userinfo 的service层接口
 * @author Administrator
 *
 */
public interface IUserInfoService {
	/**
	 * 注册用户
	 * @param userInfo 用户的实体类
	 * @return
	 */
	boolean insertUser(UserInfo userInfo);
	
	/**
	 * 登录  根据用户名密码查找
	 * @param user_name 用户名
	 * @param user_pwd 密码
	 * @return
	 */
	UserInfo queryUserByLogin(String user_name,String user_pwd);
	boolean changeMessage(UserInfo userinfo);
	/**
	 * 根据用户名精确查找用户
	 * @param user_name
	 * @return
	 */
	UserInfo queryUserByUserName(String user_name);
	
	//--------11-09-----//
	/**
	 * 通过用户id查询用户
	 * @param user_id
	 * @return
	 */
	UserInfo queryUserById(long user_id);
	 /**
	 * 是否已经关注
	 * @param article_id
	 * @param user_id
	 * @return
	 */
	 boolean ifRelationship(int follow_id,int fans_id);
	 /**
	  * 插入关注关系
	  * @param follow_id
	  * @param user_id
	  * @return
	  */
	 boolean insertRelationship(int follow_id,int user_id);
	 
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
	 boolean signDate(long user_id);
	 
	 /**
	  * 增加管理员
	  * @param user_id
	  * @return
	  */
	 boolean addAdmin(long user_id);
	 
	 /**
	  * 删除管理员
	  * @param user_id
	  * @return
	  */
	 boolean deleAdmin(long user_id);
	 
	 /**
	  * 管理员功能-修改用户信息
	  * @param userinfo
	  * @return
	  */
	 boolean updateUser_Admin(UserInfo userinfo);
	 
	 /**
	  * 管理员页面删除用户
	  * @param user_id
	  * @return
	  */
	 boolean deleteUser_Admin(long user_id);
	 
	 /**
	 * 添加用户-管理员页面
	 * @param userInfo 用户对象
	 * @return
	 */
	boolean admin_insertUser(UserInfo userInfo);
	
	 /**
		 * 根据关键字模糊查询
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
		boolean updateScore(long user_id);
		/**
		 * 用户充值
		 * @param user_id
		 * @param Coin
		 * @return
		 */
		int payCoin(long user_id,long Coin);
}
