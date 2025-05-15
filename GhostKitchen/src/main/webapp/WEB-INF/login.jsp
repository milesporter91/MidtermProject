<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Log In | Ghost Kitchen</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="css/main.css">
</head>

<body class="body-bg1">

  <jsp:include page="nav.jsp" />

  <div class="d-flex justify-content-center align-items-center" style="min-height: 100vh;">
    <div class="neon-card text-center p-5">
      <h2 class="text-neon mb-4">Log In</h2>
      <form action="login.do" method="POST">
        <div class="mb-3">
          <input type="text" name="username" class="form-control" placeholder="Username" required>
        </div>
        <div class="mb-3">
          <input type="password" name="password" class="form-control" placeholder="Password" required>
        </div>
        <button type="submit" class="glow-btn w-100">Log In</button>
      </form>
    </div>
  </div>

  <jsp:include page="footer.jsp" />

</body>
</html>