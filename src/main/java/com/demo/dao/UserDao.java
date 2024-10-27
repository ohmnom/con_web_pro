package com.demo.dao;

import com.demo.model.User;

public interface UserDao 
{
	public boolean createNewUser(User users);
	public boolean enableDisable(String userName, String choice);
	public User findUser(String userName);
}
