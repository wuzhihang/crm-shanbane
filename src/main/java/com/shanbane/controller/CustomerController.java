package com.shanbane.controller;


import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shanbane.entity.Customer;
import com.shanbane.service.CustomerService;

@Controller
public class CustomerController {
	
	private static final Log log = LogFactory.getLog(CustomerController.class);
	
	@Autowired
	CustomerService customerService;
	
	@RequestMapping(value = "/customers_add", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> add(HttpServletRequest req) {
		System.out.println("hello");
		Customer customer = new Customer();	
		try {
			String name = req.getParameter("name");
			String mobile = req.getParameter("mobile");
			String job = req.getParameter("job");
			String major = req.getParameter("major");
			String university = req.getParameter("university");
			String jobYears = req.getParameter("jobYears");  
			String select = req.getParameter("select");
			log.info("name: " + name);
			log.info("mobile: " + mobile);
			log.info("job: " + job);
			log.info("major: " + major);
			log.info("university: " + university);
			log.info("jobYears: " + jobYears);
			log.info("select: " + select);
			customer.setName(name);
			customer.setMobile(mobile);
			customer.setJob(job);
			customer.setMajor(major);
			customer.setUniversity(university);
			customer.setJobYears(jobYears);
            customer.setCreateTime(new Date().getTime());
            customer.setMemsrc(select);
			customerService.add(customer);			
			return okData();
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
