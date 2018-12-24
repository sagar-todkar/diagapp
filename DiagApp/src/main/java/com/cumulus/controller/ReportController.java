package com.cumulus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cumulus.DBManagement.DBInstance;

@Controller
@SessionAttributes("requestid")
@RequestMapping("/report")
public class ReportController {
	@RequestMapping(value="/status",method=RequestMethod.GET)
	public String index(ModelMap model,@RequestParam("sessionid") String sessionid) {
		//model.addAttribute("message","Hello from Spring MVC");
		if(DBInstance.ifSessionExists(sessionid)) {
			//return "viewReport";
		return "redirect:http://192.168.1.57:80/"+sessionid+"/main.html";
		}
		else {
			model.addAttribute("sessionid",sessionid);
			return "status";
		}
			
	}

}
