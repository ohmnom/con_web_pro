<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_SPEAKER">
	<%
		response.sendRedirect("NoAccessAdmin");
	%>
</security:authorize>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="Header.jsp"%>
<title>Create Event</title>
<style>
body {
	background-image: url('<c:url value="/resources/css/appBG_without.jpg" />');
	background-attachment: fixed;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<body style="background-color: #ffffff">
	<form action="joinEventSubmit" class="form-horizontal" method="post">
		<input type="hidden" name="userName"
			value="<security:authentication property="name" />" /> <br> <br>
		<br> <br>
		<h2 align="center">
			<font color="#ffffff">Join An Event</font>
		</h2>
		<br> <br> <br> <br> <br>
		<div class="col-xs-11 col-xs-offset-1 col-centered">
			<div class="form-group">
				<div class="col-xs-12">
					<label class="control-label col-sm-5 col-xs-5"><font
						color="#ffffff" size="3">Enter Event Id :</font></label>
					<div class="col-sm-3 col-xs-3">
						<input type="text" name="eventId" class="form-control"
							placeholder="Enter event id given By Speaker..." required="true" />
					</div>
				</div>
			</div>

			<div class="control-label col-sm-11 col-xs-11">
				<br> <br>
				<div align="center">
					<button class="btn btn-md"
						style="background-color: #cc3300; color: #ffffff; width: 200px;">Join
						Event</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>