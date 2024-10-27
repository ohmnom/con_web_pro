<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_USER">
	<%
		response.sendRedirect("NoAccessAdmin");
	%>
</security:authorize>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="Header.jsp"%>
<title>Schedule An Event</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	background-image: url('<c:url value="/resources/css/appBG_without.jpg" />');
	background-attachment: fixed;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<body style="background-color: #ffffff">
	<form action="scheduledEventSubmit" class="form-horizontal" method="post">
		<input type="hidden" name="userName"
			value="<security:authentication property="name" />" /> <br> <br>
		<br>
		<h2 align="center">
			<font style="color: #ffffff">Schedule An Event</font>
		</h2>
		<br> <br> <br>
		<div class="col-xs-11 col-xs-offset-1 col-centered">

			<div class="form-group">
				<div class="col-xs-12">
					<label class="control-label col-sm-4 col-xs-4"> <font
						size="3" style="color: #ffffff;">Enter Event Name :</font></label>
					<div class="col-sm-4 col-xs-4">
						<input type="text" name="eventName" class="form-control"
							placeholder="Name of the Conference" required="true" />
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-xs-12">
					<label class="control-label col-sm-4 col-xs-4"> <font
						size="3" style="color: #ffffff;">Enter Event Date :</font></label>
					<div class="col-sm-4 col-xs-4">
						<input type="date" name="date" class="form-control" />
					</div>
				</div>
			</div>
			
			

			<div class="form-group">
				<div class="col-xs-12">
					<label class="control-label col-sm-4 col-xs-4"> <font
						size="3" style="color: #ffffff;">Enter Event Location :</font></label>
					<div class="col-sm-4 col-xs-4">
						<input type="text" name="location" class="form-control"
							placeholder="Location of the Conference" required="true" />
					</div>
				</div>
			</div>

			<div class="form-group">
				<div class="col-xs-12">
					<label class="control-label col-sm-4 col-xs-4"><font
						size="3" style="color: #ffffff;">Enter Event Description :</font></label>
					<div class="col-sm-4 col-xs-4">
						<textarea name="eventDesc" class="form-control" rows="2"
							placeholder="What This Conference Is All About" /></textarea>
					</div>
				</div>
			</div>

			<div class="control-label col-sm-11 col-xs-11">
				<br> <br>
				<div align="center">
					<button type="submit" class="btn btn-md"
						style="background-color: #cc3300; color: #ffffff; width: 200px;">Next</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>