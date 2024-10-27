<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="Header.jsp"%>
<title>Confirm Event</title>
<style>
body {
	background-image: url('<c:url value="/resources/css/appBG.jpg" />');
	background-attachment: fixed;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<form action="event/${event.linkId}" method="post">
		<br> <br> <br> <br> <br> <br> <br> <br> <br>
		<div class="container col-md-6 col-md-offset-3">
			<div class="table-responsive">
				<table class="table table-bordered" style="background-color: #eef2db">
					<tbody align="center">
						<tr>
							<td class="control-label col-sm-6"><font size="4">Event Link ID</font></td>
							<td><font size="4">${event.linkId}</font></td>
						</tr>
						<tr>
							<td class="control-label col-sm-6"><font size="4">Event Name</font></td>
							<td><font size="4">${event.eventName}</font></td>
						</tr>
						<tr>
							<td class="control-label col-sm-6"><font size="4">Event Details</font></td>
							<td><font size="4">${event.description}</font></td>
						</tr>
						<tr>
							<td class="control-label col-sm-6"><font size="4">Event Date</font></td>
							<td><font size="4">${event.date}</font></td>
						</tr>
						<tr>
							<td class="control-label col-sm-6"><font size="4">Event Hosted By</font></td>
							<td><font size="4">${event.hostName}</font></td>
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