package com.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
/**
 * 文章的javabean
 * @author HYZ
 *
 */
public class Article implements Serializable{

	/**
	 * 版本号
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 文章ID
	 */
	private long article_id;
	/**
	 * 文章标题
	 */
	private String article_title;
	/**
	 * 文章内容
	 */
	private String article_content;
	/**
	 * 文章是否可见
	 */
	private boolean article_visible;
	/**
	 * 文章附带文件路径
	 */
	private String article_file;
	/**
	 * 文章对应用户ID
	 */
	private long user_id;
	/**
	 * 文章对应用户名
	 */
	private String user_name;
	/**
	 * 文章标签
	 */
	private String article_tag;
	/**
	 * 发布日期
	 */
	private Date article_date;
	/**
	 * 用户头像
	 */
	private String user_head;
	/**
	 * 浏览次数
	 */
	private long article_bro;
	/**
	 * 评论数量
	 */
	private long commenter_number;
	/**
	 * 点赞数量
	 */
	private long agree_number;
	/**
	 * 收藏数量
	 */
	private long collection_number;
	public Article() { }

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

	public String getArticle_content() {
		return article_content;
	}

	public void setArticle_content(String article_content) {
		this.article_content = article_content;
	}

	public boolean isArticle_visible() {
		return article_visible;
	}

	public void setArticle_visible(boolean article_visible) {
		this.article_visible = article_visible;
	}

	public String getArticle_file() {
		return article_file;
	}

	public void setArticle_file(String article_file) {
		this.article_file = article_file;
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
	
	public String getArticle_tag() {
		return article_tag;
	}

	public void setArticle_tag(String article_tag) {
		this.article_tag = article_tag;
	}

	public Date getArticle_date() {
		return article_date;
	}

	public void setArticle_date(Date article_date) {
		this.article_date = article_date;
	}

	public String getUser_head() {
		return user_head;
	}

	public void setUser_head(String user_head) {
		this.user_head = user_head;
	}
	
	public long getArticle_bro() {
		return article_bro;
	}

	public void setArticle_bro(long article_bro) {
		this.article_bro = article_bro;
	}

	public long getCommenter_number() {
		return commenter_number;
	}

	public void setCommenter_number(long commenter_number) {
		this.commenter_number = commenter_number;
	}

	public long getAgree_number() {
		return agree_number;
	}

	public void setAgree_number(long agree_number) {
		this.agree_number = agree_number;
	}

	public long getCollection_number() {
		return collection_number;
	}

	public void setCollection_number(long collection_number) {
		this.collection_number = collection_number;
	}

	@Override
	public String toString() {
		return "Article [article_id=" + article_id + ", article_title=" + article_title + ", article_content="
				+ article_content + ", article_visible=" + article_visible + ", article_file=" + article_file
				+ ", user_id=" + user_id + ", user_name=" + user_name + ", article_tag=" + article_tag
				+ ", article_date=" + article_date + ", user_head=" + user_head + ", article_bro=" + article_bro
				+ ", commenter_number=" + commenter_number + "]";
	}

}
