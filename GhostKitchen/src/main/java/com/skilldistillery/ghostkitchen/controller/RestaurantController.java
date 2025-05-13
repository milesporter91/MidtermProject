package com.skilldistillery.ghostkitchen.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.ghostkitchen.data.RestaurantDAO;
import com.skilldistillery.ghostkitchen.entities.Restaurant;
import com.skilldistillery.ghostkitchen.entities.User;

import ch.qos.logback.core.joran.spi.HttpUtil.RequestMethod;
import jakarta.servlet.http.HttpSession;

@Controller
public class RestaurantController {

	@Autowired
	RestaurantDAO restaurantDao;

	@GetMapping("showAll.do")
	public String showAll(Model model) {
		List<Restaurant> restaurants = restaurantDao.showAll();
		model.addAttribute("restaurants", restaurants);
		return "showall";
	}

	// Display
	@GetMapping("showRestaurant.do")
	public String show(Model model, @RequestParam("id") int id) {
		Restaurant restaurant = restaurantDao.findById(id);
		model.addAttribute("restaurant", restaurant);
		return "show";

	}

	// Update
	@PostMapping("updateRestaurant.do")
	public String updateRestaurant(Restaurant restaurant, int id) {
		restaurantDao.update(restaurant, id);
		return "show";
	}

	@GetMapping("addRestaurant.do")
	public String goToCreateForm() {
		return "newrestaurant"; 
	}
	
	// Create
	@PostMapping("create.do")
	public String addRestaurant(Restaurant restaurant, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser"); 
		restaurantDao.create(restaurant, user.getId());
		return "show";
	}

	// Delete
	@PostMapping("deleteRestuarant.do")
	public void delete(Model model, @RequestParam("id") int id) {
		restaurantDao.delete(id);
		model.addAttribute("messsage", "Restaurant Successfull deleted");
	}
}
