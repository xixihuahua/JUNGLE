package com.dao.impl;

import java.math.BigDecimal;
import java.util.List;

import com.dao.IArticleDao;
import com.entity.Article;
import com.util.DButil;

public class ArticleDaoImpl implements IArticleDao {
	/*ARTICLE_ID      NUMBER                                   
	ARTICLE_TITLE   VARCHAR2(100)  Y                         
	ARTICLE_CONTENT VARCHAR2(4000) Y                         
	ARTICLE_VISIBLE VARCHAR2(5)    Y                         
	ARTICLE_FILE    VARCHAR2(300)  Y                         
	USER_ID         NUMBER         Y                         
	ARTICLE_TAG     VARCHAR2(30)   Y                         
	ARTICLE_DATE    DATE           Y      */
	@Override
	public int insertArticle(Article article) {
		String sql = "insert into article (article_id,article_title,article_content,article_file,user_id,article_tag)"
				+ " values (article_id_seq.nextval,?,?,?,?,?)";
		return DButil.update(sql,
				article.getArticle_title(),article.getArticle_content(),article.getArticle_file(),article.getUser_id()+"",article.getArticle_tag());
	}
	@Override
	public long insertArticleReturnId(Article article){
		String sql1 = "select article_id_seq.nextval from dual";
		BigDecimal seqNext = DButil.queryCount(sql1);
		String sql2 = "insert into article (article_id,article_title,article_content,user_id,article_tag)"
				+ " values (?,?,?,?,?)";
		DButil.update(sql2,seqNext+"",article.getArticle_title(),article.getArticle_content(),
				article.getUser_id()+"",article.getArticle_tag());	
		return seqNext.longValue();
	}
	@Override
	public int updateArticle(Article article) {
		String sql = "update article set article_title=?,article_content=?,article_file=?,article_tag=?"
				+ " where article_id=?";
		return DButil.update(sql,
				article.getArticle_title(),article.getArticle_content(),article.getArticle_file(),article.getArticle_tag(),article.getArticle_id()+"");
	}

	@Override
	public Article queryArticleById(int article_id) {
		String sql = "select a.*,u.user_name,u.user_head from article a,userinfo u where article_id=? and a.user_id=u.user_id";
		return DButil.queryById(sql, Article.class, article_id);
	}

	@Override
	public List<Article> queryArticleByKeyWord(String keyWord) {
		String sql = "select a.*,u.user_name,u.user_head from article a,userinfo u where article_title like '%?%' and a.user_id=u.user_id order by article_date desc";
		return DButil.queryByKeyWord(sql, Article.class, keyWord);
	}

	@Override
	public List<Article> queryArticleByUserId(long user_id) {
		String sql = "select a.*,u.user_name,u.user_head from article a,userinfo u where a.user_id=?and a.user_id=u.user_id order by article_date desc";
		return DButil.queryByUserId(sql, Article.class, user_id+"");
	}

	@Override
	public List<Article> queryArticleByUserName(String user_name) {
		String sql = "select a.* from article a,userinfo u where a.user_id=u.user_id and user_name like '%?%' order by article_date desc";
		return DButil.queryByKeyWord(sql, Article.class, user_name);
	}

	@Override
	public BigDecimal queryArticleCountByUserId(long user_id,long user_type) {
		String sql = "select count(*) from article a,userinfo u where a.user_id=?and a.user_id=u.user_id";
		if(user_type == 0){ 
			sql= "select count(*) from article where 0=?";
			return DButil.queryCount(sql,user_type+"");
		}
		return DButil.queryCount(sql, user_id+"");
	}

	@Override
	public List<Article> queryArticleByUserId(long user_id, long user_type, long startRow, long endRow) {
		String sql = "select tt.* from "
				+"(select t.*,rownum rn from "
				+"(select a.*,u.user_name,u.user_head from article a, userinfo u "
				+"where a.user_id = u.user_id and u.user_id=? order by article_date desc) t) tt "
				+"where tt.rn between ? and ?";
		if(user_type == 0){ 
			sql= "select tt.* from "
					+"(select t.*,rownum rn from "
					+"(select a.*,u.user_name,u.user_head from article a, userinfo u "
					+"where a.user_id = u.user_id order by article_date desc) t) tt "
					+"where tt.rn between ? and ?";
			return DButil.queryByUserId(sql, Article.class,startRow+"",endRow+"");
		}
		return DButil.queryByUserId(sql, Article.class, user_id+"",startRow+"",endRow+"");
	}
	
	@Override
	public int agreeArticle(long article_id, long user_id) {
		String sqlArticle = "update article set agree_number =agree_number+1 where article_id=?";
		String sqlAgree = "insert into agree (article_id,user_id) values (?,?)";
		//是否已经点赞
		String queryAgree="select count(*) from agree where article_id =? and user_id=?";
		BigDecimal count=DButil.queryCount(queryAgree, article_id+"",user_id+"");
		if(count.intValue() > 0) return -1;
		//没有点赞，则执行点赞操作
		if(DButil.update(sqlAgree, article_id+"",user_id+"") <= 0){
			return -1;
		}
		//往文章表中修改点赞数量
		return DButil.update(sqlArticle, article_id+"");
	}
	
	/**
	 * 根据文章标签查找文章
	 */
	@Override
	public List<Article> queryArticleByTag(String article_tag,long startRow,long endRow) {
		// TODO Auto-generated method stub
		String sqltag="select tt.* from (select t.*,rownum rn from (select a.*,u.user_name,u.user_head from article a,userinfo u where a.user_id = u.user_id and article_tag = ? order by article_date desc) t) tt where tt.rn between ? and ?";
		return DButil.queryByUserId(sqltag,Article.class,article_tag,startRow+"",endRow+"");
	}
	/**
	 * 根据文章标签查找文章行数
	 */
	@Override
	public BigDecimal queryArticleTagNum(String article_tag) {
		// TODO Auto-generated method stub
		String sqltagNum="select count(*) from article where article_tag=?";
		return DButil.queryCount(sqltagNum,article_tag+"");
	}
	
