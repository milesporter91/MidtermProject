package com.skilldistillery.ghostkitchen.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import com.skilldistillery.ghostkitchen.data.RestaurantDAO;

@Configuration
public class AppConfiguration {
	@Autowired
	private RestaurantDAO restaurantDao;
	
	

}
