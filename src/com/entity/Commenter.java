package com.entity;

import java.io.Serializable;
import java.util.Date;
/**
 * 文章评论的javabean
 * @author HYZ
 *
 */
public class Commenter implements Serializable{

	/**
	 * 版本号
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 评论ID
	 */
	private long commenter_id;
	/**
	 * 评论内容
	 */
	private String commenter_content;
	/**
	 * 评论附件
	 */
	private String commenter_file;
	/**
	 * 文章ID
	 */
	private long article_id;
	/**
	 * 评论用户ID
	 */
	private long user_id;
	/**
	 * 评论日期
	 */
	private Date commenter_date;
	/**
	 * 用户名
	 */
	private String user_name;
	/**
	 * 用户头像
	 */
	private String user_head;
	public Commenter() { }

	public long getCommenter_id() {
		return commenter_id;
	}

	public void setCommenter_id(long commenter_id) {
		this.commenter_id = commenter_id;
	}

	public String getCommenter_content() {
		return commenter_content;
	}

	public void setCommenter_content(String commenter_content) {
		this.commenter_content = commenter_content;
	}

	public String getCommenter_file() {
		return commenter_file;
	}

	public void setCommenter_file(String commenter_file) {
		this.commenter_file = commenter_file;
	}

	public long getArticle_id() {
		return article_id;
	}

	public void setArticle_id(long article_id) {
		this.article_id = article_id;
	}

	public long getUser_id() {
		return user_id;
	}

	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}

	public Date getCommenter_date() {
		return commenter_date;
	}

	public void setCommenter_date(Date commenter_date) {
		this.commenter_date = commenter_date;
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

	@Override
	public String toString() {
		return "Commenter [commenter_id=" + commenter_id + ", commenter_content=" + commenter_content
				+ ", commenter_file=" + commenter_file + ", article_id=" + article_id + ", user_id=" + user_id
				+ ", commenter_date=" + commenter_date + ", user_name=" + user_name + ", user_head=" + user_head + "]";
	}

}
