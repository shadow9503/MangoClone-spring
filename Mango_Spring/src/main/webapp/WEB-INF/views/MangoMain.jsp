<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- ////////////////////
		   CSS 
 ////////////////////-->
 
<link rel="stylesheet" media="screen" href="/mango/resources/css/Main.css"/>
<link rel="stylesheet" type="text/css" href="/mango/resources/slick/slick.css">
<link rel="stylesheet" type="text/css" href="/mango/resources/slick/slick-theme.css">
<link rel="stylesheet" media="screen" href="/mango/resources/slick/slickmain.css"/>



<!-- ////////////////////
	   CSS 스타일 지정
 ////////////////////-->
 
	<style>
		/* .OUTER {
			margin: auto;
			width:1500px;
		} */
	</style>
	
	
	
<title>맛집 리스트</title> 

</head>

<body> 

<!-- ////////////////////////////
		header.jsp include
 ////////////////////////////-->
 
<jsp:include page="header.jsp"></jsp:include>

<!-- /////////////////////////////////////////////////////// -->

<div class="Header-Main">
		<div class="Header-Main-Overlay">
			<p>솔직한 리뷰, 믿을 수 있는 평점!</p>
			<p>망고플레이트</p>
			<div class="Header-Main-SearchBox" id="SearchBoxId">
				<form class="inputform" action="search" method="get">
					<input id="header-main-search" size="45" name="search" type="text" placeholder="지역,식당 또는 음식" class="Header-SearchInput">
				</form>
			</div>
		</div>
	</div>
	
