package com.skilldistillery.ghostkitchen.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.skilldistillery.ghostkitchen.data.RestaurantDAO;
import com.skilldistillery.ghostkitchen.entities.Restaurant;

@Controller
public class RestaurantController {
	
	@Autowired
	RestaurantDAO restaurantDao;
	
	@GetMapping("showAll.do")
	public String showAll (Model model) {
		List<Restaurant> restaurants = restaurantDao.showAll();
				model.addAttribute("restaurants", restaurants);
		
		return "showall";
		
	}

}
