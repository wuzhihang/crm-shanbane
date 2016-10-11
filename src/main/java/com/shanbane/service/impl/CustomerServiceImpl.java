package com.shanbane.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shanbane.dao.CustomerDao;
import com.shanbane.entity.Customer;
import com.shanbane.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService {
	
	@Autowired
	private CustomerDao customerDao;
	
	@Transactional
	public void add(Customer customer) {
		customerDao.add(customer);
	}
	


}
