package com.service;

import java.math.BigDecimal;
import java.util.List;

import com.entity.Article;
import com.util.DButil;

/**
 * 文章的service层接口
 * @author Administrator
 *
 */
public interface IArticleService {
	/**
	 * 添加文章
	 * @param Article 文章对象
	 * @return
	 */
	boolean insertArticle(Article article);
	/**
	 * 添加文章并返回文章id
	 * @param article
	 * @return
	 */
	long insertArticleReturnId(Article article);
	/**
	 * 查找用户总文章数
	 * @param user_id 用户id
	 * @return 总数
	 */
	BigDecimal queryArticleCount(long user_id,long user_type);
	/**
	 * 查找用户文章--分页
	 * @param user_id
	 * @param startRow
	 * @param endRow
	 * @return
	 */
	List<Article> queryArticleByUserId(long user_id,long user_type,int startRow,int endRow);
	/**
	 * 根据文章id查询
	 * @param article_id
	 * @return
	 */
	Article queryArticleById(long article_id);
	
	/**
	 * 文章点赞
	 * @param article_id
	 * @param user_id
	 * @return
	 */
	boolean agreeArticle(long article_id, long user_id);
	
	/**
	 * 根据标签查找文章
	 * @param article_tag
	 * @return
	 */
	List<Article> queryArticleByTag(String article_tag,long startRow,long endRow);
	
	/**
	 * 根据标签查找文章数量
	 * @param article_tag
	 * @return
	 */
	BigDecimal queryArticleTagNum(String article_tag);
	
	/**
	 * 热门话题查询
	 * @return
	 */
	List<Article> queryArticleByAgreeNumber();
	/**
	 * 根据文章id增加浏览次数
	 * @param article_id
	 * @return
	 */
	int browseArticle(long article_id);
	/**
	 * 将文章的评论数量更新
	 * @param article_id
	 * @return
	 */
	boolean commenterArticle(long article_id);
	/**
	 * 是否已经收藏,返回true则表示已收藏
	 * @param article_id
	 * @param user_id
	 * @return
	 */
	boolean ifCollect(long article_id,long user_id);
	/**
	 * 收藏文章
	 * @param article_id
	 * @param user_id
	 * @return
	 */
	boolean collectArticle(long article_id,long user_id);
	/**
	 * 分页查询用户收藏的文章
	 * @param user_id
	 * @param user_type
	 * @param startRow
	 * @param endRow
	 * @return
	 */
	List<Article> queryArticleByCollect(long user_id, long startRow, long endRow);
	/**
	 * 查询用户收藏文章总数
	 * @param user_id
	 * @return
	 */
	BigDecimal queryCollectArticleCount(long user_id);
	
	/**
	 * 根据关键字模糊查询
	 */
	List<Article> queryDim(long startRow, long endRow,String str);
	
	/**
	 * 模糊查询文章行数的方法
	 * @param str
	 * @param startRow
	 * @param endRow
	 * @return
	 */
	BigDecimal queryDimBig(String str);
	/**
	 * 根据评论用户id查找评论
	 * @param user_id
	 * @return
	 */
	List<Article> queryArticleByCommentUserId(long user_id,  long startRow, long endRow);
	/**
	 * 查询用户评论文章总数
	 * @param user_id
	 * @return
	 */
	BigDecimal queryCommentArticleCount(long user_id);
	/**
	 * 根据文章id删除文章
	 * @param article_id
	 * @return
	 */
	boolean deleArticle(String[] article_id);
} 
