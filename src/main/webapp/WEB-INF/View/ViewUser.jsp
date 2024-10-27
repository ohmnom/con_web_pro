<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="Header.jsp"%>
<title>View By Code</title>
<security:authorize ifAnyGranted="ROLE_ADMIN">

</security:authorize>
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
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>

<security:authorize ifAnyGranted="ROLE_ADMIN">
	<body style="background-color: #262626">
		<br>
		<br>
		<br>
		<s:form action="HomePage" modelAttribute="user">
			<div class="container col-md-6 col-md-offset-3">
				<h2 align="center"><font style="color: #ffffff">Current User Details</font></h2>
				<br> <br> <br>
				<div class="table-responsive">
					<table class="table table-bordered">
						<tbody align="center">
							<tr style="background: #eef2db">
								<td class="control-label col-sm-6">User Name</td>
								<td>${user.userName}</td>
							</tr>
							<tr style="background: #eef2db">
								<td class="control-label col-sm-6">First Name</td>
								<td>${user.firstName}</td>
							</tr>
							<tr style="background: #eef2db">
								<td class="control-label col-sm-6">Last Name</td>
								<td>${user.lastName}</td>
							</tr>
							<tr style="background: #eef2db">
								<td class="control-label col-sm-6">Email ID</td>
								<td>${user.emailID}</td>
							</tr>
							<tr style="background: #eef2db">
								<td class="control-label col-sm-6">City</td>
								<td>${user.city}</td>
							</tr>
							<tr style="background: #eef2db">
								<td class="control-label col-sm-6">User Create Date</td>
								<td>${user.createDate}</td>
							</tr>
							<tr style="background: #eef2db">
								<td class="control-label col-sm-6">Role Assigned</td>
								<td>${user.roles.roleName}</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			<div align="center">

				<a href="${pageContext.request.contextPath}/dashBoard"
					style="background-color: #cc3300; color: #ffffff; width: 200px;"
					class="btn" role="button">Go To DashBoard</a>
			</div>
		</s:form>

		<script>
			// When the user scrolls down 20px from the top of the document, slide down the navbar
			window.onscroll = function() {
				scrollFunction()
			};

			function scrollFunction() {
				if (document.body.scrollTop > 5
						|| document.documentElement.scrollTop > 5) {
					document.getElementById("navbar").style.top = "0";
				} else {
					document.getElementById("navbar").style.top = "-50px";
				}
			}
		</script>
		
	</body>
</security:authorize>

<security:authorize ifAnyGranted="ROLE_USER,ROLE_SPEAKER">
	<body style="background-color: #ffffff">
		<br>
		<br>
		<br>
		<s:form action="HomePage" modelAttribute="user">
			<div class="container col-md-6 col-md-offset-3">
				<h2 align="center"><font style="color: #ffffff">Current User Details</font></h2>
				<br> <br> <br>
				<div class="table-responsive">
					<table class="table table-bordered">
						<tbody align="center">
							<tr style="background: #eef2db">
								<td class="control-label col-sm-6">User Name</td>
								<td>${user.userName}</td>
							</tr>
							<tr style="background: #eef2db">
								<td class="control-label col-sm-6">First Name</td>
								<td>${user.firstName}</td>
							</tr>
							<tr style="background: #eef2db">
								<td class="control-label col-sm-6">Last Name</td>
								<td>${user.lastName}</td>
							</tr>
							<tr style="background: #eef2db">
								<td class="control-label col-sm-6">Email ID</td>
								<td>${user.emailID}</td>
							</tr>
							<tr style="background: #eef2db">
								<td class="control-label col-sm-6">City</td>
								<td>${user.city}</td>
							</tr>
							<tr style="background: #eef2db">
								<td class="control-label col-sm-6">User Create Date</td>
								<td>${user.createDate}</td>
							</tr>
							<tr style="background: #eef2db">
								<td class="control-label col-sm-6">Role Assigned</td>
								<td>${user.roles.roleName}</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			
			<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			<div align="center">

				<a href="${pageContext.request.contextPath}/dashBoard"
					style="background-color: #cc3300; color: #ffffff; width: 200px;"
					class="btn" role="button">Go To DashBoard</a>
			</div>
			
			
		</s:form>

		<script>
			// When the user scrolls down 20px from the top of the document, slide down the navbar
			window.onscroll = function() {
				scrollFunction()
			};

			function scrollFunction() {
				if (document.body.scrollTop > 5
						|| document.documentElement.scrollTop > 5) {
					document.getElementById("navbar").style.top = "0";
				} else {
					document.getElementById("navbar").style.top = "-50px";
				}
			}
		</script>
		
	</body>
</security:authorize>


</html>