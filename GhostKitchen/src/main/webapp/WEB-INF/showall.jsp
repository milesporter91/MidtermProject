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
<body>
	<jsp:include page="nav.jsp" />

	<table>
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
					<td><a href="${restaurant.websiteUrl }"> ${restaurant.name }</a>
					</td>
			<%-- 		<td>${restaurant.cuisineTypes }</td> --%>
					<td>${restaurant.openTime } - ${restaurant.closeTime }</td>
					<td>${restaurant.address.phone }</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>

</body>
</html>