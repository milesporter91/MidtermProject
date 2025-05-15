<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Profile | Ghost Kitchen</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="css/main.css">
</head>

<body class="body-bg1">
  <jsp:include page="nav.jsp" />

  <div class="d-flex justify-content-center align-items-center" style="min-height: 100vh;">
    <div class="neon-card p-5 text-center w-100" style="max-width: 500px;">
      <c:choose>
        <c:when test="${not empty loggedInUser}">
          <img src="${loggedInUser.imageUrl}" alt="Profile Image" 
               class="rounded-circle mb-4" 
               style="width: 150px; height: 150px; object-fit: cover; border: 3px solid #c6ff00;">

          <h2 class="text-neon mb-3">${loggedInUser.username}</h2>

          <p class="text-light"><strong>Name:</strong> ${loggedInUser.firstName} ${loggedInUser.lastName}</p>
          <p class="text-light"><strong>Email:</strong> ${loggedInUser.email}</p>
          <p class="text-light mb-4"><strong>About Me:</strong> ${loggedInUser.aboutMe}</p>

          <a href="account.do" class="glow-btn" style="background-color: green;">Edit Profile</a>
          <a href="home.do" class="glow-btn">Home</a>
        </c:when>
        <c:otherwise>
          <h2 class="text-light">No profile available. Please log in.</h2>
        </c:otherwise>
      </c:choose>
    </div>
  </div>

  <jsp:include page="footer.jsp" />
</body>
</html>