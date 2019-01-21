package com.dao;

import java.util.List;

import com.entity.Coin;
import com.entity.Files;

public interface ICoinDao {
	/**
	 * 查询用户金币交易详情
	 * @param user_id
	 * @return 交易详情列表
	 */
	List<Coin> queryCoinByUserId(long user_id);
	/**
	 * 下载文件
	 * @param file 从数据库查询到的file，必须包含file_coin
	 * @param user_id
	 * @return 受影响行数，返回值判断，小于0不返回路径
	 */
	int downloadFile(Files file,long user_id);
	/**
	 * 用户充值
	 * @param user_id
	 * @param Coin
	 * @return
	 */
	int payCoin(long user_id,long Coin);

}
