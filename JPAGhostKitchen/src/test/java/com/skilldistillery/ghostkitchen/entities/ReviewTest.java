package com.skilldistillery.ghostkitchen.entities;

import static org.junit.jupiter.api.Assertions.*;

import java.beans.PersistenceDelegate;

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
	void test_User_entity_mapping() {
		assertNotNull(review);

	}

	
}
