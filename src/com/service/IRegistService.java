package com.service;

public interface IRegistService {
	/**
	 * 发送邮箱验证码
	 * @param Email 邮箱地址
	 * @return 邮箱验证码
	 */
	public String SendMail(String Email,String mainCode);
}
