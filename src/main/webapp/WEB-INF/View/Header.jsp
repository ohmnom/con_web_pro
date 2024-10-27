<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>
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
<link href="<c:url value="/resources/css/ConfirmEvent.css" />"
	rel="stylesheet">
<style type="text/css">
footer {
	position: fixed;
	left: 0;
	bottom: 0;
	width: 100%;
}
</style>
</head>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<body>
	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<security:authorize ifAnyGranted="ROLE_ADMIN">
				<a class="navbar-brand"
					href="${pageContext.request.contextPath}/HomePage"
					data-toggle="tooltip" title="Redirets To Admin's HomePage"><i
					class="fa fa-fw fa-home" style="color: #cc3300"></i> <spring:message
						code="header.home" text="default text" /></a>
			</security:authorize>

			<security:authorize ifAnyGranted="ROLE_USER,ROLE_SPEAKER">
				<a class="navbar-brand"
					href="${pageContext.request.contextPath}/dashBoard"
					data-toggle="tooltip" title="Redirets To DashBoard"><i
					class="fa fa-fw fa-home" style="color: #cc3300"></i> <spring:message
						code="header.dashboard" text="default text" /></a>
			</security:authorize>

		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">

				<security:authorize ifAnyGranted="ROLE_ADMIN">

					<li><a href="${pageContext.request.contextPath}/NewUser"
						data-toggle="tooltip"
						title="Creates A New User And Assign Different Roles"><i
							class="fa fa-user-plus"></i> <spring:message
								code="header.newUser" text="New User Registration" /></a></li>

					<li><a href="${pageContext.request.contextPath}/restrictUser"
						data-toggle="tooltip"
						title="Restricts Or Gives Access To A Exsisting User"><i
							class="fa fa-user-times"></i> <spring:message
								code="header.editUser" text="Update User Access" /></a></li>

				</security:authorize>

				<security:authorize ifAnyGranted="ROLE_SPEAKER">

					<li><a href="${pageContext.request.contextPath}/NewEvent"
						data-toggle="tooltip"
						title="Creates A New Link Id And Starts Conference"><i
							class="fa fa-group"></i> Start Event</a></li>

					<li><a href="${pageContext.request.contextPath}/ScheduleEvent"
						data-toggle="tooltip"
						title="Schedules An Event In Future Time"><i
							class="fa fa-calendar-plus-o"></i> Schedule Event</a></li>
				</security:authorize>


				<security:authorize ifAnyGranted="ROLE_USER">

					<li><a href="${pageContext.request.contextPath}/joinEvent"
						data-toggle="tooltip"
						title="Join A Event Based On Event Id And Start Asking Questions"><i
							class="fa fa-rss"></i> Join Event</a></li>
				</security:authorize>

			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li><a href="${pageContext.request.contextPath}/profile"
					data-toggle="tooltip" title="Shows Current User Details"><i
						class="fa fa-user-circle"></i> <security:authentication
							property="name" /> </a></li>
				<li><a
					href="${pageContext.request.contextPath}/j_spring_security_logout"
					data-toggle="tooltip" title="Ends Session By Logging Out"><i
						class="fa fa-sign-out"></i> <spring:message code="header.logout"
							text="Logout" /></a></li>
			</ul>
		</div>
	</div>
	</nav>
	<footer>
	<div class="container">
		<div class="col-md-10 col-md-offset-1 text-center">
			<h6>
				Made with <i class="fa fa-heart" style="color: red"></i> by <a
					href="https://www.nucleussoftware.com/" target="_blank">Nucleus
					Software</a>
			</h6>
		</div>
	</div>
	</footer>
</body>
</html>