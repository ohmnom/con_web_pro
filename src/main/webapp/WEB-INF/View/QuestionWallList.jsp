<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
												</i> <br> <span style="font-size: 9px; margin-left: 5px;"><c:out
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
													<div class="box entypo-thumbs-up" id="${question.quesId}"
														data-toggle="tooltip"
														title="Double Click To Upvote This Question">Up Vote
													</div>
												</div>
											</div>
										</div>
									</div>
									<br>
									</article>
								</div>
							</c:forEach>

<script type="text/javascript">
	$(function() {
		$('.box')
				.on(
						'click',
						function() {
							if ($(this).text() == 'Up Vote') {
								$(this).removeClass('entypo-thumbs-up')
										.addClass('entypo-thumbs-down')
										.text('Up Voted');
								var questionId = $(this).attr("id");
								//alert(questionId);
								//window.location.href = "${eventId}/QuestionLike"; 
								$.ajax({
											url : '${pageContext.request.contextPath}/${eventId}/QuestionLike?data='
													+ questionId,
											type : 'GET',
											contentType : 'application/json',
											success : function(data) {
												//$("#quesDiv").load(" #quesDiv > *");
												$.get('${pageContext.request.contextPath}/event/${eventId}/eventQuestionList', function(data, status){
													$("#quesDiv").html(data);
												});
												
											}
										});
								//$("#quesDiv").load(" #quesDiv > *");
							} else {
								$(this).removeClass(
										'entypo-thumbs-down').addClass(
										'entypo-thumbs-up')
										.text('Up Vote');
							}
						});
		
	});
</script>