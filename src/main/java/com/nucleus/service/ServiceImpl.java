package com.nucleus.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.nucleus.dao.UserDao;
import com.nucleus.model.Role;
import com.nucleus.model.User;
import com.nucleus.utility.Encoder;

@org.springframework.stereotype.Service @Transactional
public class ServiceImpl implements Service
{
		
	@Autowired
	UserDao userDao;
	
	@Autowired
	Role roles;
	
	@Autowired
	Encoder passwordEncoder;
	
	
	
	@Override
	public boolean enableDisable(String userName, String choice)
	{
		return userDao.enableDisable(userName, choice);
	}
	
	@Override
	public boolean createNewUser(User users, String roleID)
	{
		
		long millis=System.currentTimeMillis();
		java.sql.Date date=new java.sql.Date(millis);
		
		users.setPassword(passwordEncoder.encodePassword(users.getPassword()));
		users.setCreateDate(date);
		
		roles.setRoleID(roleID);
		
		if (roleID.equals("1"))
		{
			roles.setRoleName("ROLE_ADMIN");
		} 
		else if (roleID.equals("2"))
		{
			roles.setRoleName("ROLE_USER");
		}
		else
		{
			roles.setRoleName("ROLE_SPEAKER");
		}

		users.setRoles(roles);
		
		return userDao.createNewUser(users);
	}
	
	@Override
	public User findUser(String userName)
	{
		return userDao.findUser(userName);
	}

	@Override
	public int getMaxId() {
		
		return 0 ;
	}
}
