package com.skilldistillery.ghostkitchen.data;

import java.util.List;

import com.skilldistillery.ghostkitchen.entities.CuisineType;
import com.skilldistillery.ghostkitchen.entities.Restaurant;

public interface RestaurantDAO {
	Restaurant authenticateUser(String username, String password);

	Restaurant findById(int id);

	List<Restaurant> showAll();

	Restaurant create(Restaurant restaurant, int userId, int cuisineTypeId);

	Restaurant update(Restaurant restaurant, int id);

	List<CuisineType> showCuisine();

	public void disableRestaurant(int id);

	public List<Restaurant> findRestaurantsByCuisineType(String cuisineTypeName);

	Restaurant addCuisineType(int restaurantId, int cuisineTypeId);

	Restaurant removeCuisineType(int restaurantId, int cuisineTypeId);
}
