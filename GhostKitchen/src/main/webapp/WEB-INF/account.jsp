<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="jakarta.tags.core" prefix="c" %>



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
<link rel="stylesheet" href="css/main.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Account Page</title>

</head>
<body>
<jsp:include page="nav.jsp"/>

	
  
<c:choose>
  <c:when test="${not empty sessionScope.loggedInUser}">
    <h2>Username: <c:out value="${sessionScope.loggedInUser.username}" /></h2>

 <div class="col-md-8">
    <form action="updateUser.do" method="POST">
      <input type="hidden" name="id" value="${loggedInUser.id}" />
      <table class="table">
        <tr>
          <td><label for="firstName">Edit First Name:</label></td>
          <td><input type="text" name="firstName" value="${loggedInUser.firstName}" /></td>
        </tr>
        <tr>
          <td><label for="lastName">Edit Last Name:</label></td>
          <td><input type="text" name="lastName" value="${loggedInUser.lastName}" /></td>
        </tr>
        <tr>
          <td><label for="email">Edit Email :</label></td>
          <td><input type="text" name="email" value="${loggedInUser.email}" /></td>
        </tr>
        <tr>
          <td><label for="imageUrl">Edit Image URL:</label></td>
          <td><input type="text" name="imageUrl" value="${loggedInUser.imageUrl}" /></td>
        </tr>
        <tr>
          <td><label for="aboutMe">Edit About Me:</label></td>
          <td><input type="text" name="aboutMe" value="${loggedInUser.aboutMe}" /></td>
        </tr>
        <tr>
          <td colspan="2">
            <button type="submit" class="btn btn-primary btn-sm">Update</button>
            <a href="home.do" class="btn btn-secondary btn-sm">Cancel</a>
          </td>
        </tr>
      </table>
    </form>
  </div>
  
    
  </c:when>
  <c:otherwise>
    <h2>Not Logged In</h2>
  </c:otherwise>
</c:choose>

<br>
<br>
<br>

<jsp:include page="footer.jsp"/>

</body>
</html>