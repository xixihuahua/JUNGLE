package com.dao.impl;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.dao.IUserInfoDao;
import com.entity.Article;
import com.entity.UserInfo;
import com.util.DButil;
/**
 * 用户信息dao实现类
 * @author HYZ
 *
 */
public class UserInfoDaoImpl implements IUserInfoDao {
/*	USER_ID    NUMBER                                 
	USER_NAME  VARCHAR2(30) Y                         
	USER_PWD   VARCHAR2(30) Y                         
	USER_EMAIL VARCHAR2(30) Y                         
	USER_ADDR  VARCHAR2(50) Y        '北京'                
	USER_SEX   VARCHAR2(3)  Y        '男'                 
	USER_BIR   DATE         Y        sysdate          
	USER_TYPE  NUMBER       Y        2                
	USER_COIN  NUMBER       Y      */ 
	@Override
	public int insertUser(UserInfo userInfo) {
		String sql = "insert into userinfo (user_id,user_name,user_pwd,user_email)"
				+ " values (user_id_seq.nextval,?,?,?)";
		return DButil.update(sql, userInfo.getUser_name(),userInfo.getUser_pwd(),userInfo.getUser_email());
	}
	/**
	 * 需修改，该方法需先获取数据库已填写信息
	 * 
	 **/
	@Override
	public int updateUser(UserInfo userInfo) {
		String sql = "update userinfo set user_name=?,user_pwd=?,user_email=?,user_addr=?,user_sex=?,user_bir=?,user_head=?"
				+ " where user_id=?";
		return DButil.update(sql, userInfo.getUser_name(),userInfo.getUser_pwd(),userInfo.getUser_email(),
								userInfo.getUser_addr(),userInfo.getUser_sex(),userInfo.getUser_bir()+"",userInfo.getUser_head(),userInfo.getUser_id()+"");
	}
	
	@Override
	public int updateUser2(UserInfo userInfo) {
		String sql = "update userinfo set user_name=?,user_email=?,user_sex=?,user_head=?"
				+ " where user_id=?";
		
		return DButil.update(sql, userInfo.getUser_name(),userInfo.getUser_email(),
								userInfo.getUser_sex(),userInfo.getUser_head(),userInfo.getUser_id()+"");
	}

	@Override
	public UserInfo queryUserById(int user_id) {
		String sql = "select * from userinfo where user_id =?";
		return DButil.queryById(sql, UserInfo.class, user_id);
	}

	@Override
	public List<UserInfo> queryUserByFollow(int user_id) {
		String sql = "select u.* from userinfo u,relationship r  where r.follow_id = ? and r.fans_id=u.user_id order by u.user_id desc";
		return DButil.queryByUserId(sql, UserInfo.class, user_id+"");
	}

	@Override
	public List<UserInfo> queryUserByFans(int user_id) {
		String sql = "select u.* from userinfo u,relationship r  where r.fans_id = ? and r.relationship_id=u.user_id order by u.user_id desc";
		return DButil.queryByUserId(sql, UserInfo.class, user_id+"");
	}

	@Override
	public List<UserInfo> queryUserByKeyWord(String keyWord) {
		String sql = "select * from userinfo where user_name like '%?%' order by user_id desc";
		return DButil.queryByKeyWord(sql, UserInfo.class, keyWord);
	}

