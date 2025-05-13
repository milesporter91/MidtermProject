package com.skilldistillery.ghostkitchen.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.ghostkitchen.entities.Restaurant;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class RestaurantDAOImpl implements RestaurantDAO {
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Restaurant authenticateUser(String username, String password) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Restaurant register(Restaurant restaurant) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Restaurant> showAll() {
		
		List<Restaurant> restaurants = null;
			String jpql = "SELECT r FROM Restaurant r";
			restaurants = em.createQuery(jpql, Restaurant.class).getResultList();
		return restaurants;
	}

}
