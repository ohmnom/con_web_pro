s<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="Header.jsp"%>
<title>Message</title>
<security:authorize ifAnyGranted="ROLE_USER,ROLE_SPEAKER">
	<style>
body {
	background-image: url('<c:url value="/resources/css/appBG_without.jpg" />');
	background-attachment: fixed;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</security:authorize>
<security:authorize ifAnyGranted="ROLE_USER">
	<style>
footer {
	position: fixed;
	left: 0;
	bottom: 0;
	width: 100%;
}
</style>
</security:authorize>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>

<security:authorize ifAnyGranted="ROLE_ADMIN">
	<body style="background-color: #262626">
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<h2 align="center">
			<font style="color: #ffffff">${message}</font>
		</h2>
		<s:form action="HomePage" modelAttribute="user">
			<!-- modelAttribute="customers" -->
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<div align="center">
				<s:button class="btn btn-primary btn-xs">Go To Home</s:button>
			</div>
		</s:form>
		<footer>
		<div class="container">
			<div class="col-md-10 col-md-offset-1 text-center">
				<h6>
					App by <a href="https://www.nucleussoftware.com/" target="_blank">Nucleus
						Software</a>
				</h6>
			</div>
		</div>
		</footer>
	</body>
</security:authorize>

<security:authorize ifAnyGranted="ROLE_USER,ROLE_SPEAKER">
	<body>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<h2 align="center">
			<font style="color: #ffffff">${message}</font>
		</h2>
		<s:form action="loginSuccess" modelAttribute="user">
			<!-- modelAttribute="customers" -->
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<div align="center">
				<a href="dashBoard"
					style="background-color: #cc3300; color: #ffffff; width: 200px;"
					class="btn" role="button">Go To Dashboard</a>
			</div>
		</s:form>
	</body>
</security:authorize>

</html>