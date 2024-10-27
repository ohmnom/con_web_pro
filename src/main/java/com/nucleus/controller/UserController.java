package com.nucleus.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nucleus.model.User;
import com.nucleus.service.Service;

@Controller
public class UserController
{
	@Autowired
	User users;

	@Autowired
	Service service;

	public static final String PAGE = "MessagePrintUser";
	public static final String MESSAGE = "message";
	public static final String REDIRECT = "redirect:/";
	public static final String MSG_SOMETHING_WENT_WRONG = "Something Went Wrong, Please Login Again. ";
	
	/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

	/*@RequestMapping("/dashBoard")
	public ModelAndView dashboardRedirect()
	{
		return new ModelAndView("DashBoard");
	}*/

	/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

	@RequestMapping("/NewUser")
	public ModelAndView loginRedirect(User users)
	{
		return new ModelAndView("UserReg");
	}

	@RequestMapping("/NoAccess")
	public ModelAndView noAccessRedirect()
	{
		return new ModelAndView("NoAccess", MESSAGE, "you don't have \"Admin Privileges\".");
	}

	@RequestMapping("/NoAccessAdmin")
	public ModelAndView noAccessAdminRedirect()
	{
		return new ModelAndView("NoAccessAdmin", MESSAGE, "you don't have \"User Privileges\".");
	}
	
	/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	
	@RequestMapping("/newUserSubmit")
	public ModelAndView newUserSubmit(@Valid User users, BindingResult bindingResult, @RequestParam("roles.roleID") String roleID) 
	{
		if (bindingResult.hasErrors()) 
		{
			return new ModelAndView("UserReg");
		}

		if (service.createNewUser(users,roleID))
		{
			return new ModelAndView(PAGE, MESSAGE, "User Registered Successfully");
		} 
		else 
		{
			return new ModelAndView(PAGE, MESSAGE, "User Registration Unsuccessful");
		}
	}
	
	/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/ 

	@RequestMapping("/restrictUser")
	public ModelAndView editUserRedirect(User users)
	{
		return new ModelAndView("EnableDisable");
	}
	
	/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

	@RequestMapping("/updateUserSubmit")
	public ModelAndView updateUser(User users, @RequestParam("userName") String userName, @RequestParam("choice") String choice, Authentication authentication) 
	{
		if (authentication.getName().equals(userName)) 
		{
			return new ModelAndView(PAGE, MESSAGE,"Sorry " + authentication.getName() + ", You Can Not Update Your Own Profile");
		} 
		else 
		{
			if (service.findUser(userName) != null) 
			{
				if (!userName.equals("")) 
				{
					if (service.enableDisable(userName, choice)) 
					{
						return new ModelAndView(PAGE, MESSAGE, "User Successfully Updated");
					} 
					else 
					{
						return new ModelAndView(PAGE, MESSAGE, "User Updation Failed");
					}

				} 
				else 
				{
					return new ModelAndView(PAGE, MESSAGE, "UserName Can Not Be Null");
				}
			} 
			else 
			{
				return new ModelAndView(PAGE, MESSAGE, "UserName Not Found");
			}
		}
	}
	
	/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

	@RequestMapping("/profile")
	public ModelAndView profileRedirect(User users, Authentication authentication) 
	{
		return new ModelAndView("ViewUser", "user", service.findUser(authentication.getName()));
	}
	
	/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	
}
