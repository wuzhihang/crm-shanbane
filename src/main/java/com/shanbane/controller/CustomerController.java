package com.shanbane.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shanbane.entity.Customer;
import com.shanbane.service.CustomerService;

@Controller
public class CustomerController {
	
	private static final Log log = LogFactory.getLog(CustomerController.class);
	
	@Autowired
	CustomerService customerService;
	
	@RequestMapping(value = "customer")
	public @ResponseBody Map<String, Object> add(HttpServletRequest req) {
		Customer customer = new Customer();
	
		try {
			String name = req.getParameter("name");
			String mobile = req.getParameter("mobile");
			if(mobile!=null&&name!=null){
			log.info("name: " + name);
			log.info("mobile: " + mobile);
			customer.setName(name);
			customer.setMobile(mobile);			
			customerService.add(customer);
			return okData();
			}
		} catch (Exception e) {
			log.error("add", e);
		}
		return errInfo();
	}
	
	public Map<String, Object> okData(){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("errCode", 200);
		map.put("msg", "ok");
		return map;
	}
	
	public Map<String, Object> errInfo(){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("errCode", 202);
		map.put("msg", "error");
		
		return map;
	}

}
