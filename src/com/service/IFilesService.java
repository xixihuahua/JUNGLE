package com.service;

import com.entity.Files;

public interface IFilesService {
	/**
	 * 通过文件绝对路径查询文件
	 * @param dir
	 * @return
	 */
	Files queryFileBySrc(String dir);
	/**
	 * 下载文件（附带扣款）
	 * @param file
	 * @param user_id
	 * @return
	 */
	int downloadFile(Files file,long user_id);
	/**
	 * 根据文件id查询文章
	 */
	Files queryFileById(long file_id);
	/**
	 * 根据文章id查询文件
	 */
	Files[] queryFileByArticleId(long article_id);
}
