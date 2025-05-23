package com.skilldistillery.ghostkitchen.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="cuisine_type")
public class CuisineType {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	private String description;
	
	@ManyToMany
	@JoinTable(name="restaurant_cuisine_type", 
	joinColumns=@JoinColumn(name="cuisine_type_id"),
	inverseJoinColumns=@JoinColumn(name="restaurant_id"))
	private List<Restaurant> restaurants;
	

	
	@Column(name="image_url")
	private String imageUrl;
	

	public CuisineType() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public List<Restaurant> getRestaurants() {
		return restaurants;
	}

	public void setRestaurants(List<Restaurant> restaurants) {
		this.restaurants = restaurants;
	}

	public void addRestaurant(Restaurant restaurant) {
		if ( restaurants == null) { restaurants = new ArrayList<>(); }
		if ( ! restaurants.contains(restaurant)) {
			restaurants.add(restaurant);
			restaurant.addCuisineType(this);
		}
	}
	
	public void removeRestaurant(Restaurant restaurant) {
		if ( restaurants != null && restaurants.contains(restaurant)) {
			restaurants.remove(restaurant);
			restaurant.removeCuisineType(this);
		}
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CuisineType other = (CuisineType) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return this.name;
	}

	
	
}
