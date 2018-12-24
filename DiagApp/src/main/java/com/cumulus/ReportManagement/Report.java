package com.cumulus.ReportManagement;
import com.cumulus.DBManagement.*;
public class Report {
	String sessionId;
	Boolean status;
	Report(String sess){
		this.sessionId=sess;
	}
	public static boolean getStatus(String sessionId) {
		return DBInstance.ifSessionExists(sessionId);
	}
}
