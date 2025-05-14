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

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>All Restaurants</title>

</head>

<br>
<body>
	<jsp:include page="nav.jsp" />

	<table class="primaryTest">
		<thead>
			<tr class="column_title">
				<th>Restaurant Name</th>
				<th>Cuisine Type</th>
				<th>Business Hours</th>
				<th>Phone</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="restaurant" items="${restaurants}">
				<tr>
					<td><a href="showRestaurant.do?id=${restaurant.id}">
							${restaurant.name }</a></td>
					<td>${restaurant.cuisineTypes }</td>
					<td>${restaurant.openTime }-${restaurant.closeTime }</td>
					<td>${restaurant.address.phone }</td>
					<td><form action="disableRestuarant.do" method="POST">
							<input type="hidden" name="restaurantId" value="${restaurant.id}"> <input
								type="submit" class="btn btn-danger" value="Delete" />
						</form></td>

				</tr>
			</c:forEach>
			<div id="carouselExampleIndicators" class="carousel slide">



				<div class="carousel-indicators">
					<c:forEach var="restaurant" items="${restaurants}">
						<div class="carousel-item"></div>
						<p>${retaurants.name }</p>
						<p>${retaurants.address }</p>
						<p>${retaurants.enabled }</p>
						<p>${retaurants.imageUrl }</p>
						<p>${retaurants.websiteUrl }</p>
						<p>${retaurants.description }</p>
						<p>${retaurants.priceRange }</p>
						<p>${retaurants.userId }</p>
						<p>${retaurants.openTime}</p>
						<p>${retaurants.closeTime}</p>
						<p>${retaurants.createDate }</p>
						<p>${retaurants.lastUpdate }</p>

					</c:forEach>
				</div>
			</div>





		</tbody>
	</table>


	<br>
	<br>
	<br>


	<jsp:include page="footer.jsp" />

</body>
</html>