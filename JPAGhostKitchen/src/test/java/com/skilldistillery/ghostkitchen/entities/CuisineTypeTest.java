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

class CuisineTypeTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private CuisineType cuisineType;

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
		cuisineType = em.find(CuisineType.class,1);
	}
				

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		cuisineType = null;
	}

	@Test
	void test_CuisineType_entity_mapping() {
		assertNotNull(cuisineType);
	}
	
	@Test
	void test_Restaurant_CuisineType_MTM_entity_mapping() {
		List<Restaurant> restaurants = cuisineType.getRestaurants();
		assertNotNull(restaurants);
		assertNotNull(cuisineType);
	}

	
}
