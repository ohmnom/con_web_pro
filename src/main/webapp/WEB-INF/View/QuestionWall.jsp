<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="Header.jsp"%>
<title>The Wall</title>
<security:authorize ifAnyGranted="ROLE_USER">
	<style>
[class*="entypo-"]:before {
	font-family: 'entypo', sans-serif;
}

body {
	background-image: url('<c:url value="/resources/css/appBG_without.jpg" />');
	background-attachment: fixed;
	background-size: cover;
	background-repeat: no-repeat;
}

.shadow {
	background-color: white;
	width: auto;
	height: auto;
	border-radius: 5px 5px 5px 5px;
}

.shadow:hover {
	background-color: #e6e6e6;
}

.fa {
	font-size: 16px;
	cursor: pointer;
	user-select: none;
}

#holder {
	width: 20px;
	margin-left: 5px;
	margin-bottom: 10px;
}

div.box {
	text-align: center;
	width: 50px;
	background-color: #eee;
	border-radius: 3px;
	box-shadow: 0 0 10px #000;
	padding: 3px;
}

div.box {
	font-family: arial;
	font-size: 12px;
	text-decoration: none;
	color: #000;
}

div.box:hover {
	cursor: pointer;
	background-color: #fdd;
}
</style>
</security:authorize>
<security:authorize ifAnyGranted="ROLE_SPEAKER">

	<style>
.footer {
	position: relative;
	left: 0;
	bottom: 0;
	width: 100%;
	background-color: #e6e6e6;
	color: white;
	text-align: center;
}

body {
	background-image: url('<c:url value="/resources/css/appBG_without.jpg" />');
	background-attachment: fixed;
	background-size: cover;
	background-repeat: no-repeat;
}

.shadow {
	background-color: white;
	width: auto;
	height: auto;
	border-radius: 5px 5px 5px 5px;
}

.shadow:hover {
	background-color: #e6e6e6;
}
</style>
</security:authorize>

<security:authorize ifAnyGranted="ROLE_USER,ROLE_SPEAKER">
	<style type="text/css">
/* Card CSS */
.card {
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
}

.card {
	margin-top: 10px;
	box-sizing: border-box;
	border-radius: 2px;
	background-clip: padding-box;
}

.card span.card-title {
	color: #fff;
	font-size: 24px;
	font-weight: 300;
	text-transform: uppercase;
}

.card .card-image {
	position: relative;
	overflow: hidden;
}

.card .card-image img {
	border-radius: 2px 2px 0 0;
	background-clip: padding-box;
	position: relative;
	z-index: -1;
}

.card .card-image span.card-title {
	position: absolute;
	bottom: 0;
	left: 0;
	padding: 16px;
}

.card .card-content {
	padding: 16px;
	border-radius: 0 0 2px 2px;
	background-clip: padding-box;
	background-color: white;
	box-sizing: border-box;
}

.card .card-content p {
	margin: 0;
	color: inherit;
}

.card .card-content span.card-title {
	line-height: 48px;
}

.card .card-action {
	background-color: white;
	border-top: 1px solid rgba(160, 160, 160, 0.2);
	padding: 16px;
}

.card .card-action a {
	color: #ffab40;
	margin-right: 16px;
	transition: color 0.3s ease;
	text-transform: uppercase;
}

.card .card-action a:hover {
	color: #ffd8a6;
	text-decoration: none;
}
</style>
</security:authorize>

