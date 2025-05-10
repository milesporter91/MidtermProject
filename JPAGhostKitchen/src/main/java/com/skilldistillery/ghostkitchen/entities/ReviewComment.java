package com.skilldistillery.ghostkitchen.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="review_comment")
public class ReviewComment {
	@Id
	@GeneratedValue
	private int id;
	private String comment;
	@Column(name="create_date")
	private LocalDateTime createDate;
	private boolean enabled;
	
//	@Column(name="user_id")
//	private User user;
	
	@ManyToOne
	@JoinColumn(name="review_id")
	private Review review;
	
//	@Column(name="in_reply_to_id")
//	private ReviewComment reviewComment;
	
	public ReviewComment() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public Review getReview() {
		return review;
	}

	public void setReview(Review review) {
		this.review = review;
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
		ReviewComment other = (ReviewComment) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "ReviewComment [id=" + id + ", comment=" + comment + ", createDate=" + createDate + ", enabled="
				+ enabled + "]";
	}
	


}
