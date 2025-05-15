package com.skilldistillery.ghostkitchen.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.ghostkitchen.data.RestaurantDAO;
import com.skilldistillery.ghostkitchen.data.ReviewDAO;
import com.skilldistillery.ghostkitchen.entities.Restaurant;
import com.skilldistillery.ghostkitchen.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.servlet.http.HttpSession;

@Controller
public class RestaurantController {
	@PersistenceContext
	private EntityManager em;
	@Autowired
	RestaurantDAO restaurantDao;
	@Autowired
	ReviewDAO reviewDao;

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
		model.addAttribute("reviews", reviewDao.findReviewsByRestaurantId(restaurant.getId())); 
		model.addAttribute("restaurant", restaurant);
		return "show";

	}

	// Update
	@GetMapping("update.do")
	public String goToUpdateForm(@RequestParam("restaurantId") int restaurantId, Model model, HttpSession session) {
		Restaurant restaurant = em.find(Restaurant.class, restaurantId);
		User user = (User) session.getAttribute("loggedInUser"); 
		if (user != null) {
		model.addAttribute("restaurant", restaurant);

		return "updaterestaurant";
		}
		else {
			model.addAttribute("reviews", reviewDao.findReviewsByRestaurantId(restaurant.getId())); 
			return "redirect:showRestaurant.do?id=" + restaurantId;
		}
	}
	
	@PostMapping("updateRestaurant.do")
	public String updateRestaurant(Model model, Restaurant restaurant,@RequestParam("restaurantId") int id, HttpSession session) {
		Restaurant updatedRestaurant = restaurantDao.update(restaurant, id);
		model.addAttribute("reviews", reviewDao.findReviewsByRestaurantId(restaurant.getId())); 
		return "redirect:showRestaurant.do?id=" + updatedRestaurant.getId();
	}

	@GetMapping("addRestaurant.do")
	public String goToCreateForm() {
		return "newrestaurant"; 
	}
	
	// Create
	@PostMapping("create.do")
	public String addRestaurant(Model model, Restaurant restaurant, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser"); 
		restaurantDao.create(restaurant, user.getId());
		model.addAttribute("reviews", reviewDao.findReviewsByRestaurantId(restaurant.getId())); 
		return "show";
	}

	// Delete
	@PostMapping("disableRestuarant.do")
	public String disable(Model model, @RequestParam("restaurantId") int id) {
		restaurantDao.disableRestaurant(id);
		List<Restaurant> restaurants = restaurantDao.showAll();
		model.addAttribute("restaurants", restaurants);
		model.addAttribute("messsage", "Restaurant Successfull disabled");
		return "showall";
	}
	
	@GetMapping("findByCuisineType.do")
	public String findByCuisineType(@RequestParam("cuisineTypeName") String cuisineTypeName, Model model, HttpSession session) {
		List<Restaurant> restaurantResults = restaurantDao.findRestaurantsByCuisineType(cuisineTypeName);
		model.addAttribute("message", "Restaurant Cuisine Type found");
		model.addAttribute("restaurantResults", restaurantResults);
		model.addAttribute("cuisineTypes", restaurantDao.showCuisine());
		return "searchresults";
	}
	
}
