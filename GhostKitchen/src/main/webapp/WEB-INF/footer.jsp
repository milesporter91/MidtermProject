<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<footer>
		<img src="images/ghostlogo.png" alt="Footer Logo"
			style="height: 100px;" />
			<c:if test="${not empty sessionScope.loggedInUser}">
			<a href="account.do">Update Account</a>
			</c:if>
	</footer>
</body>
</html>