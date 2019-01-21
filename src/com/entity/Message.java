package com.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Message implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 消息id
	 */
	private long msg_id;
	/**
	 * 相关用户id
	 */
	private long this_user_id;
	/**
	 * 评论用户id
	 */
	private long user_id;
	/**
	 * 评论用户名称
	 */
	private String user_name;
	/**
	 * 评论用户头像
	 */
	private String user_head;
	/**
	 * 相关文章id
	 */
	private long article_id;
	
	private String article_title;
	/**
	 * 消息是否已读
	 */
	private long msg_type;
	/**
	 * 消息写入日期
	 */
	private Date msg_date;
	public Message(){}
	public long getMsg_id() {
		return msg_id;
	}
	public void setMsg_id(long msg_id) {
		this.msg_id = msg_id;
	}
	public long getThis_user_id() {
		return this_user_id;
	}
	public void setThis_user_id(long this_user_id) {
		this.this_user_id = this_user_id;
	}
	public long getUser_id() {
		return user_id;
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
	public String getUser_head() {
		return user_head;
	}
	public void setUser_head(String user_head) {
		this.user_head = user_head;
	}
	public long getArticle_id() {
		return article_id;
	}
	public void setArticle_id(long article_id) {
		this.article_id = article_id;
	}
	public String getArticle_title() {
		return article_title;
	}
	public void setArticle_title(String article_title) {
		this.article_title = article_title;
	}
	public long getMsg_type() {
		return msg_type;
	}
	public void setMsg_type(long msg_type) {
		this.msg_type = msg_type;
	}
	public Date getMsg_date() {
		return msg_date;
	}
	public void setMsg_date(Date msg_date) {
		this.msg_date = msg_date;
	}
	@Override
	public String toString() {
		return "Message [msg_id=" + msg_id + ", this_user_id=" + this_user_id + ", user_id=" + user_id + ", user_name="
				+ user_name + ", user_head=" + user_head + ", article_id=" + article_id + ", article_title="
				+ article_title + ", msg_type=" + msg_type + ", msg_date=" + msg_date + "]";
	}

	

}