	/**
	 * 热门话题排行,按照点赞数量排行
	 * @return
	 */
	@Override
	public List<Article> queryArticleByAgreeNumber() {
		//System.out.println("开始对数据库操作");
		String sql = "select tt.* from (select t.*,rownum rn from (select * from article order by article_bro desc) t) tt where tt.rn between 0 and 10";
		//System.out.println("数据库查询成功 , 正在返回结果");
		return DButil.queryByUserId(sql, Article.class);
	}
	/**
	 * 浏览文章
	 */
	@Override
	public int browseArticle(long article_id) {
		String updatebrowse = "update article set article_bro = article_bro+1 where article_id=?";
		//往文章表中修改浏览次数
		return DButil.update(updatebrowse, article_id+"");
	}
	@Override
	public int commenterArticle(long article_id) {
		String sqlArticle = "update article set commenter_number =commenter_number+1 where article_id=?";
		return DButil.update(sqlArticle, article_id+"");
	}

	@Override
	public BigDecimal ifCollect(long article_id, long user_id) {
		String sql  = "select count(*) from collection where article_id=? and user_id=? ";
		return DButil.queryCount(sql,article_id+"",user_id+"");
	}
	@Override
	public int collectArticle(long article_id, long user_id) {
		String sqlArticle = "update article set collection_number =collection_number+1 where article_id=?";
		String sqlCollect = "insert into collection (article_id,user_id) values (?,?)";
		String sqlifCollect = "select count(*) from collection where article_id=? and user_id=? ";
		if (DButil.queryCount(sqlifCollect,article_id+"", user_id+"").intValue()>0){
			sqlArticle = "update article set collection_number =collection_number-1 where article_id=?";
			sqlCollect = "delete from collection where article_id=? and user_id=?";
		}
		if(DButil.update(sqlCollect, article_id+"",user_id+"") <= 0){
			return -1;
		}
		//往文章表中修改收藏数量
		return DButil.update(sqlArticle, article_id+"");
	}
	//-------11-9---end---//
	@Override
	public List<Article> queryArticleByCollect(long user_id,  long startRow, long endRow) {
		String sql = "select tt.* from "
				+"(select t.*,rownum rn from "
				+"(select a.*,u.user_name,u.user_head from article a, userinfo u,collection c "
				+"where a.user_id = u.user_id and a.article_id = c.article_id and c.user_id=? order by article_date desc) t) tt "
				+"where tt.rn between ? and ?";
		return DButil.queryByUserId(sql, Article.class, user_id+"",startRow+"",endRow+"");
	}

	@Override
	public BigDecimal queryCollectArticleCount(long user_id) {
		String sql = "select count(*) from collection where user_id=?";
		return DButil.queryCount(sql, user_id+"");
	}
	
	/**
	 * 根据关键字模糊查询
	 */
	public List<Article> queryDim(long startRow,long endRow,String str) {
		String sql = "select tt.* from "
       +"(select t.*,rownum rn from "
        +"(select u.user_head,u.user_name,a.* from userinfo u,article a where u.user_id=a.user_id and (a.article_title like'%"+str+"%' or  a.article_content like'%"+str+"%' or u.user_name like'%"+str+"%' or a.article_tag like'%"+str+"%') order by article_date desc) t) tt " 
			+"	where tt.rn between ? and ?";
		return DButil.queryByUserId(sql,Article.class,startRow+"",endRow+"");
	}
	
	/**
	 * 模糊查询文章行数的方法
	 * @param str
	 * @param startRow
	 * @param endRow
	 * @return
	 */
	@Override
	public BigDecimal queryDimBig(String str) {
		String sql = "select count(*) from userinfo u,article a where u.user_id=a.user_id "
				+"and (a.article_title like'%"+str+"%' or  a.article_content like'%"+str+"%' "
				+"or u.user_name like'%"+str+"%' or a.article_tag like'%"+str+"%')";
		return DButil.queryCount(sql);
	}
	@Override
	public List<Article> queryArticleByCommentUserId(long user_id,  long startRow, long endRow) {
		String sql = "select tt.* from "
				+"(select t.*,rownum rn from "
				+"(select distinct a.*,u.user_name,u.user_head from article a, userinfo u,commenter c "
				+"where a.user_id = u.user_id and a.article_id = c.article_id and c.user_id=? order by article_date desc) t) tt "
				+"where tt.rn between ? and ?";
		return DButil.queryByUserId(sql, Article.class, user_id+"",startRow+"",endRow+"");
	}

	@Override
	public BigDecimal queryCommentArticleCount(long user_id) {
		String sql =  "select count(*) from (select distinct a.*,u.user_name,u.user_head from article a, userinfo u,commenter c "
				+"where a.user_id = u.user_id and a.article_id = c.article_id and c.user_id=? order by article_date desc)";
		return DButil.queryCount(sql, user_id+"");
	}
	@Override
	public int deleArticle(String[] article_id) {
		// TODO Auto-generated method stub
		String sql2 = "";
		for(String s : article_id){
			sql2+=" "+s+",";
		}
		 sql2 = sql2.substring(0, sql2.length()-1);
		String sql = "delete from article where article_id in("+sql2+")";
		
		int i = DButil.update(sql);
		
		return i;
	}

}
