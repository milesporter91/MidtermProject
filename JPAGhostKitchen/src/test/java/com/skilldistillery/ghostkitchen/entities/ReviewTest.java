package com.skilldistillery.ghostkitchen.entities;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class ReviewTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Review review;

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
		review = em.find(Review.class,1);
	}
				

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		review = null;
	}

	@Test
	void test_Review_entity_mapping() {
		assertNotNull(review);

	}
	
	@Test
	void test_Review_User_MTO_entity_mapping() {
		User user = review.getUser();
		assertNotNull(user);

	}
	
	@Test
	void test_Review_ReviewComment_OTM_entity_mapping() {
		List<ReviewComment> reviewComments = review.getReviewComments(); 
		assertNotNull(reviewComments);
		assertTrue(reviewComments.size() > 0);

	}
	
	@Test
	void test_Review_ReviewRating_OTM_mapping() {
		List<ReviewRating> reviewRatings = review.getReviewRatings();
		assertNotNull(reviewRatings);
		assertTrue(reviewRatings.size() > 0); 
	}
	
}
