package com.cumulus.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cumulus.DBManagement.Customer;
import com.cumulus.DBManagement.DBInstance;

@Controller
@SessionAttributes("requestid")
public class DataUploaderController {
	 private static final String UPLOAD_DIRECTORY ="C:\\nginx-1.14.2\\html\\images";
	 @RequestMapping("uploadform")  
	    public ModelAndView uploadForm(){  
	        return new ModelAndView("uploadform");   
	 }
	 
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String index(ModelMap model,@RequestParam("customerName") String customerName) {
		model.addAttribute("message","Hello from Spring MVC");
		Customer customer=DBInstance.createCustomer(customerName); 
		model.addAttribute("sessionid",customer.getSessionId());
		return "submit";
	
	}

    @RequestMapping(value="savefile",method=RequestMethod.POST)  
    public ModelAndView savefile( @RequestParam CommonsMultipartFile file,  
           HttpSession session) throws Exception{  
  
    //ServletContext context = session.getServletContext();  
    //String path = context.getRealPath(UPLOAD_DIRECTORY);  
    String path =UPLOAD_DIRECTORY;
    String filename = file.getOriginalFilename();  
  
    System.out.println(path+" "+filename);        
  
    byte[] bytes = file.getBytes();  
    BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(  
         new File(path + File.separator + filename)));  
    stream.write(bytes);  
    stream.flush();  
    stream.close();  
           
    return new ModelAndView("uploadform","filesuccess","File successfully saved!");  
    }  
}
