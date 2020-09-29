<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" media="screen" href="/mango/resources/css/Restaurant.css"/>

<title>음식점</title>
	<style>
	</style>
</head>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="ReviewImageClick.jsp"></jsp:include>
<body>
	<div class="FoodImages">
	<% int i=0; %>
	<c:forEach var="review" varStatus="vStatus" items="${review}" begin="0" end="4">
	<% i++; %>
		<div class="FoodImages-Item"><img src="/mango/resources/img_review/${review.image}" alt="" onclick="imageClick(<%=i%>)" style="width: 310px; height: 300px; cursor:pointer;"></div>			
	</c:forEach>
	</div>
	
	<div class="Contents-Outer">
		<section class="Contents-Main">
			<div class="Contents">
				<div class="Contents-View">
					<header>
						<div class="Title">
							<span class="title"><h2>${restaurant_info.r_name}</h2> <h2 style="color:#ff6f00;">${restaurant_info.rating}</h2></span>
							<c:if test="${user.id_user == null}">
							</c:if>
							<c:if test="${user.id_user != null}">
								<a href="ReviewInfo?seq=${restaurant_info.seq}"><i class="write-review"></i></a>
							</c:if>
							
						</div>
						<div>
							
						</div>
					</header>
					<div>
						<hr>
						<table class="restaurant-table">
								<c:if test="${restaurant_info.addr != null}">
									<tr>
									<td>주소</td>
									<td>${restaurant_info.addr}</td>
								</tr>
								</c:if>
								<c:if test="${restaurant_info.tel != null}">
									<tr>
									<td>전화번호</td>
									<td>${restaurant_info.tel}</td>
								</tr>
								</c:if>
								<c:if test="${restaurant_info.kind != null}">
									<tr>
									<td>음식 종류</td>
									<td>${restaurant_info.kind} / ${restaurant_info.category}</td>
								</tr>
								</c:if>
								<c:if test="${restaurant_info.open_time != null}">
									<tr>
									<td>영업시간</td>
									<td>${restaurant_info.open_time}</td>
								</tr>
								</c:if>
								<c:if test="${restaurant_info.holiday != null}">
									<tr>
									<td>휴일</td>
									<td>${restaurant_info.holiday}</td>
								</tr>
								</c:if>
						</table>
						<hr>
					</div>
				</div>
				<section class="Contents-Review-Outer">
					<ul class="Contents-Review-ItemList"> 
					
				<%
					try {
				%>
				
					<c:forEach items="${review}" var="review">	
						<li class="Contents-Review-Item">
							<a class="Content-Review-Item-a" href="ReviewClick?seq_review=${review.seq_review}">
								<div class="Review-Profile">
									<div class="User-Image">
										<img src="${review.user_img}">
									</div>
									<P>
									<span>${review.user_name}</span>
								</div>
								<div class="Review-Contents">
									<br>${review.date}</br>
									${review.content}
								</div>
								<div class="Review-evaluation">
								
								</div>
							</a>
						</li>	
						<hr>
					</c:forEach>
					
				<%
					}
					catch(Exception e) {
						e.printStackTrace();
					}
				%>
					</ul>
					<button onclick="moreReview()">더보기</button>
					
					
				</section>
				
			</div>
		</section>
		<form>
			<input type="hidden" value="${restaurant_info.addr}" id="address">
			<input type="hidden" value="${restaurant_info.r_name}" id="name">
		</form>
		
		<aside class="Contents-Side">
			<div class="NaverMapApi">
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=86c7f3cc45f4f08adefa8318a431a1b5&libraries=services"></script>
			<div id="map" style="width:100%;height:400px;"></div>
				<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };  
				
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
				var address = document.getElementById('address').value;
				var name = document.getElementById('name').value;
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch(address, function(result, status) {
				
				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
				
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords
				        });
				
				        // 인포윈도우로 장소에 대한 설명을 표시합니다
				        var infowindow = new kakao.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+name+'</div>'
				        });
				        infowindow.open(map, marker);
				
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				});    
				</script>
			</div>
			<div class="Restaurants-Popular">
				<h1 style="color: #ff6f00; padding-left: 10px;">주변 인기 식당</h1>
				<div class="Restaurants-ItemList-Outer2">
					<ul class="Restaurants-ItemList2">
					<!-- 주변 인기 식당 리스트 생성  최대값 4개 -->
					<c:forEach  items="${nearby}" var="cnt">
						<li class="Restaurants-Item-Outer2">
							<section class="Restaurants-Item-Section2">
							
								<a class="Restaurants-ItemLink-Thumnail2" href="restaurants?seq=${cnt.seq}"><i class="Restauants-Thumnail2"><img src="./img/${cnt.img}" width="90" height="90"></i></a>
								 
								<div class="Restaurants-ItemInfo-Outer2">
									<a class="Restaurants-ItemLink2">이름: ${cnt.r_name}</a>
									<span class="Restaurants-ItemFood2">음식 종류: ${cnt.kind}</span> <br>
									<span class="Restaurants-ItemAddress2">위치: ${cnt.addr}</span> <br>
						
								</div>
							</section>
						</li>

							<hr>

					</c:forEach>
					</ul>
				</div>
			</div>
		</aside>
	</div>
	
	<%-- <jsp:include page=""></jsp:include> --%>
	
	<script type="text/javascript">
	
		$('document').ready(function() {
			$('#HeaderId').attr('class','Header-White');
			$('#logo').attr('class','mango-logo-White');
			$('#SearchBoxId').attr('class','Header-SearchBox');
		});
		
		// 리뷰 더보기 메소드 Ajax방식
		var index_start = 2;
		function moreReview() {
			$.ajax({
			    url:'moreReview', //request 보낼 서버의 경로
			    type:'post', // 메소드(get, post, put 등)
			    dataType: 'HTML',
			    data: {
					'index_start' : index_start,
					'seq' : "${restaurant_info.seq}"
				},
			    success: function(data) {
			        //서버로부터 정상적으로 응답이 왔을 때 실행
			        console.log("성공");
			        index_start++;
					$('.Contents-Review-ItemList').append(data);
				},
			    error: function(err) {
			        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
			    }
			});
		}
		
	</script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/mango/resources/js/script.js"></script>
</body>
</html>