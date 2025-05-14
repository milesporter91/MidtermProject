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
<title>Add Restaurant</title>

</head>
<body>
	<jsp:include page="nav.jsp" />

	<form action="create.do" method="POST">
		<table>
			<tr>
				<td><label for="name">Add Restaurant Name:</label></td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td><label for="address.street">Add Address Street:</label></td>
				<td><input type="text" name="address.street"></td>
			</tr>
			<tr>
				<td><label for="address.street2">Add Address Street 2:</label></td>
				<td><input type="text" name="address.street2"></td>
			</tr>
			<tr>
				<td><label for="address.city">Add Address City:</label></td>
				<td><input type="text" name="address.city"></td>
			</tr>
			<tr>
				<td><label for="address.state">Add Address State:</label></td>
				<td><input type="text" name="address.state"></td>
			</tr>
			<tr>
				<td><label for="address.zipCode">Add Address Zip Code:</label></td>
				<td><input type="text" name="address.zipCode"></td>
			</tr>
			<tr>
				<td><label for="address.phone">Add Address Phone:</label></td>
				<td><input type="text" name="address.phone"></td>
			</tr>
			<tr>
				<td><label for="imageUrl">Add Image Url:</label></td>
				<td><input type="text" name="imageUrl"></td>
			</tr>

			<tr>
				<td><label for="websiteUrl">Add Website URL:</label></td>
				<td><input type="text" name="websiteUrl"></td>
			</tr>
			<tr>
				<td><label for="description">Add Description:</label></td>
				<td><input type="text" name="description"></td>
			</tr>
			<tr>
				<td><label for="priceRange">Add Price Range(1-5):</label></td>
				<td><input type="number" name="priceRange" step="1" min="1"
					max="5"></td>
			</tr>
			<tr>
				<td><label for="openTime">Add Opening Time:</label></td>
				<td><input type="time" name="openTime"></td>
			</tr>
			<tr>
				<td><label for="closeTime">Add Closing Time:</label></td>
				<td><input type="time" name="closeTime"></td>
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
				<td colspan="2"><button type="submit" class="btn btn-primary">Save
						Restaurant</button></td>
			</tr>
		</table>
	</form>


	<jsp:include page="footer.jsp" />

</body>
</html>