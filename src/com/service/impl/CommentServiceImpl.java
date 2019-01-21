package com.service.impl;

import java.util.List;

import com.dao.impl.CommenterDaoImpl;
import com.entity.Commenter;
import com.service.ICommentService;

public class CommentServiceImpl implements ICommentService{
	CommenterDaoImpl commenterDao = new CommenterDaoImpl();
	
	@Override
	public boolean insertComment(Commenter comment) {
		// TODO Auto-generated method stub
		int flag = commenterDao.insertCommenter(comment);
		if(flag > 0){
			return true;
		}else{
			return false;
		}
	}
	
	public List<Commenter> queryCommentByArticleId(Long article_id){
		return commenterDao.queryCommenterByArticleId(article_id);
	}

	@Override
	public List<Commenter> queryCommentByPage(long article_id, long startRow, long endRow) {
		// TODO Auto-generated method stub
		return commenterDao.queryCommenterByPage(article_id, startRow, endRow);
	}
}
