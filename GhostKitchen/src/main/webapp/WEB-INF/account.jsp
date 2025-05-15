<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Account Settings | Ghost Kitchen</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="css/main.css">
</head>

<body class="body-bg1">

  <jsp:include page="nav.jsp"/>

  <div class="d-flex justify-content-center align-items-center" style="min-height: 100vh;">
    <div class="neon-card p-4 w-100" style="max-width: 600px;">
      <c:choose>
        <c:when test="${not empty sessionScope.loggedInUser}">
          <h2 class="text-center text-neon mb-4">Welcome, ${sessionScope.loggedInUser.username}</h2>

          <form action="updateUser.do" method="POST">
            <input type="hidden" name="id" value="${loggedInUser.id}" />

            <div class="mb-3">
              <label for="firstName" class="form-label text-neon">First Name</label>
              <input type="text" class="form-control" name="firstName" value="${loggedInUser.firstName}" />
            </div>

            <div class="mb-3">
              <label for="lastName" class="form-label text-neon">Last Name</label>
              <input type="text" class="form-control" name="lastName" value="${loggedInUser.lastName}" />
            </div>

            <div class="mb-3">
              <label for="email" class="form-label text-neon">Email</label>
              <input type="email" class="form-control" name="email" value="${loggedInUser.email}" />
            </div>

            <div class="mb-3">
              <label for="imageUrl" class="form-label text-neon">Image URL</label>
              <input type="text" class="form-control" name="imageUrl" value="${loggedInUser.imageUrl}" />
            </div>

            <div class="mb-4">
              <label for="aboutMe" class="form-label text-neon">About Me</label>
              <input type="text" class="form-control" name="aboutMe" value="${loggedInUser.aboutMe}" />
            </div>

            <div class="d-flex justify-content-between">
              <button type="submit" class="glow-btn">Update</button>
              <a href="home.do" class=" glow-btn" style="background-color: red;">Cancel</a>
            </div>
          </form>
        </c:when>

        <c:otherwise>
          <h2 class="text-center text-light">Not Logged In</h2>
        </c:otherwise>
      </c:choose>
    </div>
  </div>

  <jsp:include page="footer.jsp"/>
</body>
</html>