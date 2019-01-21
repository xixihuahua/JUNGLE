package com.service.impl;

import java.math.BigDecimal;
import java.util.List;

import com.dao.IMessageDao;
import com.dao.impl.MessageDaoImpl;
import com.entity.Message;
import com.service.IMessageService;

public class MessageServiceImpl implements IMessageService {
	IMessageDao messageDao = new MessageDaoImpl();
	@Override
	public boolean insertMessage(long user_id, long article_id, long this_user_id) {
		// TODO Auto-generated method stub
		return messageDao.insertMessage(user_id, article_id, this_user_id)>0;
	}

	@Override
	public boolean updateMessage(long message_id) {
		// TODO Auto-generated method stub
		return messageDao.updateMessage(message_id)>0;
	}

	@Override
	public boolean deleteMessage(long message_id) {
		// TODO Auto-generated method stub
		return messageDao.deleteMessage(message_id)>0;
	}

	@Override
	public List<Message> queryMessageByUserId(long user_id, long startRow, long endRow) {
		// TODO Auto-generated method stub
		return messageDao.queryMessageByUserId(user_id, startRow, endRow);
	}

	@Override
	public List<Message> queryMessageReadByUserId(long user_id, long startRow, long endRow) {
		// TODO Auto-generated method stub
		return messageDao.queryMessageReadByUserId(user_id, startRow, endRow);
	}

	@Override
	public long queryMessageCountByUserId(long user_id) {
		// TODO Auto-generated method stub
		return messageDao.queryMessageCountByUserId(user_id).longValue();
	}

	@Override
	public long queryMessageReadCountByUserId(long user_id) {
		// TODO Auto-generated method stub
		return messageDao.queryMessageReadCountByUserId(user_id).longValue();
	}

}