</head>
<body>
	<security:authorize ifAnyGranted="ROLE_USER">
		<div class="row">
			<div style="position: fixed; margin-left: 110px; margin-top: 60px;">
				<br> <br> <br> <br> <br> <br> <br>
				<div align="center">
					<!-- Trigger the modal with a button -->
					<button type="button" class="btn"
						style="background-color: #cc3300; color: #ffffff; width: 200px;"
						data-toggle="modal" data-target="#myModal">Ask Question</button>
					<br>
					<br>
					<button id="refresh"
						style="background-color: #cc3300; color: #ffffff; width: 200px;"
						class="btn">Refresh Questions</button>
				</div>
			</div>

			<div id="refreshDiv">
				<c:choose>
					<c:when test="${empty questions}">
						<br>
						<br>
						<br>
						<br>
						<br>

						<div class="col-sm-offset-2 col-md-6-offset-1 col-lg-8-offset-1">
							<div class="container">
								<div class="row">
									<div
										class="col-xs-3 col-xs-offset-4 col-sm-6 col-sm-offset-3 col-md-6 col-md-offset-3">
										<div class="card">
											<div class="card-image">
												<img class="img-responsive"	src='<c:url value="/resources/css/userAsk.png" />'>
											</div>

											<div class="card-content">
												<p align="center">Doubts of any kind are not good, let
													us resovle them together.</p>
											</div>

											<div class="card-action">
												<p align="center">Click on "Ask Questions" button to
													raise your query.</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</c:when>

					<c:when test="${fn:length(questions) gt 0 }">

						<div class="col-sm-10 col-md-6 col-lg-8"
							style="position: absolute; margin-left: 300px; margin-top: 0px">
							<br> <br> <br> <br>
							<h3 align="center">
								<font color="#ffffff">Asked Questions</font>
							</h3>
							<br> <br> <br>
							<div class="col-sm-offset-1 col-md-6-offset-1 col-lg-8-offset-1"
								id="quesDiv">
								<table>
									<thead>
										<c:forEach items="${questions}" var="question">
											<div class="row">
												<article class="col-xs-12">
												<div class="shadow">
													<div class="media">
														<div class="media-left"></div>
														<div class="media-body">
															<i class="fa fa-quora" id="questionData"
																style="font-size: 22px; margin-top: 5px; margin-left: 5px;">
																<span style="font-size: 18px;"> <c:out
																		value="${ question.ques}" /></span>
															</i> <br> <span
																style="font-size: 9px; margin-left: 5px;"><c:out
																	value="Question ID : ${ question.quesId}" /></span><br>
															<p style="font-size: 11px; margin-left: 5px;">
																Votes Collected :
																<c:out value="${ question.vote}" />
															</p>
															<p style="font-size: 11px; margin-left: 5px;">
																Status :
																<c:out value="${ question.status}" />
															</p>
															<div id="holder">
																<div class="box entypo-thumbs-up"
																	id="${question.quesId}" data-toggle="tooltip"
																	title="Double Click To Upvote This Question">Up
																	Vote</div>
															</div>
														</div>
													</div>
												</div>
												<br>
												</article>
											</div>
										</c:forEach>
									</thead>
								</table>
								<script type="text/javascript">
									$(function() {
										$('.box')
												.on(
														'click',
														function() {
															if ($(this).text() == 'Up Vote') {
																$(this)
																		.removeClass(
																				'entypo-thumbs-up')
																		.addClass(
																				'entypo-thumbs-down')
																		.text(
																				'Up Voted');
																var questionId = $(
																		this)
																		.attr(
																				"id");

																$
																		.ajax({
																			url : '${pageContext.request.contextPath}/${eventId}/QuestionLike?data='
																					+ questionId,
																			type : 'GET',
																			contentType : 'application/json',
																			success : function(
																					data) {

																				$
																						.get(
																								'${pageContext.request.contextPath}/event/${eventId}/eventQuestionList',
																								function(
																										data,
																										status) {
																									$(
																											"#quesDiv")
																											.html(
																													data);
																								});
																			}
																		});
															} else {
																$(this)
																		.removeClass(
																				'entypo-thumbs-down')
																		.addClass(
																				'entypo-thumbs-up')
																		.text(
																				'Up Vote');
															}
														});
									});
								</script>
							</div>
						</div>

					</c:when>

				</c:choose>
			</div>
			<script type="text/javascript">
				$("#refresh").click(function() {
					$("#refreshDiv").load(" #refreshDiv > *");
				});
			</script>
		</div>
	</security:authorize>

	<security:authorize ifAnyGranted="ROLE_SPEAKER">
		<section id="questionsView" class="formSection"> </section>
		<div class="container">
			<div class="row">
				<br> <br> <br>

				<div style="position: fixed; margin-left: 40px; margin-top: 60px">
					<br> <br> <br> <br> <br>
					<div align="center">
						<button id="refresh"
							style="background-color: #cc3300; color: #ffffff; width: 200px;"
							class="btn">Refresh Questions</button>
						<br> <br> <a href="${eventId}/target/switchView"
							style="background-color: #cc3300; color: #ffffff; width: 200px;"
							class="btn" role="button" target="_blank">Switch To Projector
							Mode</a> <br> <br> <a
							href="${eventId}/target/answerQuestion"
							style="background-color: #cc3300; color: #ffffff; width: 200px;"
							class="btn" role="button">Answer Questions</a> <br> <br>
						<a href="${eventId}/target/end"
							style="background-color: #cc3300; color: #ffffff; width: 200px;"
							class="btn" role="button">End Session</a>
					</div>
				</div>

				<div id="refreshDiv">
					<c:choose>
						<c:when test="${empty questions}">

							<br>
							<br>
							<br>
							<div class="col-sm-offset-2 col-md-6-offset-1 col-lg-8-offset-1">
								<div class="container">
									<div class="row">
										<div
											class="col-xs-3 col-xs-offset-4 col-sm-6 col-sm-offset-3 col-md-6 col-md-offset-3">
											<div class="card">
												<div class="card-image">
													<img class="img-responsive"
														src='<c:url value="/resources/css/speakerAsk.png" />'>
												</div>

												<div class="card-content">
													<p align="center">
														<strong>No Questions Yet.</strong>
													</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

						</c:when>


						<c:when test="${fn:length(questions) gt 0 }">

							<div class="col-sm-10 col-md-6 col-lg-8"
								style="position: absolute; margin-left: 300px; margin-top: 0px">
								<h3 align="center">
									<font color="#ffffff">Asked Questions</font>
								</h3>
								<br> <br> <br>
								<div class="control-label col-sm-12 col-md-12 col-lg-12">
									<div
										class="col-sm-6-offset-1 col-md-6-offset-1 col-lg-6-offset-1"
										id="quesDiv">
										<table>
											<thead>
												<c:forEach items="${questions}" var="question">
													<div class="row" style="position: relative;">
														<article class="col-sm-12 col-md-12 col-lg-12">
														<div class="shadow">
															<div class="media">
																<div class="media-left"></div>
																<div class="media-body">
																	<i class="fa fa-quora" id="questionData"
																		style="font-size: 22px; margin-top: 5px; margin-left: 5px;">
																		<span style="font-size: 18px;"> <c:out
																				value="${ question.ques}" /></span>
																	</i> <br> <br> <span
																		style="font-size: 9px; margin-left: 5px;"><c:out
																			value="Question ID : ${ question.quesId}" /></span><br>
																	<br>
																	<p style="font-size: 11px; margin-left: 5px;">
																		Votes Collected :
																		<c:out value="${ question.vote}" />
																	</p>
																	<p style="font-size: 11px; margin-left: 5px;">
																		Status :
																		<c:out value="${ question.status}" />
																	</p>
																</div>
															</div>
														</div>
														<br>
														</article>
													</div>
												</c:forEach>
											</thead>
										</table>
									</div>
								</div>
							</div>
						</c:when>

					</c:choose>
				</div>

				<script type="text/javascript">
					$("#refresh").click(function() {
						$("#refreshDiv").load(" #refreshDiv > *");
					});
				</script>

			</div>
		</div>
	</security:authorize>
	<security:authorize ifAnyGranted="ROLE_USER">

		<!-- Modal -->

		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-dialog-centered">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title" align="center">Add Question</h4>
					</div>
					<div class="modal-body">
						<form
							action="${pageContext.request.contextPath}/event/${eventId}/submitQuestion"
							method="post">
							<input type="hidden" name="eventId" value="${eventId}">
							<div class="form-group">
								<label for="comment">Question:</label>
								<textarea class="form-control" rows="5" id="comment"
									name="comment" placeholder="Type your question here..."></textarea>
							</div>
							<div align="center">
								<button type="submit" class="btn btn-md"
									style="background-color: #cc3300; color: #ffffff">Submit</button>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>

	</security:authorize>

</body>
</html>