<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Register | Ghost Kitchen</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="css/main.css">
</head>

<body class="body-bg2">
  <jsp:include page="nav.jsp" />

  <div class="d-flex justify-content-center align-items-center" style="min-height: 100vh;">
    <div class="neon-card p-5 w-100" style="max-width: 500px;">
      <h2 class="text-center text-neon mb-4">Create Account</h2>

      <form action="register.do" method="POST">
        <div class="mb-3">
          <label class="form-label text-neon">First Name</label>
          <input type="text" class="form-control" name="firstName" required>
        </div>

        <div class="mb-3">
          <label class="form-label text-neon">Last Name</label>
          <input type="text" class="form-control" name="lastName" required>
        </div>

        <div class="mb-3">
          <label class="form-label text-neon">Email</label>
          <input type="email" class="form-control" name="email" required>
        </div>

        <div class="mb-3">
          <label class="form-label text-neon">Username</label>
          <input type="text" class="form-control" name="username" required>
        </div>

        <div class="mb-4">
          <label class="form-label text-neon">Password</label>
          <input type="password" class="form-control" name="password" required>
        </div>

        <button type="submit" class="glow-btn w-100">Register</button>
      </form>
    </div>
  </div>

  <jsp:include page="footer.jsp" />
</body>
</html>