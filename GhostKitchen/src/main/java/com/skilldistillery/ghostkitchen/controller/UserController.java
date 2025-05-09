package com.skilldistillery.ghostkitchen.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.skilldistillery.ghostkitchen.data.UserDAO;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;
	
	@GetMapping(path={"/" , "home.do"})
	public String home(Model model) {
	    model.addAttribute("SMOKETEST", userDao.authenticateUser("admin", "test"));
	    return "home";
	}
}
