package com.skilldistillery.ghostkitchen.entities;

import static org.junit.jupiter.api.Assertions.*;


import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class ReviewRatingTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private ReviewRating reviewRating;

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
		reviewRating = em.find(ReviewRating.class, new ReviewRatingId(1,1));
	}
				

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		reviewRating = null;
	}

	@Test
	void test_ReviewRating_entity_mapping() {
		assertNotNull(reviewRating);
	}
	
	@Test
	void test_ReviewRating_User_MTO_mapping() {
		assertNotNull(reviewRating);
		User user = reviewRating.getUser();
		assertNotNull(user);
	}
	
	@Test
	void test_ReviewRating_Review_MTO_mapping() {
		assertNotNull(reviewRating);
		Review review = reviewRating.getReview();
		assertNotNull(review);
	}
	

	
}
