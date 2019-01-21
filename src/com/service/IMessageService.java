package com.service;

import java.math.BigDecimal;
import java.util.List;

import com.entity.Message;

public interface IMessageService {
	/**
	 * 插入消息
	 * @param com_user_id
	 * @param article_id
	 * @param user_id
	 * @return
	 */
	boolean insertMessage(long user_id,long article_id,long this_user_id);
	/**
	 * 更新消息为已读
	 * @param message_id
	 * @return
	 */
	boolean updateMessage(long message_id);
	/**
	 * 删除消息
	 * @param message_id
	 * @return
	 */
	boolean deleteMessage(long message_id);
	/**
	 * 查询所有消息
	 * @param user_id
	 * @return
	 */
	List<Message> queryMessageByUserId(long user_id,long startRow, long endRow);
	/**
	 * 查询未读消息
	 * @param user_id
	 * @return
	 */
	List<Message> queryMessageReadByUserId(long user_id,long startRow, long endRow);
	/**
	 * 查询用户消息总数
	 * @param user_id
	 * @return
	 */
	long queryMessageCountByUserId(long user_id);
	/**
	 * 查询未读消息总数
	 * @param user_id
	 * @return
	 */
	long queryMessageReadCountByUserId(long user_id);
}
