<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<security:authorize ifAnyGranted="ROLE_USER">
	<%
		response.sendRedirect("NoAccess");
	%>
</security:authorize>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="Header.jsp"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<title>New User Registration</title>
<style>
label {
	color: #ffffff;
}

.form-horizontal .form-group {
	margin-left: 0;
	margin-right: 0;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<body style="background-color: #262626">

	<br>
	<br>
	<br>
	<div>
		<h2 align="center">
			<font style="color: #ffffff">New User Registration Form</font>
		</h2>
	</div>
	<br>
	<s:form action="newUserSubmit" class="form-horizontal"
		modelAttribute="user">

		<div class="form-group">
			<label class="control-label col-sm-5">UserName :</label>
			<div class="col-sm-3">
				<s:input path="userName" class="form-control"
					placeholder="Enter UserName" required="true" />
				<div align="left">
					<p class="text-danger">
						<s:errors path="userName" />
					</p>
				</div>
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-sm-5">Password :</label>
			<div class="col-sm-3">
				<s:password path="password" class="form-control"
					placeholder="Enter Password" required="true" />
				<div align="left">
					<p class="text-danger">
						<s:errors path="password" />
					</p>
				</div>
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-sm-5" for="sel1">Set Status
				as :</label>
			<div class="col-sm-3">
				<s:select path="enabled" class="form-control" id="sel1"
					required="true">
					<s:option value="">Select</s:option>
					<s:option value="1">Enabled</s:option>
					<s:option value="0">Disabled</s:option>
				</s:select>
				<div align="left">
					<p class="text-danger">
						<s:errors path="enabled" />
					</p>
				</div>
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-sm-5">User's First Name :</label>
			<div class="col-sm-3">
				<s:input path="firstName" class="form-control"
					placeholder="Enter First Name" required="true" />
				<div align="left">
					<p class="text-danger">
						<s:errors path="firstName" />
					</p>
				</div>
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-sm-5">User's Last Name :</label>
			<div class="col-sm-3">
				<s:input path="lastName" class="form-control"
					placeholder="Enter Last Name" required="true" />
				<div align="left">
					<p class="text-danger">
						<s:errors path="lastName" />
					</p>
				</div>
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-sm-5" for="sel1">Assign Role
				as :</label>
			<div class="col-sm-3">
				<s:select path="roles.roleID" class="form-control" id="sel1"
					required="true">
					<s:option value="">Select</s:option>
					<s:option value="1">Administrator</s:option>
					<s:option value="2">User</s:option>
					<s:option value="3">Speaker</s:option>
				</s:select>
				<div align="left">
					<p class="text-danger">
						<s:errors path="roles.roleID" />
					</p>
				</div>
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-sm-5">User's Email Address :</label>
			<div class="col-sm-3">
				<s:input path="emailID" class="form-control"
					placeholder="Enter Email Address" />
				<div align="left">
					<p class="text-danger">
						<s:errors path="emailID" />
					</p>
				</div>
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-sm-5">City :</label>
			<div class="col-sm-3">
				<s:input path="city" class="form-control" placeholder="Enter City" />
				<div align="left">
					<p class="text-danger">
						<s:errors path="city" />
					</p>
				</div>
			</div>
		</div>

		<div align="center">
			<s:button class="btn btn-md"
				style="background-color: #cc3300; color: #ffffff">Submit</s:button>
		</div>

	</s:form>
	<br>
	<br>
	<br>
	<br>

</body>
</html>