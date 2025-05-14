<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>



<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/main.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update Restaurant</title>

</head>
<body>
	<jsp:include page="nav.jsp" />

	<form action="updateRestaurant.do" method="POST">
		<input type="hidden" name="restaurantId" value="${restaurant.id}">
		<table>
			<tr>
				<td><label for="name">Edit Restaurant Name:</label></td>
				<td><input type="text" name="name" value="${restaurant.name }"></td>
			</tr>
			<tr>
				<td><label for="address.street">Edit Address Street:</label></td>
				<td><input type="text" name="address.street"
					value="${restaurant.address.street }"></td>
			</tr>
			<tr>
				<td><label for="address.street2">Edit Address Street 2:</label></td>
				<td><input type="text" name="address.street2"
					value="${restaurant.address.street2 }"></td>
			</tr>
			<tr>
				<td><label for="address.city">Edit Address City:</label></td>
				<td><input type="text" name="address.city"
					value="${restaurant.address.city }"></td>
			</tr>
			<tr>
				<td><label for="address.state">Edit Address State:</label></td>
				<td><input type="text" name="address.state"
					value="${restaurant.address.state }"></td>
			</tr>
			<tr>
				<td><label for="address.zipCode">Edit Address Zip Code:</label></td>
				<td><input type="text" name="address.zipCode"
					value="${restaurant.address.zipCode }"></td>
			</tr>
			<tr>
				<td><label for="address.phone">Edit Address Phone:</label></td>
				<td><input type="text" name="address.phone"
					value="${restaurant.address.phone }"></td>
			</tr>
			<tr>
				<td><label for="imageUrl">Edit Image Url:</label></td>
				<td><input type="text" name="imageUrl"
					value="${restaurant.imageUrl }"></td>
			</tr>

			<tr>
				<td><label for="websiteUrl">Edit Website URL:</label></td>
				<td><input type="text" name="websiteUrl"
					value="${restaurant.websiteUrl }"></td>
			</tr>
			<tr>
				<td><label for="description">Edit Description:</label></td>
				<td><input type="text" name="description"
					value="${restaurant.description }"></td>
			</tr>
			<tr>
				<td><label for="priceRange">Edit Price Range(1-5):</label></td>
				<td><input type="number" name="priceRange" step="1" min="1"
					max="5" value="${restaurant.priceRange }"></td>
			</tr>
			<tr>
				<td><label for="openTime">Edit Opening Time:</label></td>
				<td><input type="time" name="openTime"
					value="${restaurant.openTime }"></td>
			</tr>
			<tr>
				<td><label for="closeTime">Edit Closing Time:</label></td>
				<td><input type="time" name="closeTime"
					value="${restaurant.closeTime }"></td>
			</tr>
			<%-- <tr>
				<td><label for="createDate">Add Create Date:</label></td>
				<td><input type="hidden" name="createDate" value="${LocalDateTime.now }"></td>
			</tr> --%>
			<!-- 	<tr>
				<td><label for="lastUpdate">Add Last Update:</label></td>
				<td><input type="text" name="lastUpdate"></td>
			</tr> -->
			<tr>
				<td colspan="2"><button type="submit" class="btn btn-primary">Update
						Restaurant</button></td>
			</tr>
		</table>
	</form>

	<jsp:include page="footer.jsp" />

</body>
</html>