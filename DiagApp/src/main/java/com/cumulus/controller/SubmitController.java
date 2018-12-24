package com.cumulus.controller;

import java.io.File;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.cumulus.DBManagement.*;
//import com.cumulus.ReportManagement.JobProcessor;
import com.cumulus.ReportManagement.Processor;
@Controller
@SessionAttributes("requestid")
@RequestMapping("/submit")
public class SubmitController {
	//private static final String UPLOAD_DIRECTORY ="C:\\nginx-1.14.2\\html\\images";
	@RequestMapping(value="/index",method=RequestMethod.POST)
	public String index(ModelMap model,@RequestParam("customerName") String customerName,@RequestParam CommonsMultipartFile diagnostic, HttpSession session) throws Exception {
		model.addAttribute("message","Hello from Spring MVC");
		Customer customer=DBInstance.createCustomer(customerName);
		String sessionId=customer.getSessionId();
		model.addAttribute("sessionid",sessionId);
		//Code to upload data to Server
		/*new File("C:\\nginx-1.14.2\\html\\images\\"+sessionId).mkdir();
		String path =UPLOAD_DIRECTORY+"\\"+sessionId;
		System.out.println("New Directory: "+path);
		 String filename = diagnostic.getOriginalFilename();  
		 System.out.println(path+" "+filename);        
		 byte[] bytes = diagnostic.getBytes();  
		 BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(  
		 new File(path + File.separator + filename)));  
		 stream.write(bytes);  
		 stream.flush();  
		 stream.close();  
		 */
		// String localPath = "C:/temp/";
		 String remotePath = "/data/work";
		 
		CommonsMultipartFile cf= diagnostic;
  	   DiskFileItem fi = (DiskFileItem)cf.getFileItem(); 
         File file = fi.getStoreLocation();
		 
		 Processor ftp = new Processor("192.168.33.136", 22, "megha", "megha!234",sessionId);
		 ftp.upload(file, remotePath,diagnostic.getOriginalFilename());
		// JobProcessor jobProcessor=new JobProcessor();
	//	 jobProcessor.submitJob(sessionId);
		 System.out.println("AddedJob to queue: "+ sessionId);
		 
		return "submit";		
	}
}