<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="Header.jsp"%>

<title>Confirm Event</title>
<style>
body {
	background-image: url('<c:url value="/resources/css/appBG_without.jpg" />');
	background-attachment: fixed;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<form action="event/${eventId}" method="post">
		<br> <br> <br> <br>
		
		<h2 align="center" style="color: white;">Event Details</h2>
		
		 <br> <br>
		<div class="container col-md-6 col-md-offset-3">
			<div class="table-responsive">
				<table class="table table-bordered" style="background-color: #eef2db">
					<tbody align="center">
						<tr>
							<td class="control-label col-sm-6"><font size="4">Event ID</font></td>
							<td><font size="4">${eventId}</font></td>
						</tr>
						<tr>
							<td class="control-label col-sm-6"><font size="4">Event Date</font></td>
							<td><font size="4"> 
          ${date} </font></td>
						</tr>
						<tr>
							<td class="control-label col-sm-6"><font size="4">Event Name</font></td>
							<td><font size="4">${eventName}</font></td>
						</tr>
						<tr>
							<td class="control-label col-sm-6"><font size="4">Event Details</font></td>
							<td><font size="4">${description}</font></td>
						</tr>
						<tr>
							<td class="control-label col-sm-6"><font size="4">Event Speaker</font></td>
							<td><font size="4">${speakerName}</font></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<br> <br> <br> <br> <br>
		<div class="col-md-6 col-md-offset-3">
		<div align="center">
			<button type="submit" class="btn btn-md"
				style="background-color: #cc3300; color: #ffffff; width: 200px;">Proceed
				to Question Wall</button>
		</div>
		</div>
	</form>
</body>
</html>