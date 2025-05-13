package com.skilldistillery.ghostkitchen.data;

import com.skilldistillery.ghostkitchen.entities.Restaurant;


public interface RestaurantDAO {
	 Restaurant authenticateUser(String username, String password);
	 
	 Restaurant register(Restaurant restaurant);
}
