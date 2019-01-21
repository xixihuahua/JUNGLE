package com.dao.impl;

import java.util.List;

import com.dao.ICommenterDao;
import com.entity.Commenter;
import com.util.DButil;

public class CommenterDaoImpl implements ICommenterDao{
	/*	COMMENTER_ID      NUMBER                                   
	ARTICLE_ID        NUMBER         Y                         
	COMMENTER_CONTENT VARCHAR2(4000) Y                         
	COMMENTER_FILE    VARCHAR2(300)  Y                         
	USER_ID           NUMBER         Y                         
	COMMENTER_DATE    DATE           Y  */
	@Override
	public int insertCommenter(Commenter commenter) {
		String sql = "insert into commenter (commenter_id,article_id,commenter_content,commenter_file,user_id)"
				+ " values (commenter_id_seq.nextval,?,?,?,?)";
		return DButil.update(sql,commenter.getArticle_id()+"",commenter.getCommenter_content(),
				commenter.getCommenter_file(),commenter.getUser_id()+"");
	}

	@Override
	public List<Commenter> queryCommenterByArticleId(long article_id) {
		String sql="select c.*,u.user_head,u.user_name from commenter c,userinfo u where c.article_id =? and u.user_id=c.user_id";
		return DButil.queryByUserId(sql, Commenter.class, article_id+"");
	}

	@Override
	public List<Commenter> queryCommenterByUserId(long user_id) {
		String sql="select c.*,u.user_head,u.user_name from commenter where user_id =? and u.user_id=c.user_id";
		return DButil.queryByUserId(sql, Commenter.class, user_id+"");
	}

	@Override
	public Commenter queryCommenterByCommentId(long commenter_id) {
		String sql="select * from commenter where commenter_id =?";
		return DButil.queryById(sql, Commenter.class, commenter_id);
	}

	@Override
	public List<Commenter> queryCommenterByPage(long article_id, long startRow, long endRow) {
		
		String sql="select tt.* from "
				+"(select t.*,rownum rn from "
				+"(select c.*,u.user_head,u.user_name from commenter c,userinfo u "
				+ "where c.article_id =? and u.user_id=c.user_id order by commenter_date desc) t) tt "
				+"where tt.rn between ? and ?";
		return DButil.queryByUserId(sql, Commenter.class, article_id+"",startRow+"",endRow+"");
	}

}
