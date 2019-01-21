package com.dao;

import java.math.BigDecimal;
import java.util.List;

import com.entity.Message;

public interface IMessageDao {
	/**
	 * 插入消息
	 * @param com_user_id
	 * @param article_id
	 * @param user_id
	 * @return
	 */
	int insertMessage(long user_id,long article_id,long this_user_id);
	/**
	 * 更新消息为已读
	 * @param message_id
	 * @return
	 */
	int updateMessage(long message_id);
	/**
	 * 删除消息
	 * @param message_id
	 * @return
	 */
	int deleteMessage(long message_id);
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
	BigDecimal queryMessageCountByUserId(long user_id);
	/**
	 * 查询未读消息总数
	 * @param user_id
	 * @return
	 */
	BigDecimal queryMessageReadCountByUserId(long user_id);
}
