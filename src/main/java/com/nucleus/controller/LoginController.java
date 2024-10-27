package com.nucleus.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nucleus.utility.MainFunctinaltity;

@Controller
public class LoginController
{
	@Autowired
	ServletContext servletContext;
	
	MainFunctinaltity mainFunctinaltity = new MainFunctinaltity();
	
	public static final String LOGINPAGE = "Login";
	public static final String MESSAGE = "message";
	
	@RequestMapping("/login")
	public ModelAndView loginRedirect()
	{
		return new ModelAndView(LOGINPAGE);
	}
	
	@RequestMapping("/HomePage")
	public ModelAndView loginSuccess()
	{
		return new ModelAndView("HomePage");
	}
	
	@RequestMapping("/HomePage2")
	public ModelAndView userRedirect()
	{
		return new ModelAndView("HomePage2");
	}
	
	@RequestMapping("/loginSuccess")
	public ModelAndView home()
	{ 	
		return new ModelAndView("redirect:/dashBoard");
	}
	
	@RequestMapping("/noAccess")
	public ModelAndView authorization()
	{
			return new ModelAndView(LOGINPAGE,MESSAGE,"Please Login Again");
	}
	
	@RequestMapping("/invalidSession")
	public ModelAndView invalidSession()
	{
		return new ModelAndView(LOGINPAGE,MESSAGE,"Something Went Wrong, Please Login Again");
	}
	
	@RequestMapping("/expiredSession")
	public ModelAndView expiredSession()
	{
		return new ModelAndView(LOGINPAGE,MESSAGE,"Session Expired, Please Login Again");
	}
	
	@RequestMapping("/loginFailed")
	public ModelAndView loginRedirect2()
	{
		return new ModelAndView(LOGINPAGE,MESSAGE,"Wrong UserName Or Password Entered ||| Also Multiple Sessions Are Not Allowed");
	}
	
	@RequestMapping("/logoutSuccess")
	public ModelAndView logoutRedirect()
	{
		return new ModelAndView(LOGINPAGE,MESSAGE,"Logout Successful");
	}
			
}
