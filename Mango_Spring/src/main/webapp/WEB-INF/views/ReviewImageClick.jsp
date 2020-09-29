<%@page import="java.awt.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		div.backLayer {
			background-color: black;
			position: fixed;
			width: 100%;
			height: 95%;
			bottom: 0%;
			left: 0%;
			opacity: 0.5;
			z-index: 3;
			display: none;
		}
		div#reviewPage {
			background-color: black;
			position: fixed;
			width: 90%;
			height: 85%;
			left: 5%;
			bottom: 5%;
			overflow: hidden;
			z-index: 4;
			display: none;
		}
		#reviewExit {
			background-color: black;
			color: white;
			position: absolute;
			top: 5%;
			right: 1%;
		}
		.slideshow {
			background-color:black;
			position: absolute;
			height: auto;
			max-height: 500px;
			top: 40%;
			transform: translateY(-40%);
			overflow: hidden;
		}
		.navigation {
			position: absolute;
			bottom: 0%;
			display: flex;
			overflow: hidden;
			left: 50%;
			transform: translateX(-50%);
		}
		.bar {	
			left: 0px;
			width: 60px;
			height: 60px;
			border: 1px solid #fff;
			margin: 3px;
			cursor: pointer;
			transition: 0.3s;
		}
		.bar:hover {
			background: #fff;
		}
		.bar img {
			width: 100%;
			height: 100%;
		}
		
		input[name="r"] {
			position: absolute;
			visibility: hidden;
		}
		.slides {
			height: 100%;
			width: 1000%;
			display: flex;
		}
		
		.slide {
			transition: 0.3s;
			width:10%;
		}
		
		.slide img {
			max-width: 100%;
			max-height: 100%;
			size: 100% auto;
			display: block;
			margin: 0px auto;
		}
		div#reviewWord {
			background-color:white;
			position:absolute;
			width:350px;
			top:0%;
			bottom:0%;
			right:0%;
			float:right;
		}
		
		.greyRule {
			background-color: grey;
			position: absolute;
			top: 40px;
			width: 450px;
			height: 1px;
			padding: 0;
			margin: 0;
		}
		.greyRule hr {
			display: none;
		}
		#reviewProfileImage{
			position: absolute;
			top: 50px;
			left: 3%;
			width: 50px;
			height: 50px;
			border-radius: 50%;
			overflow:hidden;
		}
		#reviewProfileName{
			position: absolute;
			top: 40px;
			left: 20%;
			font-weight: bold;
		}
		#reviewWords{
			background-color: white;
			font-size: 18px;
			position: absolute;
			top: 150px;
			bottom: 3%;
			width: 100%;
			border:0px;
			resize: none;
			word-wrap:normal;
			word-break:break-all;
			overflow-y:auto;
		}
		#evaluation1, #evaluation2, #evaluation3{
			position: absolute;
			top: 50px;
			right: 5%;
			border: 0px;
			width: 50px;
			height: 50px;
			font-size: 40px;
			text-align: center;
			display: none;
		}
		#reviewEvaluationWord{
			color: orange;
			position: absolute;
			top: 100px;
			right: 20px;
		}
		/*
			버튼 클릭시 이미지 변경
		*/
		#r1:checked ~ .s1 {
			margin-left: 0%;
		}
		#r2:checked ~ .s1 {
			margin-left: -10%;
		}
		#r3:checked ~ .s1 {
			margin-left: -20%;
		}
		#r4:checked ~ .s1 {
			margin-left: -30%;
		}
		#r5:checked ~ .s1 {
			margin-left: -40%;
		}
		#r6:checked ~ .s1 {
			margin-left: -50%;
		}
		#r7:checked ~ .s1 {
			margin-left: -60%;
		}
		#r8:checked ~ .s1 {
			margin-left: -70%;
		}
		#r9:checked ~ .s1 {
			margin-left: -80%;
		}
		#r10:checked ~ .s1 {
			margin-left: -90%;
		}
		
		input[class="happy"]:checked + svg{
			fill: rgb(229, 132, 0);
		}
		
		input[class="neutral"]:checked + svg{
			fill: rgb(229, 132, 0);
		}

		input[class="sad"]:checked + svg{
			fill: rgb(229, 132, 0);
		}
	</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	
	$(document).ready(function(){
		
		turnOn();
		
		$("input[name=r]").change(function(){
			changeRadio();
		});
	});
	
	/* 
		ESC 클릭시 레이어 종료
	*/
	$(document).keydown(function(event){
		if(event.which=='27'){
			$(".backLayer").fadeOut(0);
			$("#reviewPage").fadeOut(0);
			$("#reviewExit").fadeOut(0);
		}
	});
	
	/*
		뒤의 검은 화면 클릭시 종료
	*/
	$(function(){
	    $('.backLayer').click(function(){
			$(".backLayer").fadeOut(0);
			$("#reviewPage").fadeOut(0);
			$("#reviewExit").fadeOut(0);
	    });
	});	
	
	/*
		X버튼 클릭시 종료
	*/
	$(function(){
	    $('#reviewexit').click(function(){
			$(".backLayer").fadeOut(0);
			$("#reviewPage").fadeOut(0);
			$("#reviewExit").fadeOut(0);
	    });
	});
	
	/*
		버튼 클릭시 내용 변경
	*/
	function changeRadio(){
		var res = $("input[name=r]:checked").val().split('; ');
		document.getElementById('reviewWords').value = res[0] + "\n\n\n\n" + res[3];
		$("#reviewProfileImage").attr("src", res[1]);
		document.getElementById('reviewProfileName').innerHTML = res[2];
		document.getElementById('reviewEvaluationWord').innerHTML = res[4];
		if(res[4] == "맛있습니다."){
			$("#evaluation1").show();
			$("#evaluation2").hide();
			$("#evaluation3").hide();
		}else if(res[4] == "괜찮습니다."){
			$("#evaluation1").hide();
			$("#evaluation2").show();
			$("#evaluation3").hide();
		}else{
			$("#evaluation1").hide();
			$("#evaluation2").hide();
			$("#evaluation3").show();
		}
	}
	
	/*
		레이어 사이즈 조정
	*/
	function turnOn(){
		changeRadio();
		
		var width = $(window).width();
		var height = $(window).height();
		
		$("#reviewImage").width($("#reviewPage").width()-350);
		$("#reviewImageArray").width($("#reviewPage").width()-350);
		$(".slideshow").width($("#reviewPage").width()-350);
		$(".slide").width($(".slideshow").width());
		
		resize();
		
		$(window).resize(function() {
			resize();
		});
	}
	
	/*
		윈도우 조정시 레이어 크기 조정
	*/
	function resize(){
		var width = $(window).width();
		var height = $(window).height();
		var $element = $("#reviewWord");
		
		if($("#reviewPage").width() >= 600){
			if(!$element.is(':visible')){
				$element.fadeIn(0);
			}else{
				
			}
			$(".slideshow").width($("#reviewPage").width()-350);
			$(".slide").width($(".slideshow").width());
			$(".navigation").css('left', 'calc(50% - 175px)');
		}else{
			if($element.is(':visible')){
				$element.fadeOut(0);
			}else{
				
			}
			$(".slideshow").width($("#reviewPage").width());
			$(".slide").width($(".slideshow").width());
			$(".navigation").css('left', '50%');
		}
	}
	
	/*
		레스토랑 이미지 클릭시 레이어 나타남
	*/
	function imageClick(r){
		var res = "#r" + r;
		$(res).prop('checked', true);
		
		$(".backLayer").fadeTo(0, 0.5);
		$("#reviewPage").fadeTo(0, 1);
		$("#reviewWord").fadeIn(0);
		$("#reviewImage").fadeIn(0);
		$("#reviewImageArray").fadeIn(0);
		$("#reviewExit").fadeIn(0);
		
		turnOn();
	}
	
