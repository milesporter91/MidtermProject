package com.skilldistillery.ghostkitchen.data;

import java.util.List;

import com.skilldistillery.ghostkitchen.entities.CuisineType;
import com.skilldistillery.ghostkitchen.entities.Restaurant;



public interface RestaurantDAO {
	 Restaurant authenticateUser(String username, String password);
	 
	 Restaurant findById(int id);
	 
	 List<Restaurant> showAll();
	 Restaurant create(Restaurant restaurant, int userId); 
	 Restaurant update(Restaurant restaurant, int id); 
	 List<CuisineType> showCuisine(); 
	 public void disableRestaurant(int id);
	 
}
