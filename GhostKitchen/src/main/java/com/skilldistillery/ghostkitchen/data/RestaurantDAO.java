package com.skilldistillery.ghostkitchen.data;

import java.util.List;

import com.skilldistillery.ghostkitchen.entities.Restaurant;



public interface RestaurantDAO {
	 Restaurant authenticateUser(String username, String password);
	 
	 Restaurant findById(int id);
	 
	 List<Restaurant> showAll();
}
