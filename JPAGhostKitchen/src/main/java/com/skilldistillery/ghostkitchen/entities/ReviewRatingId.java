package com.skilldistillery.ghostkitchen.entities;

import java.io.Serializable;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

@Embeddable
public class ReviewRatingId implements Serializable{
	private static final long serialVersionUID = 1L;

	@Column(name = "user_id")
	private int userId;
	
	@Column(name = "review_id")
	private int reviewId;

	
	// No-args constructor
	public ReviewRatingId() {
		super();
	}

	// All-args constructor
	public ReviewRatingId(int userId, int reviewId) {
		super();
		this.userId = userId;
		this.reviewId = reviewId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		return Objects.hash(reviewId, userId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ReviewRatingId other = (ReviewRatingId) obj;
		return reviewId == other.reviewId && userId == other.userId;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ReviewRatingId [userId=").append(userId).append(", reviewId=").append(reviewId).append("]");
		return builder.toString();
	}
	
	
	
	
}
