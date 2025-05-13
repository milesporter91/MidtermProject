package com.skilldistillery.ghostkitchen.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.skilldistillery.ghostkitchen.data.UserDAO;
import com.skilldistillery.ghostkitchen.entities.Restaurant;
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
	public String userLogin(User user, HttpSession session) {
		user = userDao.authenticateUser(user.getUsername(), user.getPassword());

		if (user != null) {
			session.setAttribute("loggedInUser", user);
			return "account";
		} else {
			return "login";
		}
	}

	@GetMapping("register.do")
	public String getRegister(Model model, HttpSession session) {
		return "register";
	}

	@PostMapping(path = "register.do")
	public String newRegister(User user, HttpSession session) {
		userDao.register(user);
		session.setAttribute("loggedInUser", user);
		return "account";
	}

	@GetMapping("logout.do")
	public String getLogout(Model model, HttpSession session) {
		session.removeAttribute("loggedInUser");
		return "login";
	}

	@PostMapping(path = "updateUser.do")
	public String updateUser(Model model, User user) {
		User updated = userDao.updateUser(user.getId(), user);
		model.addAttribute("loggedInUser", updated);
		model.addAttribute("message", "User updated successfully!");
		return "account";
	}
	
	@GetMapping("showAll.do")
	public String showAll (Model model) {
		List<Restaurant> restaurants = userDao.showAll();
				model.addAttribute("restaurants", restaurants);
		
		return "showall";
		
	}
}