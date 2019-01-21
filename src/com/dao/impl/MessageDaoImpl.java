package com.dao.impl;

import java.math.BigDecimal;
import java.util.List;

import com.dao.IMessageDao;
import com.entity.Message;
import com.util.DButil;

public class MessageDaoImpl implements IMessageDao {

	@Override
	public int insertMessage(long user_id,long article_id,long this_user_id) {
		String sql = "insert into messages (msg_id,user_id,article_id,this_user_id) values (msg_id_seq.nextval,?,?,?)";
		return DButil.update(sql,user_id+"", article_id+"",this_user_id+"");
	}

	@Override
	public int updateMessage(long message_id) {
		String sql = "update messages set msg_type=1 where msg_id=?";
		return DButil.update(sql, message_id+"");
	}

	@Override
	public int deleteMessage(long message_id) {
		String sql = "delete from messages where msg_id=?";
		return DButil.update(sql, message_id+"");
	}

	@Override
	public List<Message> queryMessageByUserId(long this_user_id,long startRow, long endRow) {
		String sql= "select tt.* from "
				+"(select t.*,rownum rn from "
				+"(select m.*,a.article_title,u.user_name,u.user_head from messages m,article a,"
				+ "userinfo u where m.user_id=u.user_id"
				+ " and  m.article_id=a.article_id and this_user_id=? order by msg_date desc) t) tt "
				+"where tt.rn between ? and ?";
		return DButil.queryByUserId(sql,Message.class, this_user_id+"",startRow+"",endRow+"");
	}

	@Override
	public List<Message> queryMessageReadByUserId(long this_user_id,long startRow, long endRow) {
		String sql = "select tt.* from "
				+"(select t.*,rownum rn from "
				+"(select m.*,a.article_title,u.user_name,u.user_head from messages m,"
				+ "article a,userinfo u where m.user_id=u.user_id"
				+ " and  m.article_id=a.article_id and this_user_id=? and m.msg_type=0 order by msg_date desc) t) tt "
				+"where tt.rn between ? and ?";
				
		return DButil.queryByUserId(sql,Message.class, this_user_id+"",startRow+"",endRow+"");
	}

	@Override
	public BigDecimal queryMessageCountByUserId(long this_user_id) {
		String sql ="select count(*) from messages where this_user_id=?";
		return DButil.queryCount(sql, this_user_id+"");
	}

	@Override
	public BigDecimal queryMessageReadCountByUserId(long this_user_id) {
		String sql ="select count(*) from messages where this_user_id=? and msg_type=0";
		return DButil.queryCount(sql, this_user_id+"");
	}

}
