package com.dao;

import java.util.List;

import com.entity.Commenter;

public interface ICommenterDao {
/*	COMMENTER_ID      NUMBER                                   
	ARTICLE_ID        NUMBER         Y                         
	COMMENTER_CONTENT VARCHAR2(4000) Y                         
	COMMENTER_FILE    VARCHAR2(300)  Y                         
	USER_ID           NUMBER         Y                         
	COMMENTER_DATE    DATE           Y  */
	
	int insertCommenter(Commenter commenter);
	/**
	 * 根据文章id查找评论回复
	 * @param article_id
	 * @return
	 */
	List<Commenter> queryCommenterByArticleId(long article_id);
	/**
	 * 根据评论用户id查找评论
	 * @param user_id
	 * @return
	 */
	List<Commenter> queryCommenterByUserId(long user_id);
	/**
	 * 根据评论id查找评论
	 * @param commenter_id
	 * @return
	 */
	Commenter queryCommenterByCommentId(long commenter_id);
	/**
	 * 分页查询评论
	 * @param article_id
	 * @param startRow
	 * @param endRow
	 * @return
	 */
	List<Commenter> queryCommenterByPage(long article_id,long startRow,long endRow);
}
