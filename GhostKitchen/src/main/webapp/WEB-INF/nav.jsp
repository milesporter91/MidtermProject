<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark px-3 shadow-lg">
  <div class="container-fluid">
    <a class="navbar-brand fw-bold text-neon" href="${pageContext.request.contextPath}/home.do">
      <img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo" height="40" class="d-inline-block align-text-top" />
      GhostKitchen
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
    data-bs-target="#mainNavbar" aria-controls="mainNavbar" aria-expanded="false" 
    aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="mainNavbar">
      <ul class="navbar-nav ms-auto align-items-center">

 
        <li class="nav-item me-3">
          <form action="findByCuisineType.do" method="GET">
            <select name="cuisineTypeName" class="form-select form-select-sm bg-dark text-light border-neon" onchange="this.form.submit()">
              <option value="">Cuisine...</option>
              <option value="Filipino">Filipino</option>
              <option value="Mexican">Mexican</option>
              <option value="American">American</option>
              <option value="Thai">Thai</option>
              <option value="Brazilian">Brazilian</option>
              <option value="Japanese">Japanese</option>
              <option value="Middle-Eastern">Middle-Eastern</option>
              <option value="Columbian">Columbian</option>
              <option value="Polish">Polish</option>
              <option value="Chinese">Chinese</option>
              <option value="Ethiopian">Ethiopian</option>
              <option value="Greek">Greek</option>
              <option value="African">African</option>
              <option value="Hawaian">Hawaian</option>
              <option value="Peruvian">Peruvian</option>
            </select>
          </form>
        </li>
        <li class="nav-item"><a class="nav-link text-neon" href="showAll.do">Restaurants</a></li>
        <c:choose>
          <c:when test="${empty sessionScope.loggedInUser}">
            <li class="nav-item"><a class="nav-link text-neon" href="login.do">Login</a></li>
            <li class="nav-item"><a class="nav-link text-neon" href="register.do">Register</a></li>
          </c:when>
          <c:otherwise>
            <li class="nav-item"><a class="nav-link text-neon" href="addRestaurant.do">Create</a></li>
            <li class="nav-item"><a class="nav-link text-neon" href="account.do">Account</a></li>
            <li class="nav-item"><a class="nav-link text-neon" href="profile.do">Profile</a></li>
            <li class="nav-item"><a class="nav-link text-neon" href="logout.do">Logout</a></li>
          </c:otherwise>
        </c:choose>
      </ul>
    </div>
  </div>
</nav>