package com.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;

import com.dao.ICoinDao;
import com.entity.Coin;
import com.entity.Files;
import com.util.DButil;

public class CoinDaoImpl implements ICoinDao {

	@Override
	public List<Coin> queryCoinByUserId(long user_id) {
		String sql = "select * from article where user_id=? order by coin_date desc";
		return DButil.queryByUserId(sql, Coin.class, user_id+"");
	}

	@Override
	public int downloadFile(Files file,long user_id) {
		Connection conn = DButil.getConn();
		try {
			conn.setAutoCommit(false);
			QueryRunner qr = new QueryRunner();
			//先扣钱
			long coin = file.getFile_coin();//应付款总金额
			String sql1 = "update userinfo set user_coin = user_coin - ? where user_id=?";
			int um = qr.execute(conn,sql1, coin,user_id);
			if(um == 0){
				conn.rollback();//如果有异常先回滚
			}else{
				conn.commit();
			}
			//将钱转给文件所属用户
			String sql3 = "update userinfo set user_coin = user_coin + ? "
					+"where user_id=(select a.user_id from article a where a.article_id = ?)";
			int um2 = qr.execute(conn,sql3, coin,file.getArticle_id());
			if(um2 == 0){
				conn.rollback();//如果有异常先回滚
			}else{
				conn.commit();
			}
			//交易记录存档(用户id，文章id，金币数)
			String sql2 = "insert into coin (coin_id,user_id,article_id,coin_number) values (coin_id_seq.nextval,?,?,?)";
			int i = qr.execute(conn,sql2, user_id,file.getArticle_id(),coin);
			if(i>0){
				conn.commit();//如果都成功的话  就提交数据库
				conn.close();
				return 1;
			}else{
				conn.rollback();//如果有异常先回滚
				return -1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return -1;
	}

	@Override
	public int payCoin(long user_id, long Coin) {
		// TODO Auto-generated method stub
		String sql = "update userinfo set user_coin = user_coin + ? where user_id = ?";
		return DButil.update(sql, Coin+"", user_id+"");
	}
}
