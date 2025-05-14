<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-secondary">
  <div class="container-fluid">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/home.do">
      <img
        src="${pageContext.request.contextPath}/images/logo.png"
        alt="Logo"
        height="60"
        class="d-inline-block align-text-top"
      />
    </a>

    <button
      class="navbar-toggler"
      type="button"
      data-bs-toggle="collapse"
      data-bs-target="#mainNavbar"
      aria-controls="mainNavbar"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="mainNavbar">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" href="home.do">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="showAll.do">Show All Restaurants</a>
        </li>
        <c:if test="${empty sessionScope.loggedInUser}">
          <li class="nav-item"><a class="nav-link" href="login.do">Login</a></li>
          <li class="nav-item"><a class="nav-link" href="register.do">Register</a></li>
        </c:if>
        <c:if test="${not empty sessionScope.loggedInUser}">
          <li class="nav-item"><a class="nav-link" href="addRestaurant.do">Create Restaurant</a></li>
          <li class="nav-item"><a class="nav-link" href="account.do">Account</a></li>
          <li class="nav-item"><a class="nav-link" href="logout.do">Logout</a></li>
        </c:if>
      </ul>
    </div>
  </div>
</nav>
