<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
</head>
<body class="body-bg1">
	<jsp:include page="nav.jsp" />

<div class="d-flex justify-content-center align-items-center" style="min-height: 100vh;">
    <div class="neon-card p-5 w-100" style="max-width: 800px;">
	<h2 class="text-center">☣️ Polymorphic Plague ☣️ </h2>


	<h3>- Mid-term Team Project for Skill Distillery - <h3>
	<ul style="font-size: 1rem;">
		<li> Miles Porter (Developer, Repo Owner)d
 		<li> Michel Okello Mukua (Developer, SQL Database admin)
 		<li> Michael F (Developer, Scrum Master)
 		<li> Zachary Zink (Developer)
	</ul>
		Ghost Kitchen, developed by Polymorphic Plague, 
		is a web application showcasing a specific set 
		of ghost kitchen restaurants. Users can browse, 
		rate, review, and save their favorite spots, 
		creating a personalized food discovery experience 
		tailored to the digital dining age.
	</p>
		<img src="${pageContext.request.contextPath}/images/ghostlogo.png" alt="Footer Logo" style="height: 60px;" class="mb-2 text-center" />
</body>
</html>