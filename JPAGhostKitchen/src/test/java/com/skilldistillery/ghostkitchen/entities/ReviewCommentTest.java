package com.skilldistillery.ghostkitchen.entities;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
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

class ReviewCommentTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private ReviewComment reviewComment;

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
		reviewComment = em.find(ReviewComment.class,1);
	}
				

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		reviewComment = null;
	}

	@Test
	void test_ReviewComment_entity_mapping() {
		assertNotNull(reviewComment);
	}
	
	@Test
	void test_ReviewComment_Review_MTO_mapping() {
		assertNotNull(reviewComment);
		Review review = reviewComment.getReview();
		assertNotNull(review);
	}
	
	@Test
	void test_ReviewComment_User_MTO_mapping() {
		assertNotNull(reviewComment);
		User user = reviewComment.getUser();
		assertNotNull(user);
	}
	
	@Test
	void test_ReviewComment_MTO_self_join_mapping() {
		assertNotNull(reviewComment);
		ReviewComment inReplyToReviewComment = reviewComment.getInReplyToReviewComment();
		assertNull(inReplyToReviewComment);
	}
	
	@Test
	void test_ReviewComment_OTM_self_join_mapping() {
		assertNotNull(reviewComment);
		List<ReviewComment> replies = reviewComment.getReplies();
		assertNotNull(replies);
		assertTrue(replies.size() == 0); // Fix to > 0 when additional inserts are added to DB
	}

	
}
