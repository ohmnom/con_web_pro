<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<security:authorize ifAnyGranted="ROLE_USER">
	<%
		response.sendRedirect("NoAccess");
	%>
</security:authorize>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="Header.jsp"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<title>Update User</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
.form-horizontal .form-group {
	margin-left: 0;
	margin-right: 0;
}
</style>
</head>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<body style="background-color: #262626">
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<h2 align="center">
		<font style="color: #ffffff">Enable Or Disable User</font>
	</h2>
	<form action="updateUserSubmit" class="form-horizontal">
		<br> <br> <br> <br> <br>
		<div class="form-group">
			<label class="control-label col-sm-5"><font
				style="color: #ffffff">Enter Username :</font></label>
			<div class="col-sm-3">
				<input name="userName" class="form-control"
					placeholder="Enter Username" required="true" />
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-sm-5" for="sel1"><font
				style="color: #ffffff">Set Access Status as :</font></label>
			<div class="col-sm-3">
				<select name="choice" class="form-control" id="sel1" required="true">
					<option value="">Select</option>
					<option value="1">Enabled</option>
					<option value="0">Disabled</option>
				</select>
			</div>
		</div>

		<div align="center">
			<button class="btn btn-md"
				style="background-color: #cc3300; color: #ffffff">Update
				Status</button>
		</div>
	</form>
</body>
</html>