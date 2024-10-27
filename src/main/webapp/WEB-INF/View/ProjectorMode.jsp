<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="HeaderUser.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Prjector Wall</title>
</head>
<body style="background-color:gray">

<div class="container">
			<div id="dataTable">
				<h2 align="center">
					<font color="#ffffff">Questions Asked</font>
				</h2>

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
						"scrollCollapse" : true
					});
				});
			</script>
		</div>
		
</body>
</html>