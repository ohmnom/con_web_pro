<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css">
body {
	background: #f2f2f2;
	font-family: 'Josefin Sans', sans-serif;
}

h3 {
	font-family: 'Josefin Sans', sans-serif;
}

.box {
	margin: 0; position : absolute; top : 50%; left : 50%; margin-right :
	-50%; transform : translate( -50%, -50%);
	width: 60%;
	padding: 10px 0px;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-right: -50%;
	transform: translate(-50%, -50%);
}
.submit{
    position:absolute;
    top: 85%;
    left: 45.5%;
}


.box-part {
	background: #FFF;
	border-radius: 10px;
	padding: 60px 10px;
	margin: 30px 0px;
}

.box-part:hover {
	background: #4183D7;
}

.box-part:hover .fa, .box-part:hover .title, .box-part:hover .text,.box-part:hover .text1,
	.box-part:hover a {
	color: #FFF;
	-webkit-transition: all 1s ease-out;
	-moz-transition: all 1s ease-out;
	-o-transition: all 1s ease-out;
	transition: all 1s ease-out;
}

.text {
	margin: 20px 0px;
	
}

.fa {
	color: #4183D7;
}

.text1 {
	margin: 20px 0px;
	
	
}


</style>

<title>Speaker Answers</title>
</head>
<body>

	<form action="questionAnswered" method="post" class="form-horizontal">

		<input type="hidden" name="status" value=${ question.quesId}>

		<div class="box">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="box-part text-center">
						<i class="fa fa-quora fa-3x" aria-hidden="true"></i>
						<div class="title">
							<h3>${ question.ques}</h3>
						</div>
						<div class="text">
							<span>Question By : ${ question.userName}</span>
						</div>
						<div class="text">
							<span>Votes Collected : ${ question.vote}</span>
						</div>
						<div class="text1">
							<span>Status : ${ question.status}</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br> <br>

		<div class="submit">
			<button class="btn btn-md"
				style="background-color: #4183D7; color: #ffffff">Mark
				Answered</button>
		</div>

	</form>

</body>
</html>