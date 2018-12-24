package com.cumulus.DBManagement;


import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.bson.Document;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import com.cumulus.SessionManagement.SessionManager;

public class DBInstance {
	
	static MongoClient mongoClient = new MongoClient("localhost",27017);
	static MongoDatabase dbInstance = mongoClient.getDatabase("diagapp");
	public static MongoCollection<Document> coll=dbInstance.getCollection("customer");
	
	private static Document createDocument(Customer customer) {
		Document doc = new Document();
		doc.put("customerName", customer.getCustomerName());
		doc.put("sessionId", customer.getSessionId());
		doc.put("status", customer.getStatus());
		doc.put("dateTime", customer.getDateTime());
		return doc;
	}
	public static Customer createCustomer(String customerName) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		Long sessionId=SessionManager.generateSessionId();
		while(ifSessionExists(Long.toString(sessionId))){
			sessionId=SessionManager.generateSessionId();
		}
		Customer customer= new Customer(customerName, Long.toString(sessionId), "Un-available", dtf.format(now));
		Document doc = createDocument(customer);
		coll.insertOne(doc);
		System.out.println("data inserted");
		return customer;
	}
	public static Boolean ifSessionExists(String sessionId){
		if(coll.find(Filters.eq("sessionId", sessionId)).first()!= null) {
			System.out.println(sessionId);
			System.out.println(coll.find(Filters.eq("sessionId", sessionId)).first());
			return true;
		}
		else{
			return false;
		}
	}
}
