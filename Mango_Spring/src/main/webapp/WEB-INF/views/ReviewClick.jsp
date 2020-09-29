<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
	div#reviewWord {
		background-color:white;
		position:absolute;
		width:100%;
		max-width:700px;
		min-width:300px;
		height:1000px;
		top:50%;
		left:50%;
		margin-top: -400px;
		transform: translateX(-50%);
		border: 2px solid yellow;
		display:block;
	}
	.greyRule {
		background-color: grey;
		position: absolute;
		top: 40px;
		width: 100%;
		height: 1px;
		padding: 0;
	}
	.greyRule hr {
		display: none;
	}
	#reviewScroll{
		position: absolute;
		bottom: 50px;
		width: 90%;
		height: 380px;
		left: 50%;
		transform: translateX(-50%);
	}
	#reviewImage{
		height: 310px;
		border: 1px solid #fff;
		margin: 3px;
		display: flex;
		float: left;
	}
	#reviewImage img{
		width: 300px;
		height: 300px;
	}
</style>
<meta charset="UTF-8">
<title>리뷰 화면</title>
</head>
<body>
	<div id="reviewWord">
		<p style="position: absolute; left: 5%;">${review_click.r_name}</p>
		<div class="greyRule"><hr /></div>
			<img id="reviewProfileImage" src="${review_click.m_image}" alt="" style="position: absolute; top: 50px; left: 5%; width: 50px; height: 50px;">
			<input id="reviewPoint" value="" disabled="disabled" style="background-color:white; position: absolute; top: 50px; right: 5%; width: 50px; border:0px; height: 50px; font-size: 40px; text-align: center;">
			<p id="reviewProfileName" style="position: absolute; top: 40px; left: 20%; font-weight: bold;">${review_click.name}</p>
			<a href="restaurants.do?seq=${review_click.r_seq}" style="position: absolute; top: 120px; left: 3%;">리뷰의 가게로 이동</a>
			<p><textarea id="reviewWords" disabled="disabled" style="position: absolute; background-color:white; border:0px; width: 92%; top: 150px; left: 3%; bottom: 450px; resize: none; word-wrap:normal; word-break:break-all; overflow-y:auto;">${review_click.content}</textarea></p>
		<div id="reviewScroll">
			<div id="reviewImages" style="position: absolute; bottom: 50px; left: 3%; width: 300px; text-align: center; left: 50%; transform: translateX(-50%);">
				<div id="reviewImage"><img src="./resources/img_review/${review_click.r_image}" alt=""></div>
			</div>
		</div>
		<div id="reviewDate" style="position: absolute; bottom: 20px; left: 3%;">${review_click.date}</div>
	</div>
</body>
</html>