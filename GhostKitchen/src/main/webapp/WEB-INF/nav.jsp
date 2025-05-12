<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<nav>
	<a href="index.do">Home</a> <a href="account.do">Account</a>
	<c:if test="${empty sessionScope.loggedInUser }">
		<a href="login.do">Login</a>
		<a href="register.do">Register</a>
	</c:if>
	<c:if test="${not empty sessionScope.loggedInUser }">
		<a href="logout.do">Logout</a>
	</c:if>
</nav>