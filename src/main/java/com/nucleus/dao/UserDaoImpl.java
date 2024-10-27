package com.nucleus.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nucleus.model.User;

@Repository
public class UserDaoImpl implements UserDao
{
	@Autowired
	User users;
			
	@PersistenceContext private EntityManager entityManager;
	
	
	
	/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	
	public boolean createNewUser(User users)
	{
		try
		{						
			entityManager.merge(users);
			return true;
		} 
		catch (Exception e) 
		{
			return false;
		}
	}
	
	/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	
	public boolean enableDisable(String userName, String choice)
	{
		try 
		{	
			javax.persistence.Query query = entityManager.createQuery("update User u set u.enabled= :choice where u.userName= :userName");
			query.setParameter("choice", choice);
			query.setParameter("userName", userName);
			query.executeUpdate();
			return true;
		}
		catch (Exception e)
		{
			return false;
		}
	}
	
	/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	
	public User findUser(String userName)
	{
		try
		{
			javax.persistence.Query query = entityManager.createQuery("from User u where u.userName= :userName");
			query.setParameter("userName", userName);
			return (User) query.getSingleResult();
		}
		catch (Exception e)
		{
			return null;
		}
	}
	
	/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
}
