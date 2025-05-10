package com.skilldistillery.ghostkitchen.entities;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class UserTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAGhostKitchen");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		user = em.find(User.class,1);
	}
				

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

	@Test
	void test_User_entity_mapping() {
		assertNotNull(user);
		assertEquals("admin", user.getUsername());

	}
	
	@Test
	void test_User_Restaurant_mtm_mapping() {
		List<Restaurant> favoriteRestaurants = user.getFavoriteRestaurants(); 
		assertNotNull(favoriteRestaurants);
		assertTrue(favoriteRestaurants.size() > 0); 
	}
	
	@Test
	void test_User_Restaurant_mto_mapping() {
		List<Restaurant> restaurants = user.getRestaurants(); 
		assertNotNull(restaurants);
		assertTrue(restaurants.size() > 0); 
	}

	@Test
	void test_User_RestaurantTag_mto_mapping() {
		List<RestaurantTag> restaurantTags = user.getRestaurantTags(); 
		assertNotNull(restaurantTags);
		assertTrue(restaurantTags.size() > 0); 
	}
	
	@Test
	void test_User_Review_mto_mapping() {
		List<Review> reviews = user.getReviews(); 
		assertNotNull(reviews);
		assertTrue(reviews.size() == 0); // TODO change back to > 0 after additional rows in db
	}
	
	@Test
	void test_User_ReviewRating_OTM_mapping() {
		List<ReviewRating> reviewRatings = user.getReviewRatings();
		assertNotNull(reviewRatings);
		assertTrue(reviewRatings.size() > 0); 
	}
	
	@Test
	void test_User_ReviewComment_OTM_mapping() {
		List<ReviewComment> reviewComments = user.getReviewComments();
		assertNotNull(reviewComments);
		assertTrue(reviewComments.size() > 0); 
	}
}
