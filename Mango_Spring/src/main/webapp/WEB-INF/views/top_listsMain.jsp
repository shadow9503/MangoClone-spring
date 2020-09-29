<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		img {
			width: 300px;
			height: 300px;
		}
		a {
			padding: 3%;
		}
		.Contents-Outer div {
			display: inline-flex;
			padding-left: 95px;
		}
		.Contents-Outer {
			text-align: center;
			width: 1000px;
			height: 100%;
			margin: 0 auto;
			display: flex;
			flex-direction: column;
		}
		h2 { color: #ff6f00; font-weight: normal; margin-left: 20px;}
	</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<jsp:include page="header.jsp"></jsp:include>
		
		<h2>믿고 보는 맛집 리스트</h2>
		<div class="Contents-Outer">
	 	<div>
	      <a href="top_lists?rest_category=&rest_kind=디저트&rest_addr=청담"><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-911852_1525937514264142.jpg">
	      	<p>청담 디저트 맛집 베스트 20곳 <br> </p>
	      </a>
	      <a href="top_lists?rest_category=&rest_kind=파스타&rest_addr=강남구"><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-added_restaurants-247128_145539175833343.jpg">
	      	<p>강남 파스타 맛집 리스트 45곳 <br> </p>
	      </a>
	    </div>
	    <div>
	      <a href="top_lists?rest_category=가로수길&rest_kind=&rest_addr="><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-added_restaurants-532687_1462080007741157.jpg">
	      	<p>가로수길 맛집 베스트 20곳 <br> </p>
	      </a>
	      <a href="top_lists?rest_category=&rest_kind=스테이크&rest_addr="><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-added_restaurants-527344_1460392830573148.jpg">
	      	<p>스테이크 맛집 베스트 20곳 <br> </p>
	      </a>
	    </div>
	    <div>
	      <a href="top_lists?rest_category=무한리필&rest_kind=&rest_addr="><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-573810_1497188309224115.jpg">
	      	<p>무한리필 맛집 베스트 20곳 <br> </p>
	      </a>
	      <a href="top_lists?rest_category=이태원&rest_kind=&rest_addr="><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-336624-601525_1514031539198_4665">
	      	<p>이태원 맛집 베스트 20곳 <br> </p>
	      </a>
	    </div>
	     <div>
	      <a href="top_lists?rest_category=&rest_kind=&rest_addr=마"><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-added_restaurants-429717_1446888982113.jpg">
	      	<p>마포 맛집 베스트 <br> </p>
	      </a>
	      <a href="top_lists?rest_category=&rest_kind=&rest_addr=강남구"><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-1052782_1573520727410777.jpg">
	      	<p>강남 맛집 리스트 <br> </p>
	      </a>
	    </div>
	    <div>
	      <a href="top_lists?rest_category=가로수길&rest_kind=&rest_addr="><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-added_restaurants-166_1454157462645.jpg">
	      	<p>가로수길 맛집 베스트 <br> </p>
	      </a>
	      <a href="top_lists?rest_category=&rest_kind=&rest_addr=여의도"><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-231866-2dwri_m7s9nxtr.jpg">
	      	<p> 여의도 맛집 베스트<br> </p>
	      </a>
	    </div>
	    <div>
	      <a href="top_lists?rest_category=&rest_kind=&rest_addr=성수"><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-268918-512536_1490184275055_16308">
	      	<p>성수동 맛집 베스트<br> </p>
	      </a>
	      <a href="top_lists?rest_category=이태원&rest_kind=&rest_addr="><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-added_restaurants-34450_1453128260843.jpg">
	      	<p>이태원 맛집 베스트 <br> </p>
	      </a>
	    </div>
	    <div>
	      <a href="top_lists?rest_category=&rest_kind=디저트&rest_addr="><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-196421_1433257976467">
	      	<p> 디저트 맛집 베스트 <br> </p>
	      </a>
	      <a href="top_lists?rest_category=&rest_kind=파스타&rest_addr="><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-103188-444309_1449551471790_10430">
	      	<p> 파스타 맛집 리스트 <br> </p>
	      </a>
	    </div>
	    <div>
	      <a href="top_lists?rest_category=&rest_kind=피자&rest_addr="><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-284320-708437_1529284301699_100580">
	      	<p>피자 맛집 베스트<br> </p>
	      </a>
	      <a href="top_lists?rest_category=&rest_kind=스테이크&rest_addr="><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-supporters_admin-9sxctdd5lkss8k.jpg">
	      	<p>스테이크 맛집 베스트 <br> </p>
	      </a>
	    </div>
	    <div>
	      <a href="top_lists?rest_category=고기&rest_kind=고기&rest_addr="><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-832260_1538992729782935.jpg">
	      	<p>고기 맛집 베스트 <br> </p>
	      </a>
	      <a href="top_lists?rest_category=&rest_kind=힌식&rest_addr="><img src="/mango/resources/img/https---mp-seoul-image-production-s3.mangoplate.com-224012-625419_1490106137092_9353">
	      	<p>한식 맛집 베스트<br> </p>
	      </a>
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