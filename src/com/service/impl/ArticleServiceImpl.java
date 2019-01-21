package com.service.impl;


import java.math.BigDecimal;
import java.util.List;

import com.dao.IArticleDao;
import com.dao.impl.ArticleDaoImpl;
import com.entity.Article;
import com.service.IArticleService;
/**
 * 文章service层实现类
 * @author Administrator
 *
 */
public class ArticleServiceImpl implements IArticleService{
	
	//创建文章dao层的对象
	IArticleDao iarticledao = new ArticleDaoImpl();
	
	/**
	 * 添加文章
	 * @param Article 文章对象
	 * @return
	 */
	@Override
	public boolean insertArticle(Article article) {
		
		return iarticledao.insertArticle(article) > 0;
	}
	/**
	 * 添加文章并返回文章id
	 * @param article
	 * @return
	 */
	public long insertArticleReturnId(Article article){
		return iarticledao.insertArticleReturnId(article);
	}
	/**
	 * 查找用户总文章数
	 * @param user_id 用户id
	 * @return 总数
	 */
	@Override
	public BigDecimal queryArticleCount(long user_id,long user_type) {
		// TODO Auto-generated method stub
		return iarticledao.queryArticleCountByUserId(user_id,user_type);
	}
	@Override
	public List<Article> queryArticleByUserId(long user_id,long user_type, int startRow, int endRow) {
		
		return iarticledao.queryArticleByUserId(user_id,user_type, startRow, endRow);
	}
	@Override
	public Article queryArticleById(long article_id) {
		
		return iarticledao.queryArticleById((int)article_id);
	}
	
	@Override
	public boolean agreeArticle(long article_id, long user_id) {
		// TODO Auto-generated method stub
		return iarticledao.agreeArticle(article_id, user_id)>0;
	}
	/**
	 * 根据标签查找文章
	 */
	@Override
	public List<Article> queryArticleByTag(String article_tag,long startRow,long endRow) {
		// TODO Auto-generated method stub
		return iarticledao.queryArticleByTag(article_tag,startRow,endRow);
	}
	/**
	 * 根据标签查找文章
	 */
	@Override
	public BigDecimal queryArticleTagNum(String article_tag) {
		// TODO Auto-generated method stub
		return iarticledao.queryArticleTagNum(article_tag);
	}
	
	/**
	 * 热门话题
	 */
	@Override
	public List<Article> queryArticleByAgreeNumber() {
		// TODO Auto-generated method stub
		return iarticledao.queryArticleByAgreeNumber();
	}
	@Override
	public int browseArticle(long article_id) {
		// TODO Auto-generated method stub
		return iarticledao.browseArticle(article_id);
	}
	@Override
	public boolean commenterArticle(long article_id) {
		// TODO Auto-generated method stub
		return iarticledao.commenterArticle(article_id)>0;
	}
	@Override
	public boolean ifCollect(long article_id, long user_id) {
		// TODO Auto-generated method stub
		return iarticledao.ifCollect(article_id, user_id).intValue()>0;
	}
	@Override
	public boolean collectArticle(long article_id, long user_id) {
		// TODO Auto-generated method stub
		return iarticledao.collectArticle(article_id, user_id)>0;
	}
	@Override
	public List<Article> queryArticleByCollect(long user_id, long startRow, long endRow) {
		// TODO Auto-generated method stub
		return iarticledao.queryArticleByCollect(user_id, startRow, endRow);
	}
	@Override
	public BigDecimal queryCollectArticleCount(long user_id) {
		return iarticledao.queryCollectArticleCount(user_id);
	}

	@Override
	public BigDecimal queryDimBig(String str) {
		// TODO Auto-generated method stub
		return iarticledao.queryDimBig(str);
	}
	@Override
	public List<Article> queryDim(long startRow, long endRow, String str) {
		// TODO Auto-generated method stub
		return iarticledao.queryDim(startRow, endRow, str);
	}
	@Override
	public List<Article> queryArticleByCommentUserId(long user_id,  long startRow, long endRow) {
		// TODO Auto-generated method stub
		return iarticledao.queryArticleByCommentUserId(user_id, startRow, endRow);
	}
	@Override
	public BigDecimal queryCommentArticleCount(long user_id) {
		// TODO Auto-generated method stub
		return iarticledao.queryCommentArticleCount(user_id);
	}
	@Override
	public boolean deleArticle(String[] article_id) {
		// TODO Auto-generated method stub
		return iarticledao.deleArticle(article_id) > 0;
	}
}