</script>
</head>
<body>
	<div class='backLayer'>
		<input type="button" id="reviewExit" value="X">
	</div>
	<div id="reviewPage">
		<!-- 이미지 슬라이드 -->
		<div class="slideshow middle">
			<div class="slides">
				<c:forEach var="review" varStatus="vStatus" items="${review_info}" begin="0" end="0">
					<input type="radio" name="r" id="r${vStatus.index + 1}" checked="checked" value="${review.content}; ${review.m_image}; ${review.name}; ${review.date}; ${review.rating}">
				</c:forEach>
				<c:forEach var="review" varStatus="vStatus" items="${review_info}" begin="1">
					<input type="radio" name="r" id="r${vStatus.index + 1}" value="${review.content}; ${review.m_image}; ${review.name}; ${review.date}; ${review.rating}">
				</c:forEach>
				<c:forEach var="review" varStatus="vStatus" items="${review_info}" begin="0" end="0">
					<div class="slide s1">
						<img src="./resources/img_review/${review.r_image}" alt="">
					</div>
				</c:forEach>
				<c:forEach var="review" varStatus="vStatus" items="${review_info}" begin="1">
					<div class="slide">
						<img src="./resources/img_review/${review.r_image}" alt="">
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="navigation">
			<c:forEach var="review" varStatus="vStatus" items="${review_info}" begin="0" end="0">
				<label for="r1" class="bar rs"><img src="./resources/img_review/${review.r_image}" alt=""></label>
			</c:forEach>
			<c:forEach var="review" varStatus="vStatus" items="${review_info}" begin="1">
				<label for="r${vStatus.index + 1}" class="bar"><img src="./resources/img_review/${review.r_image}" alt=""></label>
			</c:forEach>
		</div>
		<div id="reviewWord">
			<p style="position: absolute; left: 5%; font-weight: bold;">${restaurant_info.r_name}</p>
			<div class="greyRule"><hr /></div>
			<img id="reviewProfileImage"alt="">
			<p id="reviewProfileName"></p>
			<!-- 리뷰 평가 사진 -->
			<label id="evaluation1" for="happy">
				<input type="radio" name="rating1" class="happy" id="happy" value="happy" checked="checked" style="display: none;"/>
				<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="100%" height="100%" viewBox="0 0 24 24">
				<path d="M20,12A8,8 0 0,0 12,4A8,8 0 0,0 4,12A8,8 0 0,0 12,20A8,8 0 0,0 20,12M22,12A10,10 0 0,1 12,22A10,10 0 0,1 2,12A10,10 0 0,1 12,2A10,10 0 0,1 22,12M10,9.5C10,10.3 9.3,11 8.5,11C7.7,11 7,10.3 7,9.5C7,8.7 7.7,8 8.5,8C9.3,8 10,8.7 10,9.5M17,9.5C17,10.3 16.3,11 15.5,11C14.7,11 14,10.3 14,9.5C14,8.7 14.7,8 15.5,8C16.3,8 17,8.7 17,9.5M12,17.23C10.25,17.23 8.71,16.5 7.81,15.42L9.23,14C9.68,14.72 10.75,15.23 12,15.23C13.25,15.23 14.32,14.72 14.77,14L16.19,15.42C15.29,16.5 13.75,17.23 12,17.23Z" /></svg>
			</label>
			<label id="evaluation2" for="neutral">
				<input type="radio" name="rating2" class="neutral" id="neutral" value="neutral" checked="checked" style="display: none;"/>
				<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="100%" height="100%" viewBox="0 0 24 24">
				<path d="M8.5,11A1.5,1.5 0 0,1 7,9.5A1.5,1.5 0 0,1 8.5,8A1.5,1.5 0 0,1 10,9.5A1.5,1.5 0 0,1 8.5,11M15.5,11A1.5,1.5 0 0,1 14,9.5A1.5,1.5 0 0,1 15.5,8A1.5,1.5 0 0,1 17,9.5A1.5,1.5 0 0,1 15.5,11M12,20A8,8 0 0,0 20,12A8,8 0 0,0 12,4A8,8 0 0,0 4,12A8,8 0 0,0 12,20M12,2A10,10 0 0,1 22,12A10,10 0 0,1 12,22C6.47,22 2,17.5 2,12A10,10 0 0,1 12,2M9,14H15A1,1 0 0,1 16,15A1,1 0 0,1 15,16H9A1,1 0 0,1 8,15A1,1 0 0,1 9,14Z" /></svg>
			</label>
	
			<label id="evaluation3" for="sad">
				<input type="radio" name="rating3" class="sad" id="sad" value="sad" checked="checked" style="display: none;"/>
				<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="100%" height="100%" viewBox="0 0 24 24">
				<path d="M20,12A8,8 0 0,0 12,4A8,8 0 0,0 4,12A8,8 0 0,0 12,20A8,8 0 0,0 20,12M22,12A10,10 0 0,1 12,22A10,10 0 0,1 2,12A10,10 0 0,1 12,2A10,10 0 0,1 22,12M15.5,8C16.3,8 17,8.7 17,9.5C17,10.3 16.3,11 15.5,11C14.7,11 14,10.3 14,9.5C14,8.7 14.7,8 15.5,8M10,9.5C10,10.3 9.3,11 8.5,11C7.7,11 7,10.3 7,9.5C7,8.7 7.7,8 8.5,8C9.3,8 10,8.7 10,9.5M12,14C13.75,14 15.29,14.72 16.19,15.81L14.77,17.23C14.32,16.5 13.25,16 12,16C10.75,16 9.68,16.5 9.23,17.23L7.81,15.81C8.71,14.72 10.25,14 12,14Z" /></svg>
			</label>
			<p id="reviewEvaluationWord"></p>
			<textarea id="reviewWords" disabled="disabled"></textarea>
		</div>
	</div>
</body>
</html>