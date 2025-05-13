package com.skilldistillery.ghostkitchen.entities;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class RestaurantTagTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private RestaurantTag restaurantTag;

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
		restaurantTag = em.find(RestaurantTag.class,1);
	}
				

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		restaurantTag = null;
	}

	@Test
	void test_RestaurantTag_entity_mapping() {
		assertNotNull(restaurantTag);

	}

	@Test
	void test_RestaurantTag_User_MTO_entity_mapping() {
		User user = restaurantTag.getUser();
		assertNotNull(user);
		assertNotNull(restaurantTag);
	}
	
	@Test
	void test_RestaurantTag_Restaurant_MTM_entity_mapping() {
	List<Restaurant> restaurants = restaurantTag.getRestaurants();
		assertNotNull(restaurants);
		assertNotNull(restaurantTag);
	}
	
}
