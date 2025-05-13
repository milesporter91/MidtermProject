package com.skilldistillery.ghostkitchen.data;

import java.util.List;

import com.skilldistillery.ghostkitchen.entities.Restaurant;



public interface reviewDAO {
	 Restaurant authenticateUser(String username, String password);
	 
	 Restaurant findById(int id);
	 
	 List<Restaurant> showAll();
	 Restaurant create(Restaurant restaurant); 
	 Restaurant update(Restaurant restaurant); 
	 boolean delete(int id); 
	 
}
