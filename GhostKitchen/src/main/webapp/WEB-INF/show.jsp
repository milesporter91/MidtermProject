<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${restaurant.name}|Ghost Kitchen</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>

<body class="body-bg3">
	<jsp:include page="nav.jsp" />

	<div class="d-flex justify-content-center align-items-center"
		style="min-height: 100vh;">
		<div class="neon-card p-4 text-center w-100" style="max-width: 600px;">

			<img src="${restaurant.imageUrl}" alt="${restaurant.name}"
				class="rounded mb-4"
				style="max-width: 100%; height: auto; border: 3px solid #c6ff00;">

			<h1 class="text-neon mb-3">${restaurant.name}</h1>

			<c:if test="${not empty restaurant.websiteUrl}">
				<p class="mb-3">
					<a href="${restaurant.websiteUrl}" target="_blank"
						class="text-neon text-decoration-underline"> Visit Website </a>
				</p>
			</c:if>

			<p class="text-light mb-3">
				<strong>Description:</strong><br> ${restaurant.description}
			</p>

			<p class="text-light mb-3">
				<strong>Price Range:</strong> ${restaurant.priceRange}/5
			</p>

			<p class="text-light mb-4">
				<strong>Hours:</strong> ${restaurant.openTime} –
				${restaurant.closeTime}
			</p>

			<c:if test="${not empty sessionScope.loggedInUser}">
				<a href="update.do?restaurantId=${restaurant.id}"
					class="btn btn-outline-light mb-4">Update This Restaurant</a>
			</c:if>
			<h3 class="text-neon mt-1 mb-3">Reviews</h3>

			<c:forEach var="review" items="${reviews}">
				<div class="neon-card mb-3 p-3 text-start">
					<div class="d-flex align-items-center mb-2">
						<c:forEach begin="1" end="${review.rating}" var="i">
							<i class="bi bi-star-fill text-neon me-1"></i>
						</c:forEach>
					</div>
					<p class="text-light mb-0">${review.comments}</p>
				</div>
				
				
			</c:forEach>
			<c:if test="${not empty sessionScope.loggedInUser }">
			<form action="createReview.do" method="POST">
				<input type="hidden" name="restaurantId" value="${restaurant.id}" />

				<div class="mb-3">
					<label class="form-label text-neon">Your Rating:</label>
					<div class="star-rating d-flex justify-content-center">
						<c:forEach var="i" begin="1" end="5">
							<input type="radio" id="star${i}" name="rating" value="${i}"
								class="d-none" />
							<label for="star${i}"
								class="bi bi-star-fill fs-3 me-2 star-hover text-light"></label>
						</c:forEach>
					</div>
				</div>

				<div class="mb-3">
					<label for="comments" class="form-label text-neon">Comment</label>
					<textarea name="comments" class="form-control" rows="3"
						placeholder="Write something..."></textarea>
				</div>

				<button type="submit" class="glow-btn w-100">Submit Review</button>
			</form>
			</c:if>
		</div>
	</div>

	<jsp:include page="footer.jsp" />
</body>
</html>