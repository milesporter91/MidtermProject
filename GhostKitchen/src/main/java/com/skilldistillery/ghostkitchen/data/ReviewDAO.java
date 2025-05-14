package com.skilldistillery.ghostkitchen.data;

import java.util.List;

import com.skilldistillery.ghostkitchen.entities.Restaurant;
import com.skilldistillery.ghostkitchen.entities.Review;



public interface ReviewDAO {
	
//	Review findById(int id);
//	Review update(Review review, int reviewId);
	
	Review create(Review review, int userId, int restaurantId);
	
//	Review disable(int reviewId);
//	
//	List<Review> findReviewsByRestaurantId(int restaurantId);
//	List<Review> findReviewsByUserId(int userId);
	 
}
