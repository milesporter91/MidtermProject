<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>All Restaurants</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="css/main.css">
</head>

<body class="body-bg4">
  <jsp:include page="nav.jsp" />

  <div class="d-flex justify-content-center align-items-center" style="min-height: 95vh;">
    <div class="neon-card">
      <h2 class="text-center text-neon mb-4">All Restaurants</h2>

      <div class="table-responsive">
        <table class="table table-dark table-hover align-middle text-center">
          <thead class="table-light text-dark">
            <tr>
              <th>Photo</th>
              <th>Name</th>
              <th>Cuisine</th>
              <th>Hours</th>
              <th>Phone</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="restaurant" items="${restaurants}">
              <tr>
                <td>
                  <img src="${restaurant.imageUrl}" alt="Restaurant Image" style="height: 60px; border-radius: 0.5rem;">
                </td>
                <td>
                  <a class="text-neon" href="showRestaurant.do?id=${restaurant.id}">
                    ${restaurant.name}
                  </a>
                </td>
                <td>
                  <c:forEach var="cuisineType" items="${restaurant.cuisineTypes}" varStatus="loop">
                    ${cuisineType.name}<c:if test="${!loop.last}">, </c:if>
                  </c:forEach>
                </td>
                <td>${restaurant.openTime} - ${restaurant.closeTime}</td>
                <td>${restaurant.address.phone}</td>
                <td>
                  <form action="disableRestuarant.do" method="POST">
                    <input type="hidden" name="restaurantId" value="${restaurant.id}" />
                    <input type="submit" class="btn btn-danger btn-sm" value="Delete" />
                  </form>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>

  <jsp:include page="footer.jsp" />
</body>
</html>