<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Restaurant</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/main.css">
</head>

<body class="body-bg1">
	<jsp:include page="nav.jsp" />

	<div class="d-flex justify-content-center align-items-center"
		style="min-height: 100vh;">
		<div class="neon-card p-5 w-100" style="max-width: 800px;">
			<h2 class="text-neon text-center mb-4">Update Restaurant</h2>


			<form action="updateRestaurant.do" method="POST">
				<input type="hidden" name="restaurantId" value="${restaurant.id}" />

				<div class="row g-3">
					<div class="col-md-6">
						<label class="form-label text-neon">Name</label> <input
							type="text" class="form-control" name="name"
							value="${restaurant.name}" required>
					</div>

					<div class="col-md-6">
						<label class="form-label text-neon">Image URL</label> <input
							type="text" class="form-control" name="imageUrl"
							value="${restaurant.imageUrl}">
					</div>

					<div class="col-md-6">
						<label class="form-label text-neon">Website URL</label> <input
							type="text" class="form-control" name="websiteUrl"
							value="${restaurant.websiteUrl}">
					</div>

					<div class="col-md-6">
						<label class="form-label text-neon">Description</label> <input
							type="text" class="form-control" name="description"
							value="${restaurant.description}">
					</div>
					<div class="col-md-4">
						<label class="form-label text-neon">Price Range (1–5)</label> <input
							type="number" class="form-control" name="priceRange" min="1"
							max="5" value="${restaurant.priceRange}">
					</div>

					<div class="col-md-4">
						<label class="form-label text-neon">Open Time</label> <input
							type="time" class="form-control" name="openTime"
							value="${restaurant.openTime}">
					</div>

					<div class="col-md-4">
						<label class="form-label text-neon">Close Time</label> <input
							type="time" class="form-control" name="closeTime"
							value="${restaurant.closeTime}">
					</div>

					<div class="col-12">
						<hr class="text-neon">
					</div>

					<div class="col-md-6">
						<label class="form-label text-neon">Street</label> <input
							type="text" class="form-control" name="address.street"
							value="${restaurant.address.street}">
					</div>

					<div class="col-md-6">
						<label class="form-label text-neon">Street 2</label> <input
							type="text" class="form-control" name="address.street2"
							value="${restaurant.address.street2}">
					</div>

					<div class="col-md-4">
						<label class="form-label text-neon">City</label> <input
							type="text" class="form-control" name="address.city"
							value="${restaurant.address.city}">
					</div>

					<div class="col-md-4">
						<label class="form-label text-neon">State</label> <input
							type="text" class="form-control" name="address.state"
							value="${restaurant.address.state}">
					</div>

					<div class="col-md-4">
						<label class="form-label text-neon">Zip</label> <input type="text"
							class="form-control" name="address.zipCode"
							value="${restaurant.address.zipCode}">
					</div>

					<div class="col-md-6">
						<label class="form-label text-neon">Phone</label> <input
							type="text" class="form-control" name="address.phone"
							value="${restaurant.address.phone}">
					</div>

					<div class="col-12 text-center mt-4">
						<button type="submit" class="glow-btn">Update Restaurant</button>
					</div>
				</div>
			</form>

			<hr>
			<h5 class="text-neon mt-4 text-center">Cuisine Types:</h5>

			<form action="addCuisineTypeToRestaurant.do" method="POST"
  class="mb-2 d-flex justify-content-center gap-2 align-items-center">
  <div class="d-flex align-items-center neon-card px-3 py-2">
    <input type="hidden" name="restaurantId" value="${restaurant.id}">
    <select name="cuisineTypeId" class="form-select w-auto bg-dark text-light border-neon">
      <c:forEach var="type" items="${cuisineTypes}">
        <option value="${type.id}">${type.name}</option>
      </c:forEach>
    </select>
    <button type="submit" class="btn btn-sm text-neon ms-2">Add</button>
  </div>
</form>

<div class="d-flex flex-wrap justify-content-center gap-3">
  <c:forEach var="type" items="${restaurant.cuisineTypes}">
    <div class="d-flex align-items-center neon-card px-3 py-2">
      <span class="text-light me-3">${type.name}</span>
      <form action="removeCuisineTypeFromRestaurant.do" method="POST" class="mb-0">
        <input type="hidden" name="restaurantId" value="${restaurant.id}">
        <input type="hidden" name="cuisineTypeId" value="${type.id}">
        <button type="submit" class="btn btn-sm btn-danger">Remove</button>
      </form>
    </div>
  </c:forEach>
</div>
	</div>
</body>
</html>