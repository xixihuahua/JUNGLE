package com.util;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionCount implements HttpSessionListener {
	
	private static int activeSessions = 0;
	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		 activeSessions++;
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		if (activeSessions > 0)
            activeSessions--;
	}
	
	//获取活动的session个数(在线人数)
    public static int getActiveSessions() {
        return activeSessions;
    }

}
