package com.skilldistillery.ghostkitchen.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.skilldistillery.ghostkitchen.data.UserDAO;
import com.skilldistillery.ghostkitchen.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;

	@GetMapping(path = { "/", "home.do" })
	public String home(Model model) {
		return "home";
	}

	@GetMapping("login.do")
	public String getLogin(HttpSession session) {
		if (session.getAttribute("loggedInUser") != null) {
			return "login";
		}
		return "login";
	}

	@PostMapping("login.do")
	public String useLogin(User user, HttpSession session) {
		user = userDao.authenticateUser(user.getUsername(), user.getPassword());

		if (user != null) {
			session.setAttribute("loggedInUser", user);
			return "account";
		} else {
			return "login";
		}
	
		
	}
	
}