package com.dao;

import java.math.BigDecimal;
import java.util.List;

import com.entity.Article;

public interface IArticleDao {
	/**
	 * 添加文章
	 * @param Article 文章对象
	 * @return
	 */
	int insertArticle(Article article);
	/**
	 * 添加文章并返回文章id
	 * @param article
	 * @return
	 */
	long insertArticleReturnId(Article article);
	/**
	 * 更改文章
	 * @param Article 文章对象
	 * @return 受影响行数
	 */
	int updateArticle(Article article);
	/**
	 * 根据文章id查找文章
	 * @param article_id 文章id
	 * @return 受影响行数
	 */
	Article queryArticleById(int article_id);
	/**
	 * 根据关键词模糊查找文章
	 * @param keyWord 关键词
	 * @return 文章对象列表
	 */
	List<Article> queryArticleByKeyWord(String keyWord);
	/**
	 * 查找用户总文章数
	 * @param user_id
	 * @return
	 */
	BigDecimal queryArticleCountByUserId(long user_id,long user_type);
	/**
	 * 分页查找用户总文章数
	 * @param user_id
	 * @param startRow
	 * @param endRow
	 * @return
	 */
	List<Article> queryArticleByUserId(long user_id, long user_type,long startRow,long endRow);
	/**
	 * 根据用户id查找文章
	 * @param user_id
	 * @return 文章对象列表
	 */
	List<Article> queryArticleByUserId(long user_id);
	/**
	 * 根据用户名模糊查找文章
	 * @param keyWord 关键词
	 * @return 文章对象列表
	 */
	List<Article> queryArticleByUserName(String user_name);
	
	/**
	 * 点赞
	 */
	int agreeArticle(long article_id,long user_id);
	
	/**
	 * 根据文章标签查找文章
	 * @param article_tag
	 * @return
	 */
	List<Article> queryArticleByTag(String article_tag,long startRow,long endRow);
	
	/**
	 * 根据文章标签查找文章行数
	 * @param article_tag
	 * @return
	 */
	BigDecimal queryArticleTagNum(String article_tag);
	
	/**
	 * 热门话题排行,按照点赞数量排行
	 * @return
	 */
	List<Article> queryArticleByAgreeNumber();
	/**
	 * 浏览文章
	 * @param article_id
	 * @return
	 */
	int browseArticle(long article_id);
	/**
	 * 将文章的评论数量更新
	 * @param article_id
	 * @return
	 */
	int commenterArticle(long article_id);
	/**
	 * 是否已经收藏
	 * @param article_id
	 * @param user_id
	 * @return
	 */
	BigDecimal ifCollect(long article_id,long user_id);
	/**
	 * 收藏文章
	 * @param article_id
	 * @param user_id
	 * @return
	 */
	int collectArticle(long article_id,long user_id);
	/**
	 * 分页查询用户收藏的文章
	 * @param user_id
	 * @param user_type
	 * @param startRow
	 * @param endRow
	 * @return
	 */
	List<Article> queryArticleByCollect(long user_id,  long startRow, long endRow);
	/**
	 * 查询用户收藏文章总数
	 * @param user_id
	 * @return
	 */
	BigDecimal queryCollectArticleCount(long user_id);
	
	/**
	 * 模糊查询文章的方法
	 * @param str
	 * @param startRow
	 * @param endRow
	 * @return
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
	int deleArticle(String[] article_id);
}
