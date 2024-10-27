<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<security:authorize ifAnyGranted="ROLE_ADMIN">
	<%
		response.sendRedirect("HomePage");
	%>
</security:authorize>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="Header.jsp"%>
<title>DashBoard</title>
<style>
body {
	background-image: url('<c:url value="/resources/css/appBG.jpg" />');
	background-attachment: fixed;
	background-size: cover;
	background-repeat: no-repeat;
}

.card-counter {
	box-shadow: 2px 2px 10px #c4c4c2;
	margin: 5px;
	padding: 0px 10px;
	background-color: #ffffff;
	height: 270px;
	border-radius: 5px;
	transition: .3s linear all;
}

.card-counter:hover {
	box-shadow: 5px 5px 23px #b9b9b9;
	transition: .2s linear all;
}

.card-counter.primary {
	background-color: #ffffff;
}

.card-counter .head-color {
    background-color : #cc3300;
	height: 5px;
}

.card-counter .count-head {
	text-align: center;
	font-style: normal;
	color: #4a4a4a;
	text-transform: capitalize;
	display: block;
	font-size: 24px;
}

.card-counter .count-name {
	text-align: center;
	font-style: normal;
	color: black;
	opacity: 0.5;
	display: block;
	font-size: 16px;
	text-transform: capitalize;
}
.card-counter .count-join {
    text-align: center;
	font-style: normal;
	display: block;
	font-size: 16px;
	text-transform: capitalize;
}
</style>
</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<div class="container" align="right">
		<h2 style="color: white;">
			Hello
			<security:authentication property="name" />
		</h2>

		<security:authorize ifAnyGranted="ROLE_USER">
			<p style="color: white;">Click On Join Event To Join Conference
				Portal</p>
		</security:authorize>
		<security:authorize ifAnyGranted="ROLE_SPEAKER">
			<p style="color: white;">Click On Start Event To Start Your
				Conference</p>
		</security:authorize>
	</div>

	<security:authorize ifAnyGranted="ROLE_SPEAKER">
		<c:forEach items="${scheduledEvents}" var="event">
			<div class="col-md-3" id="eventId">

				<div class="card-counter primary">
					<div id="head" class="card-counter head-color"></div>
					<span class="count-head">${event.eventName}</span> 
					<br> 
					<span class="count-name">Date : ${event.date}</span>
					<span class="count-name">Location : ${event.location}</span>
					<span class="count-name">Hosted By : ${event.hostName}</span>
					<span class="count-name">Description : ${event.description}</span>
					<br>
					<br>
					<div class="count-join">
					<button class=" btn" id="${event.linkId}" style="background-color: #cc3300;"><font style="color: white;">Start Event</font></button>
					</div>
						
				</div>
			</div>
		</c:forEach>
		<script type="text/javascript">
		$(function() {
			$('.count-join')
			.on(
					'click',
					function()
					{
						var eventData = $(
								this).attr("id")
						.ajax({
							url : 'startEvent?data=' +eventData,
							type : 'GET',
							contentType : 'application/json',
							success : function(data){
								$
								.get(
										'${pageContext.request.contextPath}/startEvent',
										function(data,status) {
											$("#eventId").html(data);
										}
										);
							}
						});
					});
		});
		</script>
	</security:authorize>

</body>
</html>