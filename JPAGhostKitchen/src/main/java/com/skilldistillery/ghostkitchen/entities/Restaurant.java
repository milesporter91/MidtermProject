package com.skilldistillery.ghostkitchen.entities;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;

@Entity
public class Restaurant {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	
	@ManyToOne
	@JoinColumn(name="address_id")
	private Address address;
	
	private boolean enabled;
	@Column(name="image_url")
	private String imageUrl;
	@Column(name="website_url")
	private String websiteUrl;
	private String description;
	@Column(name="price_range")
	private Integer priceRange;
	
	
	@Column(name="open_time")
	private LocalDateTime openTime;
	
	@Column(name="close_time")
	private LocalDateTime closeTime;
	
	@Column(name="create_date")
	private LocalDateTime createDate;
	
	@Column(name="last_update")
	private LocalDateTime lastUpdate;

	@ManyToOne
	@JoinColumn(name="user_id")
	private User user; 
	
	@OneToMany(mappedBy="restaurant")
	private List<Review> reviews;
	
	@ManyToMany(mappedBy = "restaurants")
	private List<RestaurantTag> restaurantTags;
	
	@ManyToMany(mappedBy = "restaurants")
	private List<CuisineType> cuisineTypes;
	
	@ManyToMany(mappedBy = "restaurants")
	private List<RestaurantType> restaurantTypes;
	
	public Restaurant() {
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

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getWebsiteUrl() {
		return websiteUrl;
	}

	public void setWebsiteUrl(String websiteUrl) {
		this.websiteUrl = websiteUrl;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getPriceRange() {
		return priceRange;
	}

	public void setPriceRange(Integer priceRange) {
		this.priceRange = priceRange;
	}

	public LocalDateTime getOpenTime() {
		return openTime;
	}

	public void setOpenTime(LocalDateTime openTime) {
		this.openTime = openTime;
	}

	public LocalDateTime getCloseTime() {
		return closeTime;
	}

	public void setCloseTime(LocalDateTime closeTime) {
		this.closeTime = closeTime;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}

	public LocalDateTime getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(LocalDateTime lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Review> getReviews() {
		return reviews;
	}

	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}
	public List<RestaurantTag> getRestaurantTags() {
		return restaurantTags;
	}

	public void setRestaurantTags(List<RestaurantTag> restaurantTags) {
		this.restaurantTags = restaurantTags;
	}

	public List<CuisineType> getCuisineTypes() {
		return cuisineTypes;
	}

	public void setCuisineTypes(List<CuisineType> cuisineTypes) {
		this.cuisineTypes = cuisineTypes;
	}

	public List<RestaurantType> getRestaurantTypes() {
		return restaurantTypes;
	}

	public void setRestaurantTypes(List<RestaurantType> restaurantTypes) {
		this.restaurantTypes = restaurantTypes;
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
		Restaurant other = (Restaurant) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Restaurant [id=" + id + ", name=" + name + ", enabled=" + enabled + ", imageUrl=" + imageUrl
				+ ", websiteUrl=" + websiteUrl + ", description=" + description + ", priceRange=" + priceRange
				+ ", openTime=" + openTime + ", closeTime=" + closeTime + ", createDate=" + createDate + ", lastUpdate="
				+ lastUpdate + "]";
	}
	
	
	
}
