package com.skilldistillery.ghostkitchen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import jakarta.servlet.http.HttpSession;

@Controller
public class AccountController {
	
	@GetMapping("account.do")
	public String displayAccount(HttpSession session) {
		if (session.getAttribute("loggedInUser" ) != null) {
			return "account";
		} else {
			return "login";
		}
	}
}