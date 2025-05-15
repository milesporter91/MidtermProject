<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${restaurant.name}|GhostKitchen</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
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

					<div class="mb-3 text-neon">
						<div class="rating-card p-4 d-flex justify-content-center align-items-center">
							<div class="star-rating animated-stars">
								<input type="radio" id="star5" name="rating" value="5">
								<label for="star5" class="bi bi-star-fill"></label> <input
									type="radio" id="star4" name="rating" value="4"> <label
									for="star4" class="bi bi-star-fill"></label> <input
									type="radio" id="star3" name="rating" value="3"> <label
									for="star3" class="bi bi-star-fill"></label> <input
									type="radio" id="star2" name="rating" value="2"> <label
									for="star2" class="bi bi-star-fill"></label> <input
									type="radio" id="star1" name="rating" value="1"> <label
									for="star1" class="bi bi-star-fill"></label>
							</div>
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
	<script>
    document.querySelectorAll('.star-rating:not(.readonly) label').forEach(star => {
        star.addEventListener('click', function() {
            this.style.transform = 'scale(1.2)';
            setTimeout(() => {
                this.style.transform = 'scale(1)';
            }, 200);
        });
    });
</script>
</body>
</html>