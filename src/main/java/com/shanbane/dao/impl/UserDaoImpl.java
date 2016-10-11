package com.shanbane.dao.impl;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.shanbane.dao.UserDao;
import com.shanbane.entity.User;

@Repository
public class UserDaoImpl extends HibernateDaoSupport implements UserDao {

	@Autowired
	public void setMySessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}
	
	public User findUserByNamePwd(String username, String pwd) {
        Session session = this.getSessionFactory().getCurrentSession();
        Criteria crit = session.createCriteria(User.class);
        crit.add(Restrictions.eq("username", username))
        	.add(Restrictions.eq("pwd", pwd));
		return (User)crit.uniqueResult();
	}

}
