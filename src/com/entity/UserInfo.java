package com.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
/**
 * 用户信息的javabean
 * @author HYZ
 *
 */
public class UserInfo implements Serializable{

	/**
	 * 版本号
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 用户ID
	 */
	private long user_id;
	/**
	 * 用户名
	 */
	private String user_name;
	/**
	 * 用户密码
	 */
	private String user_pwd;
	/**
	 * 用户邮箱
	 */
	private String user_email;
	/**
	 * 用户地址
	 */
	private String user_addr;
	/**
	 * 用户性别
	 */
	private String user_sex;
	/**
	 * 用户生日
	 */
	private Date user_bir;
	/**
	 * 用户类型
	 */
	private long user_type;
	/**
	 * 用户金币数量
	 */
	private long user_coin;
	/**
	 * 用户头像
	 */
	private String user_head;
	/**
	 * 粉丝数量
	 */
	private int fans_number;
	/**
	 * 关注数量
	 */
	private int follow_number;
	/**
	 * 用户积分
	 */
	private int user_score;
	/**
	 * 用户等级
	 */
	private int user_grade;
	/**
	 * 最后签到时间
	 */
	private Date sign_date;
	
	/**
	 * 空构造
	 */
	public UserInfo(){}
	public UserInfo(String head,String name,String sex,String email,long id){
		this.user_head = head;
		this.user_name= name;
		this.user_sex = sex;
		this.user_email = email;
		this.user_id = id;
	}

	public long getUser_id() {
		return user_id;
	}

	public int getFans_number() {
		return fans_number;
	}
	public void setFans_number(int fans_number) {
		this.fans_number = fans_number;
	}
	public int getFollow_number() {
		return follow_number;
	}
	public void setFollow_number(int follow_number) {
		this.follow_number = follow_number;
	}
	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_addr() {
		return user_addr;
	}

	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}

	public String getUser_sex() {
		return user_sex;
	}

	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}

	public Date getUser_bir() {
		return user_bir;
	}

	public void setUser_bir(Date user_bir) {
		this.user_bir = user_bir;
	}

	public long getUser_type() {
		return user_type;
	}

	public void setUser_type(long user_type) {
		this.user_type = user_type;
	}

	public long getUser_coin() {
		return user_coin;
	}

	public void setUser_coin(long user_coin) {
		this.user_coin = user_coin;
	}

	public String getUser_head() {
		return user_head;
	}

	public void setUser_head(String user_head) {
		this.user_head = user_head;
	}
	public int getUser_score() {
		return user_score;
	}
	public void setUser_score(int user_score) {
		this.user_score = user_score;
	}
	public int getUser_grade() {
		return user_grade;
	}
	public void setUser_grade(int user_grade) {
		this.user_grade = user_grade;
	}
	public Date getSign_date() {
		return sign_date;
	}
	public void setSign_date(Date sign_date) {
		this.sign_date = sign_date;
	}
	@Override
	public String toString() {
		return "UserInfo [user_id=" + user_id + ", user_name=" + user_name + ", user_pwd=" + user_pwd + ", user_email="
				+ user_email + ", user_addr=" + user_addr + ", user_sex=" + user_sex + ", user_bir=" + user_bir
				+ ", user_type=" + user_type + ", user_coin=" + user_coin + ", user_head=" + user_head
				+ ", fans_number=" + fans_number + ", follow_number=" + follow_number + "]";
	}

}
