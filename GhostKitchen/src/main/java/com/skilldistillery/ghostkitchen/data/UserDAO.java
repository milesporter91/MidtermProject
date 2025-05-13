package com.skilldistillery.ghostkitchen.data;

import java.util.List;

import com.skilldistillery.ghostkitchen.entities.Restaurant;
import com.skilldistillery.ghostkitchen.entities.User;

public interface UserDAO {
	User authenticateUser(String username, String password);

	User register(User user);

	User updateUser(int id, User user);
	
	List<Restaurant> showAll();

}
