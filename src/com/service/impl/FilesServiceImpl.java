package com.service.impl;

import com.dao.ICoinDao;
import com.dao.IFileDao;
import com.dao.impl.CoinDaoImpl;
import com.dao.impl.FileDaoImpl;
import com.entity.Files;
import com.service.IFilesService;

public class FilesServiceImpl implements IFilesService{
	IFileDao filedao = new FileDaoImpl();
	ICoinDao coinDao = new CoinDaoImpl();
	@Override
	public Files queryFileBySrc(String dir) {
		// TODO Auto-generated method stub
		return filedao.queryFileBySrc(dir);
	}
	@Override
	public int downloadFile(Files file, long user_id) {
		// TODO Auto-generated method stub
		return coinDao.downloadFile(file, user_id);
	}
	@Override
	public Files queryFileById(long file_id) {
		// TODO Auto-generated method stub
		return filedao.queryFileById(file_id);
	}
	@Override
	public Files[] queryFileByArticleId(long article_id) {
		// TODO Auto-generated method stub
		return filedao.queryFileByArticleId(article_id);
	}
}
