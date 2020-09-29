<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" media="screen" href="/mango/resources/css/Top_list.css"/>
<title>맛집 리스트</title>
</head>
<body>
	<%
	 	int pagenum = 0;
		double restaurantnum = 0;
		String search = null;

		
		
	%>
	<jsp:include page="header.jsp"></jsp:include>
	<%-- <div class="Header-Toplist">
		<P>${title}</P>
	</div> --%>
	
	<div class="Contents-Outer">
		<section class="Contents-Main">
			<div class="Contents">
				<div class="Contents-View">
					<section class="ItemList">
						<c:forEach items="${list}" var="dto" begin="0" end="9">
							<div class="Item-Container">
									<ul class="Item">	
										<li class="image"><a href="restaurants?seq=${dto.seq}"><img src="/mango/resources/img/${dto.img}" width="280" height="230"></a></li>		
										<div class="Restaurants_Contents">
											<div style="display: flex; padding: 5px 0 5px 0;"><li class="store_name">${dto.r_name}&nbsp;&nbsp;&nbsp;&nbsp;</li><li class="store_rating">${dto.rating}</li></div>
											<li>${dto.addr}</li>
										</div>		
									</ul>
							</div>	
							<hr>
						</c:forEach>
					</section>
					<div class="page">
						<% 
			 				for (int i = 1 ; i <=pagenum  ; i++) {
				 		%>		
							<a href="top_lists?page=<%=i%>&restaurantnum=${restaurantnum}&rest_category=${rest_category}&rest_addr=${rest_addr}"><%=i%></a>	
						<%
							}
						%> 
					</div>
				</div>	
	<script type="text/javascript">
		$('document').ready(function() {
			$('#HeaderId').attr('class','Header-White');
			$('#logo').attr('class','mango-logo-White');
			$('#SearchBoxId').attr('class','Header-SearchBox');
		});
		
	</script>
</body>
</html>