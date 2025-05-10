package com.skilldistillery.ghostkitchen.entities;

import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name="review_rating")
public class ReviewRating {
	@EmbeddedId
	private ReviewRatingId id;
	
	private Boolean rating;
	
	public ReviewRating() {
		super();
	}

	public ReviewRatingId getId() {
		return id;
	}

	public void setId(ReviewRatingId id) {
		this.id = id;
	}

	public Boolean getRating() {
		return rating;
	}

	public void setRating(Boolean rating) {
		this.rating = rating;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ReviewRating other = (ReviewRating) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ReviewRating [id=").append(id).append(", rating=").append(rating).append("]");
		return builder.toString();
	}
	
}
