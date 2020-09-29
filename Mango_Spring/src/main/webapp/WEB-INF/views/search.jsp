<%@page import="java.awt.print.Printable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>	
	
<meta charset="UTF-8">
<link rel="stylesheet" media="screen" href="/mango/resources/css/search.css"/>
<link rel="stylesheet" media="screen" href="/mango/resources/css/Restaurant.css"/>

<title>음식점</title>
	<style>
	</style>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
<%
 	int pagenum = 0;
	double restaurantnum = 0;
	String search = null;

	restaurantnum = Double.parseDouble(request.getAttribute("restaurantnum").toString());

	search = request.getParameter("search");

	pagenum = (int)Math.ceil(restaurantnum/10);
%> 
	<%int j=0; int k=0;%>
	<form > 		
		<c:forEach items="${add}" var="address">	
			<% j++; 
	
			%>
			<input type="hidden" value="${address.addr}" id="map<%=j%>">	
		</c:forEach>
	</form>	
	<form > 		
		<c:forEach items="${list}" var="name">	
			<% k++; 
			%>
			<input type="hidden" value="${name.r_name}" id="name<%=k%>">	
		</c:forEach>
	</form>

	<div class="Contents-Search-Outer">
		<section class="Contents-Search-Main">
			<div class="Contents-Search">
				<div class="Contents-Search-View">
				<header class="Contents-Search-Header">
					<div class="Search-Title">
						<h2> <%=search%>&nbsp;맛집 인기 검색순위</h2><!-- <i class="Filter-Image"></i> -->
					</div>
			<!-- DB에 존재하지 않는 컬럼존재 -->
					<!-- <ul class="Search-Category">
						<li>한식</li>
						<li>분식</li>
						<li>양식</li>
						<li>세계음식</li>
						<li>뷔페</li>
						<li>디저트</li>
						<li>카페</li>
						<li>술집</li>
						<li>치킨</li>
						<li>브런치</li>
						<li>이탈리안</li>
					</ul> -->
				</header>
					
					<section class="ItemList">
						<c:forEach items="${list}" var="dto" begin="0" end="9">	
							<div class="Item-Container">
									<ul class="Item">	
										<li class="image"><a href="restaurants?seq=${dto.seq}"><img src="/mango/resources/img/${dto.img}" width="350" height="300"></a></li>		
										<div style="display: flex; padding: 5px 0 5px 0;"><li class="store_name">${dto.r_name}&nbsp;&nbsp;&nbsp;&nbsp;</li><li class="store_rating">${dto.rating}</li></div>
										<li>${dto.r_dong} - ${dto.kind} / ${dto.category}</li>
										<li>${reviewcount}</li>				
									</ul>
							</div>	
						</c:forEach>
					</section>
					<div class="page">
						<% 
			 				for (int i = 1 ; i <=pagenum  ; i++) {
				 		%>		
							<a href="search?page=<%=i%>&restaurantnum=<%=restaurantnum%>&search=<%=search%>"><%=i%></a>	
						<%
							}
						%> 
					</div>
				</div>
			</div>
		</section>
		
		<aside class="Contents-Side">
			<div class="NaverMapApi">
				<div class="NaverMapApi">
				<script>			
					var add1 = document.getElementById('map1').value;
					var add2 = document.getElementById('map2').value;
					var add3 = document.getElementById('map3').value;
					var add4 = document.getElementById('map4').value;
					var add5 = document.getElementById('map5').value;
					var add6 = document.getElementById('map6').value;
					var add7 = document.getElementById('map7').value;
					var add8 = document.getElementById('map8').value;
					var add9 = document.getElementById('map9').value;
					var add10 = document.getElementById('map10').value;
					var name1 = document.getElementById('name1').value;
					var name2 = document.getElementById('name2').value;
					var name3 = document.getElementById('name3').value;
					var name4 = document.getElementById('name4').value;
					var name5 = document.getElementById('name5').value;
					var name6 = document.getElementById('name6').value;
					var name7 = document.getElementById('name7').value;
					var name8 = document.getElementById('name8').value;
					var name9 = document.getElementById('name9').value;
					var name10 = document.getElementById('name10').value;
					console.log(name4);				
				</script>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=86c7f3cc45f4f08adefa8318a431a1b5&libraries=services"></script>
				<div id="map" style="width:100%;height:400px;"></div>
					<script>
						var mapContainer = document.getElementById('map');
						var mapOption = {
						    center: new daum.maps.LatLng(37.450701, 126.570667),
						    level: 10
						};  
	
						var map = new daum.maps.Map(mapContainer, mapOption); 
	
						var geocoder = new daum.maps.services.Geocoder();
						var nameData = [
							name1, 
							name2, 
							name3,
							name4,
							name5,
							name6,
							name7,
							name8,
							name9,
							name10,
						]; 
						var listData = [
							add1, 
							add2, 
							add3,
							add4,
							add5,
							add6,
							add7,
							add8,
							add9,
							add10,
						];
	
						listData.forEach(function(addr, index) {
						    geocoder.addressSearch(addr, function(result, status) {
						        if (status === daum.maps.services.Status.OK) {
						            var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	
						            var marker = new daum.maps.Marker({
						                map: map,
						                position: coords
						            });
						            var infowindow = new daum.maps.InfoWindow({
						                content: '<div style="width:150px;text-align:center;padding:6px 0;">' + nameData[index] + '</div>',
						                disableAutoPan: true
						            });
						            infowindow.open(map, marker);
						            map.setCenter(coords);
						        } 
						    });
						});        
					</script>
			</div>
			</div>
			<div class="Restaurants-Popular">
			
				<%-- <h1 style="color: #ff6f00; padding-left: 10px;">관련 콘텐츠</h1>
				<div class="Restaurants-ItemList-Outer2">
					<ul class="Restaurants-ItemList2">
					<!-- 주변 인기 식당 리스트 생성  최대값 4개 -->
					<c:forEach var="cnt" begin="1" end="4">
						<li class="Restaurants-Item-Outer2">
							<section class="Restaurants-Item-Section2">
							
								<a class="Restaurants-ItemLink-Thumnail2"><i class="Restauants-Thumnail2"></i></a>
								
								<div class="Restaurants-ItemInfo-Outer2">
									<a class="Restaurants-ItemLink2">이름(링크)</a>
									<span class="Restaurants-ItemFood2">음식 종류:</span> <br>
									<span class="Restaurants-ItemAddress2">위치: </span> <br>
									<span class="Restaurants-ItemPrice2">가격대: </span>
								</div>
							</section>
						</li>
						<c:if test="${cnt < 4}">
							<hr>
						</c:if>
					</c:forEach> --%>
					</ul>
				</div>
			</div>
		</aside>
	</div>
	<!-- Footer 들어갈곳 -->
	<%-- <jsp:include page=""></jsp:include> --%>
	<script type="text/javascript">
	/* 페이지 로딩시 실행 */
		$('document').ready(function() {
			$('#HeaderId').attr('class','Header-White');
			$('#logo').attr('class','mango-logo-White');
			$('#SearchBoxId').attr('class','Header-SearchBox');
		});
		
	</script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/mango/resources/js/script.js"></script>
</body>
</html>