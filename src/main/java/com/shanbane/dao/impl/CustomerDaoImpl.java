package com.shanbane.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.shanbane.dao.CustomerDao;
import com.shanbane.entity.Customer;

@Repository
public class CustomerDaoImpl extends HibernateDaoSupport implements CustomerDao {
	
	public void add(Customer customer) {
		this.getHibernateTemplate().save(customer);
	}
	
	@Autowired  
	public void setMySessionFactory(SessionFactory sessionFactory) {
		  super.setSessionFactory(sessionFactory);  
	}



	

}
