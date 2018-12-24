package com.cumulus.SessionManagement;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;

public class SessionManager {
	public static Long generateSessionId() {
		// TODO Auto-generated method stub
		SessionManager obj= new SessionManager();
		Long sessionId=obj.getSessionId();
		if(obj.ifExists(sessionId)) {
			//re-generate session id
			sessionId=obj.getSessionId();
			return sessionId;
			}
		else{
			System.out.println("Session ID is: "+ sessionId);
			return sessionId;
		}
	}
	
	private long getSessionId(){
		long str_sessionId=0;
		Random salt = new Random();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		System.out.println(dtf.format(now)); //2016/11/16 12:08:43
		str_sessionId = Long.parseLong(Integer.toString(now.getYear())+ Integer.toString(now.getMonthValue())+ Integer.toString(now.getDayOfMonth())+ Integer.toString(now.getHour())+ Integer.toString(now.getMinute())+Integer.toString(salt.nextInt(9999)));
		//System.out.println("SessionId:"+str_sessionId);
		return str_sessionId; 
	}
	private boolean ifExists(Long SessionId){
		//code to check in db if session exists
		return false;
	}
}

