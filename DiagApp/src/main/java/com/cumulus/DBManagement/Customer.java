package com.cumulus.DBManagement;

public class Customer {
	String customerName;
	
	String sessionId;
	String status;
	String dateTime;
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDateTime() {
		return dateTime;
	}
	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
	public Customer(String customerName, String sessionId, String status, String dateTime) {
		super();
		this.customerName = customerName;
		this.sessionId = sessionId;
		this.status = status;
		this.dateTime = dateTime;
	}
}
