<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Questions</title>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<link href="https://nightly.datatables.net/css/jquery.dataTables.css"

    rel="stylesheet" type="text/css" />

<script src="https://nightly.datatables.net/js/jquery.dataTables.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="HeaderUser.jsp"%>
</head>
<body>
<div id="dataTable">
				<br> <br> <br>
				<div align="center" >
					<a href="${eventId}/target/switchView"
						style="background-color: #cc3300; color: #ffffff" class="btn"
						role="button" target="_blank">Switch To Projector Mode</a> <a
						href="${eventId}/target/end"
						style="background-color: #cc3300; color: #ffffff" class="btn"
						role="button">End Session</a>
				</div>
				<h2 align="center">
					<font color="#ffffff">Questions Asked</font>
				</h2>
				<br>
				<table id="example" class="table-bordered" width="100%"
					style="table-layout: auto; border-color: red; border-width: 2px; background-color: white;">

					<thead>
						<tr style="height: 40px">
							<th align="center"><b>Votes</b></th>
							<th align="center"><b>Question Id</b></th>
							<th align="center"><b>Question</b></th>
							<th align="center"><b>Asked By</b></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="question" items="${questions}">
							<tr>
								<td align="center"><font color="#000000"><c:out
											value=" ${ question.vote} " /></font></td>
								<td align="center"><font color="#000000"><c:out
											value=" ${ question.quesId} " /></font></td>
								<td align="center"><font color="#000000"><c:out
											value=" ${ question.ques} " /></font></td>
								<td align="center"><font color="#000000"><c:out
											value=" ${ question.userName} " /></font></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<script>
				$(document).ready(function() {
					$('#example').DataTable({
						"scrollX" : "200px",
						"scrollCollapse" : true,
						"ordering" : false
						
					});
				});
			</script>
			
</body>
</html>