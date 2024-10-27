<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<security:authorize ifAnyGranted="ROLE_ADMIN">
	<%@include file="Header.jsp"%>
</security:authorize>
<security:authorize ifAnyGranted="ROLE_USER">
	<%
		response.sendRedirect("HomePage2");
	%>
</security:authorize>
<title>Homepage</title>
<style>
body {
	background-image: url('<c:url value="/resources/css/icon.png" />');
	background-attachment: fixed;
	background-size: inherit;
	background-repeat: no-repeat;
	background-position: center;
}
</style>
</head>
<body style="background-color: #262626">

	<security:authorize ifAnyGranted="ROLE_ADMIN">
		<div class="container" align="right">
			<br> <br> <br>
			<h2 style="color: #ffffff">
				Hello
				<security:authentication property="name" />
			</h2>
			<p style="color: #ffffff">Use above stated menu to do operations.</p>
		</div>
	</security:authorize>
</body>
</html>