package com.service;

import java.util.List;

import com.entity.Commenter;

public interface ICommentService {
	boolean insertComment(Commenter comment);
	List<Commenter> queryCommentByArticleId(Long article_id);
	List<Commenter> queryCommentByPage(long article_id, long startRow, long endRow);
}
