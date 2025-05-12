package com.skilldistillery.ghostkitchen.data;

import com.skilldistillery.ghostkitchen.entities.User;

public interface UserDAO {
	 User authenticateUser(String username, String password);
	 
	 User register(User user);
}
