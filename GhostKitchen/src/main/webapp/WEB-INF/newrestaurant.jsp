<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Restaurant | Ghost Kitchen</title>

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
			<h2 class="text-neon text-center mb-4">Add New Restaurant</h2>

			<form action="create.do" method="POST">
				<div class="row g-3">
					<div class="col-md-6">
						<label class="form-label text-neon">Restaurant Name</label> <input
							type="text" class="form-control" name="name" required>
					</div>

					<div class="col-md-6">
						<label class="form-label text-neon">Image URL</label> <input
							type="text" class="form-control" name="imageUrl">
					</div>

					<div class="col-md-6">
						<label class="form-label text-neon">Website URL</label> <input
							type="text" class="form-control" name="websiteUrl">
					</div>

					<div class="col-md-6">
						<label class="form-label text-neon">Description</label> <input
							type="text" class="form-control" name="description">
					</div>
					<div class="col-md-6">
						<label class="form-label text-neon">Cuisine Type</label>
							<select name="cuisineTypeId"
								class="form-control">
								<option value="">Cuisine...</option>
								<c:forEach var="cuisineType" items="${cuisineTypes}">
								<option value="${cuisineType.id}">${cuisineType.name}</option>
								</c:forEach>
							</select>
					</div>


					<div class="col-md-4">
						<label class="form-label text-neon">Price Range (1–5)</label> <input
							type="number" class="form-control" name="priceRange" min="1"
							max="5">
					</div>

					<div class="col-md-4">
						<label class="form-label text-neon">Open Time</label> <input
							type="time" class="form-control" name="openTime">
					</div>

					<div class="col-md-4">
						<label class="form-label text-neon">Close Time</label> <input
							type="time" class="form-control" name="closeTime">
					</div>

					<div class="col-12">
						<hr class="text-neon">
					</div>

					<div class="col-md-6">
						<label class="form-label text-neon">Street</label> <input
							type="text" class="form-control" name="address.street">
					</div>

					<div class="col-md-6">
						<label class="form-label text-neon">Street 2</label> <input
							type="text" class="form-control" name="address.street2">
					</div>

					<div class="col-md-4">
						<label class="form-label text-neon">City</label> <input
							type="text" class="form-control" name="address.city">
					</div>

					<div class="col-md-4">
						<label class="form-label text-neon">State</label> <input
							type="text" class="form-control" name="address.state">
					</div>

					<div class="col-md-4">
						<label class="form-label text-neon">Zip Code</label> <input
							type="text" class="form-control" name="address.zipCode">
					</div>

					<div class="col-md-6">
						<label class="form-label text-neon">Phone</label> <input
							type="text" class="form-control" name="address.phone">
					</div>

					<div class="col-12 text-center mt-4">
						<button type="submit" class="glow-btn">Save Restaurant</button>
					</div>
				
				</div>
			</form>
		</div>
	</div>

	<jsp:include page="footer.jsp" />
</body>
</html>