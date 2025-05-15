package com.skilldistillery.ghostkitchen.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.ghostkitchen.data.RestaurantDAO;
import com.skilldistillery.ghostkitchen.data.ReviewDAO;
import com.skilldistillery.ghostkitchen.entities.Review;
import com.skilldistillery.ghostkitchen.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.servlet.http.HttpSession;

@Controller
public class ReviewController {

	@PersistenceContext
	private EntityManager em;

	@Autowired
	ReviewDAO reviewDAO;
	@Autowired
	RestaurantDAO restaurantDAO;

	@PostMapping("createReview.do")
	public String addReview(Review review, @RequestParam(name = "restaurantId") int restaurantId, HttpSession session, Model model) {

		User user = (User) session.getAttribute("loggedInUser");
		model.addAttribute("reviews", reviewDAO.findReviewsByRestaurantId(restaurantId)); 
		model.addAttribute("restaurant", restaurantDAO.findById(restaurantId));

		if (user != null) {
			review = reviewDAO.create(review, user.getId(), restaurantId);
			model.addAttribute("reviews", reviewDAO.findReviewsByRestaurantId(restaurantId)); 
		} 
		return "redirect:showRestaurant.do?id=" + restaurantId;
		
	}
}