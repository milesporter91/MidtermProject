package com.skilldistillery.ghostkitchen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {

	@RequestMapping("index.do")
	public String index() {
		return "index";
	}
}