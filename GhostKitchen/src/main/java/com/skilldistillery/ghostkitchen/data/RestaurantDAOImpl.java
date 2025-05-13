package com.skilldistillery.ghostkitchen.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.ghostkitchen.entities.Restaurant;
import com.skilldistillery.ghostkitchen.entities.User;

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
	public List<Restaurant> showAll() {

		List<Restaurant> restaurants = null;
		String jpql = "SELECT r FROM Restaurant r";
		restaurants = em.createQuery(jpql, Restaurant.class).getResultList();
		return restaurants;
	}

	@Override
	public Restaurant findById(int id) {
		Restaurant restaurant = em.find(Restaurant.class, id);
		return restaurant;
	}

	@Override
	public Restaurant create(Restaurant restaurant, int userId) {
		User user = em.find(User.class, userId);
		if (user != null) {
			restaurant.setUser(user);
			restaurant.setEnabled(true);
			em.persist(restaurant.getAddress());
			em.persist(restaurant);
			return restaurant;
		}
		return null;
	}

	@Override
	public Restaurant update(Restaurant restaurant, int id) {
		
		Restaurant managedRestaurant = em.find(Restaurant.class, id);
		managedRestaurant.setName(restaurant.getName());
		managedRestaurant.setDescription(restaurant.getDescription());
		managedRestaurant.setImageUrl(restaurant.getImageUrl());
		managedRestaurant.setWebsiteUrl(restaurant.getWebsiteUrl());
		managedRestaurant.setPriceRange(restaurant.getPriceRange());
		managedRestaurant.setOpenTime(restaurant.getCloseTime());
		return restaurant;
	}

	@Override
	public boolean delete(int id) {
		em.remove(id);
		return true;
	}

}
