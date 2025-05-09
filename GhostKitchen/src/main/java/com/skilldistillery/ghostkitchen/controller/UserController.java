package com.skilldistillery.ghostkitchen.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.ghostkitchen.data.UserDAO;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;
	
}
