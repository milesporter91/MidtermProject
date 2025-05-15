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

<nav class>
	<br>
	<body>
		<jsp:include page="nav.jsp" />
	<form action="createReview.do" method="POST">
	<input type="number" name="rating" min="1" max="5">
	<input type="text" name="comments" >
	<input type="hidden" name="restaurantId" value="${restaurant.id }"/>
	<button type="submit"> submit
	</button>
	
	</form>

		<h1>${restaurant.name }</h1>
		<c:if test="${not empty sessionScope.loggedInUser}">
			<a href="update.do?restaurantId=${restaurant.id}">Update This
				Restaurant</a>
		</c:if>
</nav>
<jsp:include page="footer.jsp" />

</body>
</html>