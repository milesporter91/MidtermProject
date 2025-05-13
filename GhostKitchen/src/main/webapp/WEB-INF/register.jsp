<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register Account</title>
</head>
<body>
<%--Edit the file nav.jsp to change nav links --%>
<jsp:include page="nav.jsp"/>

<h2>Register Account</h2>
<form action="register.do" method="POST">
	<%-- Error messages --%>
	First Name<input type="text" name="first_name"><br>
	Last Name<input type="text" name="last_name"/><br>
	Email<input type="text" name="email"/><br>
	Username<input type="text" name="username"/><br>
	Password<input type="text" name="password"/><br>
	
	<input type="submit" value="Register" > 
</form>
</body>
</html>