<div class="OUTER">
	<h2>믿고 보는 맛집 리스트</h2>
	<section class="regular slider">
	     <div>
	      <a href="top_lists?rest_category=디저트&rest_kind=&rest_addr=청담"><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-49874-reviews-8b3589363818.jpg">
	      	<p>청담 디저트 맛집 베스트  <br> </p>
	      </a>
	      <a href="top_lists?rest_category=&rest_kind=파스타&rest_addr=강남구&title=강남 파스타 맛집 리스트"><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-added_restaurants-247128_145539175833343.jpg">
	      	<p>강남 파스타 맛집 리스트  <br> </p>
	      </a>
	    </div>
	    <div>
	      <a href="top_lists?rest_category=가로수길&rest_kind=&rest_addr=&title=가로수길 맛집 베스트"><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-added_restaurants-532687_1462080007741157.jpg">
	      	<p>가로수길 맛집 베스트  <br> </p>
	      </a>
	      <a href="top_lists?rest_category=&rest_kind=스테이크&rest_addr=&title=스테이크 맛집 베스트"><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-added_restaurants-527344_1460392830573148.jpg">
	      	<p>스테이크 맛집 베스트  <br> </p>
	      </a>
	    </div>
	    <div>
	      <a href="top_lists?rest_category=무한리필&rest_kind=&rest_addr=&title=무한리필 맛집 베스트"><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-573810_1497188309224115.jpg">
	      	<p>무한리필 맛집 베스트  <br> </p>
	      </a>
	      <a href="top_lists?rest_category=이태원&rest_kind=&rest_addr=&title=이태원 맛집 베스트"><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-336624-601525_1514031539198_4665">
	      	<p>이태원 맛집 베스트  <br> </p>
	      </a>
	    </div>
  	</section>
  	<hr>
	<h2>평점이 높은 인기 식당</h2>
	<section class="ItemList">
		<div class="Item-Container-Horizontal">
			<c:forEach items="${rating_list}" var="dto">
				<div class="Item-Container">
						<ul class="Item">	
							<li class="image"><a href="restaurants?seq=${dto.seq}"><img src="/mango/resources/img/${dto.img}" width="350" height="300"></a></li>		
							<div style="display: flex; padding: 5px 0 5px 0;"><li class="store_name">${dto.r_name}&nbsp;&nbsp;&nbsp;&nbsp;</li><li class="store_rating">${dto.rating}</li></div>
							<li>${dto.r_dong} - ${dto.kind} / ${dto.category}</li>		
						</ul>
				</div>	
			</c:forEach>
		</div>
	</section>
	<hr>
	<h2>지역별 인기 맛집</h2>
	<section class="regular slider">
	    <div>
	      <a href="top_lists?rest_category=&rest_kind=&rest_addr=마포구&title=마포 맛집 베스트"><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-added_restaurants-429717_1446888982113.jpg">
	      	<p>마포 맛집 베스트 <br> </p>
	      </a>
	      <a href="top_lists?rest_category=&rest_kind=&rest_addr=강남구&title=강남 맛집 리스트"><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-1052782_1573520727410777.jpg">
	      	<p>강남 맛집 리스트 <br> </p>
	      </a>
	    </div>
	    <div>
	      <a href="top_lists?rest_category=가로수길&rest_kind=&rest_addr=&title=가로수길 맛집 베스트"><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-added_restaurants-166_1454157462645.jpg">
	      	<p>가로수길 맛집 베스트 <br> </p>
	      </a>
	      <a href="top_lists?rest_category=&rest_kind=&rest_addr=여의도&title=여의도 맛집 베스트"><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-231866-2dwri_m7s9nxtr.jpg">
	      	<p> 여의도 맛집 베스트<br> </p>
	      </a>
	    </div>
	    <div>
	      <a href="top_lists?rest_category=&rest_kind=&rest_addr=성수&title=성수동 맛집 베스트"><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-268918-512536_1490184275055_16308">
	      	<p>성수동 맛집 베스트<br> </p>
	      </a>
	      <a href="top_lists?rest_category=이태원&rest_kind=&rest_addr=&title=이태원 맛집 베스트"><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-added_restaurants-34450_1453128260843.jpg">
	      	<p>이태원 맛집 베스트 <br> </p>
	      </a>
	    </div>
  	</section>
	<hr>
	<h2>메뉴별 인기 맛집</h2>
	<section class="regular slider">
	    <div>
	      <a href="top_lists?rest_category=&rest_kind=디저트&rest_addr=&title=디저트 맛집 베스트"><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-196421_1433257976467">
	      	<p> 디저트 맛집 베스트 <br> </p>
	      </a>
	      <a href="top_lists?rest_category=&rest_kind=파스타&rest_addr=&title=파스타 맛집 리스트"><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-103188-444309_1449551471790_10430">
	      	<p> 파스타 맛집 리스트 <br> </p>
	      </a>
	    </div>
	    <div>
	      <a href="top_lists?rest_category=&rest_kind=피자&rest_addr=&title=피자 맛집 베스트"><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-284320-708437_1529284301699_100580">
	      	<p>피자 맛집 베스트<br> </p>
	      </a>
	      <a href="top_lists?rest_category=&rest_kind=스테이크&rest_addr=&title=스테이크 맛집 베스트"><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-supporters_admin-9sxctdd5lkss8k.jpg">
	      	<p>스테이크 맛집 베스트 <br> </p>
	      </a>
	    </div>
	    <div>
	      <a href="top_lists?rest_category=고기&rest_kind=고기&rest_addr=&title=고기 맛집 베스트"><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-832260_1538992729782935.jpg">
	      	<p>고기 맛집 베스트 <br> </p>
	      </a>
	      <a href="top_lists?rest_category=&rest_kind=힌식&rest_addr=&title=한식 맛집 베스트"><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-224012-625419_1490106137092_9353">
	      	<p>한식 맛집 베스트<br> </p>
	      </a>
	    </div>
  	</section>
</div>

<!-- ////////////////////////////
		      Script
 ////////////////////////////-->
 
	<script type="text/javascript">
		$('document').ready(function() {
			$('#HeaderId').attr('class','Header');
			$('#logo').attr('class','mango-logo');
			/* $('#SearchBoxId').attr('class','Header-SearchBox-Hidden'); */
			$('#MangoPick-Btn').attr('class','Header-Btn-MangoPick');
			$('#TopList-Btn').attr('class','Header-Btn-TopList');
			/* $('#Profile-Btn').attr('class','Header-Btn-Profile'); */
			
			$(".regular").slick({
		        dots: true,
		        infinite: true,
		        slidesToShow: 3,
		        slidesToScroll: 3
		    });
		});
		
		$(window).scroll(function () { 
			scrollEvent();
		});
		
	</script>
	
<!-- ////////////////////
		   JS
 ////////////////////-->
 
<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
<script src="/mango/resources/slick/slick.js" type="text/javascript" charset="utf-8"></script>
<script src="/mango/resources/js/main.js" type="text/javascript" charset="utf-8"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</body>
</html>