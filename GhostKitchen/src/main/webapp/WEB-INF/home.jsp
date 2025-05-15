<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Home | Ghost Kitchen</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="css/main.css">
</head>
<body class="ghost-layout body-bg1">
  <jsp:include page="nav.jsp" />

<div class="centered-form spacing">
  <main class="ghost-main spacing">
    <div class="hero-container">
  <div class="text-center">
    <h1 class="hero-title mb-4">
      FOOD WITH NO <span class="hero-highlight">BOUNDARIES</span>
    </h1>

    <a href="register.do" class="glow-btn mb-4">Order Now</a>

    <p class="hero-sub">
      Discover exclusive delivery-only kitchens built for flavor, not foot traffic.
    </p>
  </div>
</div>
  </main>

</div>


  <jsp:include page="footer.jsp" />
</body>
</html>