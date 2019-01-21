package com.dao.impl;


import java.util.List;

import com.dao.ICoinDao;
import com.dao.IFileDao;
import com.entity.Article;
import com.entity.Files;
import com.util.DButil;
/**
 * 与上传 下载文件相关的dao层
 * @author HYZ
 *
 */
public class FileDaoImpl implements IFileDao{
	ICoinDao coinDao = new CoinDaoImpl();
	@Override
	public String downloadFile(Files file,long user_id) {
		int result = coinDao.downloadFile(file, user_id);
		if(result >0) return file.getFile_src();
		
		return "";
	}

	@Override
	public int uploadFile(Files file) {
		String sql = "insert into files (file_id,file_title,file_src,file_coin,article_id)"
				+ " values (file_id_seq.nextval,?,?,?,?)";
		return DButil.update(sql,file.getFile_title(),file.getFile_src(),file.getFile_coin()+"",file.getArticle_id()+"");
	}
	@Override
	public Files queryFileBySrc(String dir) {
		// TODO Auto-generated method stub
		String sql = "select * from files where file_src = ?";
		return DButil.queryByLogin(sql, Files.class, dir);
	}

	@Override
	public Files queryFileById(long file_id) {
		// TODO Auto-generated method stub
		String sql = "select * from files where file_id = ?";
		return DButil.queryByLogin(sql, Files.class, file_id+"");
	}
	@Override
	public Files[] queryFileByArticleId(long article_id) {
		// TODO Auto-generated method stub
		String sql = "select * from files where article_id = ?";
		List<Files> list = DButil.queryByUserId(sql, Files.class, article_id+"");
		int size = list.size();
		return list.toArray(new Files[size]);
	}
}
