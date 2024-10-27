<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<security:authorize ifAnyGranted="ROLE_ADMIN">
	<%@include file="Header.jsp"%>
</security:authorize>
<security:authorize ifAnyGranted="ROLE_USER">
	<%
		response.sendRedirect("NoAccess");
	%>
</security:authorize>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Sorry</title>
</head>
<body style="background-color: #e6e6e6">
	<div class="container">
		<br> <br> <br> <br> <br> <br> <br>
		<br>
		<h4 align="center">
			Sorry
			<security:authentication property="name" />
			, ${message}
		</h4>
		<br> <br> <br> <br> <br>
		<div align="center">
			<a href="HomePage" class="btn btn-link" role="button">Go To Home</a>
		</div>
	</div>

</body>
</html>