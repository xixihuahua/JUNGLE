package com.service.impl;

import java.math.BigDecimal;
import java.util.List;

import com.dao.ICoinDao;
import com.dao.IUserInfoDao;
import com.dao.impl.CoinDaoImpl;
import com.dao.impl.UserInfoDaoImpl;
import com.entity.UserInfo;
import com.service.IUserInfoService;

public class UserInfoServiceImpl implements IUserInfoService {
	ICoinDao coinDao = new CoinDaoImpl();
	IUserInfoDao iuserinfodao = new UserInfoDaoImpl();
	/**
	 * 注册用户
	 * @param userInfo
	 * @return
	 */
	@Override
	public boolean insertUser(UserInfo userInfo) {
		return iuserinfodao.insertUser(userInfo) > 0;
	}
	/**
	 * 登录  根据用户名密码查找
	 * @param user_name 用户名
	 * @param user_pwd 密码
	 * @return
	 */
	@Override
	public UserInfo queryUserByLogin(String user_name, String user_pwd) {
		return iuserinfodao.queryUserByLogin(user_name, user_pwd);
	}
	
	@Override
	public boolean changeMessage(UserInfo userInfo){
		return iuserinfodao.updateUser2(userInfo) > 0;
	}
	/**
	 * 根据用户名精确查找用户
	 * @param user_name 用户名
	 * @return 用户
	 */
	@Override
	public UserInfo queryUserByUserName(String user_name) {
		// TODO Auto-generated method stub
		return iuserinfodao.queryUserByUserName(user_name);
	}
	//-------11-09------//
	/**
	 * 通过用户id查询用户
	 * @param user_id
	 * @return
	 */
	@Override
	public UserInfo queryUserById(long user_id){
		return iuserinfodao.queryUserById((int)user_id);
	}
	@Override
	public boolean ifRelationship(int follow_id, int fans_id) {
		// TODO Auto-generated method stub
		return iuserinfodao.ifRelationship(follow_id, fans_id).intValue()>0;
	}
	@Override
	public boolean insertRelationship(int follow_id, int user_id) {
		// TODO Auto-generated method stub
		return iuserinfodao.insertRelationship(follow_id, user_id)>0;
	}
	@Override
	public BigDecimal queryFansCountByUserId(int user_id) {
		// TODO Auto-generated method stub
		return iuserinfodao.queryFansCountByUserId(user_id);
	}
	@Override
	public BigDecimal queryFollowCountByUserId(int user_id) {
		// TODO Auto-generated method stub
		return iuserinfodao.queryFollowCountByUserId(user_id);
	}
	@Override
	public List<UserInfo> queryFansByUserId(long user_id, long startRow, long endRow) {
		// TODO Auto-generated method stub
		return iuserinfodao.queryFansByUserId(user_id, startRow, endRow);
	}
	@Override
	public List<UserInfo> queryFollowByUserId(long user_id, long startRow, long endRow) {
		// TODO Auto-generated method stub
		return iuserinfodao.queryFollowByUserId(user_id, startRow, endRow);
	}
	@Override
	public List<UserInfo> alluser(long startRow, long endRow) {
		// TODO Auto-generated method stub
		return iuserinfodao.alluser(startRow,endRow);
	}
	@Override
	public BigDecimal alluserNumber() {
		// TODO Auto-generated method stub
		return iuserinfodao.alluserNumber();
	}
	@Override
	public BigDecimal allAdminNumber() {
		// TODO Auto-generated method stub
		return iuserinfodao.allAdminNumber();
	}
	@Override
	public List<UserInfo> allAdmin(long startRow, long endRow) {
		// TODO Auto-generated method stub
		return iuserinfodao.allAdmin(startRow, endRow);
	}
	@Override
	public boolean signDate(long user_id) {
		// TODO Auto-generated method stub
		return iuserinfodao.signDate(user_id)>0;
	}
	@Override
	public boolean addAdmin(long user_id) {
		// TODO Auto-generated method stub
		return iuserinfodao.addAdmin(user_id) > 0;
	}
	@Override
	public boolean deleAdmin(long user_id) {
		// TODO Auto-generated method stub
		return iuserinfodao.deleAdmin(user_id) > 0;
	}
	@Override
	public boolean updateUser_Admin(UserInfo userinfo) {
		// TODO Auto-generated method stub
		return iuserinfodao.updateUser_Admin(userinfo) > 0;
	}
	@Override
	public boolean deleteUser_Admin(long user_id) {
		// TODO Auto-generated method stub
		return iuserinfodao.deleteUser_Admin(user_id) > 0;
	}
	@Override
	public boolean admin_insertUser(UserInfo userInfo) {
		// TODO Auto-generated method stub
		return iuserinfodao.admin_insertUser(userInfo) > 0;
	}
	@Override
	public List<UserInfo> queryDim(long startRow, long endRow, String str) {
		// TODO Auto-generated method stub
		return iuserinfodao.queryDim(startRow, endRow, str);
	}
	@Override
	public BigDecimal queryDimBig(String str) {
		// TODO Auto-generated method stub
		return iuserinfodao.queryDimBig(str);
	}
	@Override
	public BigDecimal queryScore(long user_id) {
		// TODO Auto-generated method stub
		return iuserinfodao.queryScore(user_id);
	}
	@Override
	public BigDecimal queryGrade(long user_id) {
		// TODO Auto-generated method stub
		return iuserinfodao.queryGrade(user_id);
	}
	@Override
	public boolean updateScore(long user_id) {
		// TODO Auto-generated method stub
		return iuserinfodao.updateScore(user_id)>0;
	}
	@Override
	public int payCoin(long user_id, long Coin) {
		// TODO Auto-generated method stub
		return coinDao.payCoin(user_id, Coin);
	}
}
