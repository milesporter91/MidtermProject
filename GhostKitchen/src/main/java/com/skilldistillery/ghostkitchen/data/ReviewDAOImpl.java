package com.skilldistillery.ghostkitchen.data;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.ghostkitchen.entities.Restaurant;
import com.skilldistillery.ghostkitchen.entities.Review;
import com.skilldistillery.ghostkitchen.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class ReviewDAOImpl implements ReviewDAO {
	@PersistenceContext
	private EntityManager em;
	Restaurant restaurant;
	User user;

	@Override
	public Review create(Review review, int userId, int restaurantId) {
		
		User user = em.find(User.class, userId);
		Restaurant restaurant = em.find(Restaurant.class, restaurantId);
		
		if (user!= null && restaurant != null) {
			review.setEnabled(true);
			review.setUser(user);
			review.setRestaurant(restaurant);
			em.persist(review);
			return review;
			
		}
	return null;
}

	@Override
	public List<Review> findReviewsByRestaurantId(int restaurantId) {
		String jpql = "SELECT r FROM Review r JOIN r.restaurant WHERE r.restaurant.id = :restaurantId"; 
	 List<Review> reviews =	em.createQuery(jpql, Review.class)
				.setParameter("restaurantId", restaurantId)
				.getResultList(); 
	return reviews; 
	}

}
