package com.dao;

import com.entity.Files;

public interface IFileDao {
	/**
	 * <h5>下载文件 </h5>
	 * 调用coindao 如果返回值<=0,则返回空字符串，可以修改至service层
	 * @param file
	 * @param user_id
	 * @return
	 */
	String downloadFile(Files file,long user_id);
	/**
	 * 上传文件提交
	 * @return 受影响行数
	 */
	int uploadFile(Files file);
	/**
	 * 根据文件绝对路径查询文件
	 * @param dir
	 * @return
	 */
	Files queryFileBySrc(String dir);
	/**
	 * 根据文件id查询文章
	 */
	Files queryFileById(long file_id);
	/**
	 * 根据文章id查询文件
	 * @param article_id
	 * @return
	 */
	Files[] queryFileByArticleId(long article_id);
}
