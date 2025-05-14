package com.skilldistillery.ghostkitchen.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.skilldistillery.ghostkitchen.data.RestaurantDAO;
import com.skilldistillery.ghostkitchen.data.UserDAO;
import com.skilldistillery.ghostkitchen.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;
	@Autowired
	private RestaurantDAO restaurantDao;

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
	public String userLogin(User user, HttpSession session) {
		user = userDao.authenticateUser(user.getUsername(), user.getPassword());

		if (user != null) {
			session.setAttribute("loggedInUser", user);
			session.setAttribute("cuisineTypes", restaurantDao.showCuisine()); //DELETEME
			return "profile";
		} else {
			return "login";
		}
	}

	@GetMapping("register.do")
	public String getRegister(Model model, HttpSession session) {
		return "register";
	}

	@GetMapping("profile.do")
	public String getProfile(Model model, HttpSession session) {
		return "profile";
	}

	@PostMapping(path = "register.do")
	public String newRegister(User user, HttpSession session) {
		user = userDao.register(user);
		session.setAttribute("loggedInUser", user);
		return "account";
	}

	@GetMapping("logout.do")
	public String getLogout(Model model, HttpSession session) {
		session.removeAttribute("loggedInUser");
		return "login";
	}

	@PostMapping(path = "updateUser.do")
	public String updateUser(Model model, User user, HttpSession session) {
		User updated = userDao.updateUser(user.getId(), user);
		session.setAttribute("loggedInUser", updated);
		model.addAttribute("message", "User updated successfully!");
		return "account";
	}
	
}