	@Override
	public UserInfo queryUserByLogin(String user_name, String user_pwd) {
		String sql = "select * from userinfo where user_name=? and user_pwd=? ";
		return DButil.queryByLogin(sql, UserInfo.class, user_name,user_pwd);
	}
	@Override
	public UserInfo queryUserByUserName(String user_name) {
		String sql = "select * from userinfo where user_name=?";
		return DButil.queryByLogin(sql, UserInfo.class, user_name);
	}
	//------11-09-----//
	@Override
	public BigDecimal ifRelationship(int follow_id, int fans_id) {
		String sql  = "select count(*) from relationship where follow_id=? and fans_id=? ";
		return DButil.queryCount(sql,follow_id+"",fans_id+"");
	}
	@Override
	public int insertRelationship(int follow_id, int user_id) {
		Connection conn = DButil.getConn();
		QueryRunner qr = new QueryRunner();
		try {
			conn.setAutoCommit(false);
			//先对关注数量进行更新
			String sqlUserinfoFollow = "update userinfo set follow_number =follow_number+1 where user_id=?";
			//对粉丝数量进行更新
			String sqlUserinfoFans = "update userinfo set fans_number =fans_number+1 where user_id=?";
			String sqlRelationship = "insert into relationship (follow_id,fans_id) values (?,?)";
			String sqlifRelationship = "select count(*) from relationship where follow_id=? and fans_id=? ";
			//如果关注，则取消关注，如果未关注则关注
			BigDecimal queryif = qr.query(conn, sqlifRelationship,new ScalarHandler<BigDecimal>(),follow_id+"", user_id+"");
			System.out.println(queryif);
			if (queryif.intValue()>0){
				sqlUserinfoFollow = "update userinfo set follow_number =follow_number-1 where user_id=?";
				sqlUserinfoFans = "update userinfo set fans_number =fans_number-1 where user_id=?";
				sqlRelationship = "delete from relationship where follow_id=? and fans_id=?";
				System.out.println("count>0");
			}
			if(qr.execute(conn,sqlUserinfoFollow, user_id+"") <= 0){
				conn.rollback();
				return -1;
			}
			//往文章表中修改关注数量
			if(qr.execute(conn,sqlUserinfoFans, follow_id+"")<=0){
				conn.rollback();
				return -1;
			}
			if(qr.execute(conn,sqlRelationship, follow_id+"",user_id+"")>0){
				conn.commit();//如果都成功的话  就提交数据库
				conn.close();
				return 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(conn != null){
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return -1;
	}
	@Override
	public BigDecimal queryFansCountByUserId(int user_id) {
		String sql = "select count(*) from relationship where follow_id=?";
		return DButil.queryCount(sql, user_id+"");
	}
	@Override
	public BigDecimal queryFollowCountByUserId(int user_id) {
		String sql = "select count(*) from relationship where fans_id=?";
		return DButil.queryCount(sql, user_id+"");
	}
	@Override
	public List<UserInfo> queryFansByUserId(long user_id, long startRow, long endRow) {
		String sql = "select tt.* from "
				+"(select t.*,rownum rn from "
				+"(select u.* from userinfo u,relationship r"
				+" where u.user_id=r.fans_id and r.follow_id=? order by u.user_id desc) t) tt "
				+" where tt.rn between ? and ?";
		return DButil.queryByUserId(sql, UserInfo.class, user_id+"",startRow+"",endRow+"");
	}
	@Override
	public List<UserInfo> queryFollowByUserId(long user_id, long startRow, long endRow) {
		String sql = "select tt.* from "
				+"(select t.*,rownum rn from "
				+"(select u.* from userinfo u,relationship r"
				+" where u.user_id=r.follow_id and r.fans_id=? order by u.user_id desc) t) tt "
				+"where tt.rn between ? and ?";
		return DButil.queryByUserId(sql, UserInfo.class, user_id+"",startRow+"",endRow+"");
	}

	@Override
	public List<UserInfo> alluser(long startRow, long endRow) {
		String sql = "select tt.* from "
				+"(select t.*,rownum rn from "
				+"(select * from userinfo) t) tt "
				+"where tt.rn between ? and ?";
		return DButil.queryByUserId(sql, UserInfo.class,startRow+"",endRow+"");
	}
	@Override
	public BigDecimal alluserNumber() {
		String sql = "select count(*) from userinfo";
		return DButil.queryCount(sql);
	}
	@Override
	public BigDecimal allAdminNumber() {
		// TODO Auto-generated method stub
		String sql = "select count(*) from userinfo where user_type = 1 order by userinfo.sign_date desc";
		return DButil.queryCount(sql);
	}
	@Override
	public List<UserInfo> allAdmin(long startRow, long endRow) {
		// TODO Auto-generated method stub
		String sql = "select tt.* from "
				+"(select t.*,rownum rn from "
				+"(select * from userinfo where user_type = 1 order by userinfo.sign_date desc) t) tt "
				+"where tt.rn between ? and ?";
		return DButil.queryByUserId(sql, UserInfo.class,startRow+"",endRow+"");
	}
	@Override
	public int signDate(long user_id) {
		String sql = "update userinfo set sign_date=sysdate,user_coin=user_coin+10 where user_id=?";
			return	DButil.update(sql,user_id+"");
	}
	@Override
	public int addAdmin(long user_id) {
		// TODO Auto-generated method stub
		String sql = "update userinfo set userinfo.user_type = 1 where userinfo.user_id = ?";
		return DButil.update(sql, user_id+"");
	}
	@Override
	public int deleAdmin(long user_id) {
		// TODO Auto-generated method stub
		String sql = "update userinfo set userinfo.user_type = 2 where userinfo.user_id = ?";
		return DButil.update(sql, user_id+"");
	}
	@Override
	public int updateUser_Admin(UserInfo userinfo) {
		// TODO Auto-generated method stub
		String sql = "update userinfo set userinfo.user_name = ?,userinfo.user_pwd = ?,"
				+"userinfo.user_sex = ?,userinfo.user_coin = ? where userinfo.user_id = ?";
		return DButil.update(sql, userinfo.getUser_name(),userinfo.getUser_pwd()+"",userinfo.getUser_sex(),userinfo.getUser_coin()+"",userinfo.getUser_id()+"");
	}
	@Override
	public int deleteUser_Admin(long user_id) {
		// TODO Auto-generated method stub
		String sql = "delete userinfo where userinfo.user_id= ?";
		return DButil.update(sql, user_id+"");
	}
	@Override
	public int admin_insertUser(UserInfo userInfo) {
		// TODO Auto-generated method stub
		String sql = "insert into userinfo (user_id,user_name,user_pwd,user_email,user_sex,user_coin)"
				+ " values (user_id_seq.nextval,?,?,?,?,?)";
		return DButil.update(sql, userInfo.getUser_name(),userInfo.getUser_pwd(),userInfo.getUser_email(),userInfo.getUser_sex(),userInfo.getUser_coin()+"");
	}
	@Override
	public List<UserInfo> queryDim(long startRow, long endRow, String str) {
		String sql = "select tt.* from "
			       +"(select t.*,rownum rn from "
			        +"(select * from userinfo where user_name like ? order by user_id desc) t) tt " 
						+"	where tt.rn between ? and ?";
		return DButil.queryByKeyWord(sql,UserInfo.class,"%"+str+"%",startRow+"",endRow+"");
	}
	@Override
	public BigDecimal queryDimBig(String str) {
		String sql = "select count(*) from userinfo where user_name like ? ";
		return DButil.queryCount(sql,"%"+str+"%");
	}
	@Override
	public BigDecimal queryScore(long user_id) {
		String sql = "select user_score from userinfo where user_id =?";
		return DButil.queryCount(sql,user_id+"");
	}
	@Override
	public BigDecimal queryGrade(long user_id) {
		String sql = "select user_grade from userinfo where user_id =?";
		return DButil.queryCount(sql,user_id+"");
	}
	@Override
	public int updateScore(long user_id) {
		String sql = "update userinfo set user_score =user_score +10 ,user_grade = floor( (user_score+10)/100 )  where userinfo.user_id = ?";
		return DButil.update(sql, user_id+"");
	}
}
