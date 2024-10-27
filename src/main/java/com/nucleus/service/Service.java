package com.nucleus.service;

import org.springframework.security.access.annotation.Secured;

import com.nucleus.model.User;

public interface Service
{
	@Secured("ROLE_ADMIN")
	public boolean createNewUser(User users, String roleID);
	@Secured("ROLE_ADMIN")
	public boolean enableDisable(String userName, String choice);
	@Secured({"ROLE_ADMIN, ROLE_USER,ROLE_SPEAKER"})
	public User findUser(String userName);
	public int getMaxId();
}
