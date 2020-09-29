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
		padding-bottom: 20px;
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
	/* #reviewScroll{
		position: absolute;
		bottom: 50px;
		width: 50%;
		height: 250px;
		left: 50%;
		transform: translateX(-50%);
		display: flex;
	} */
	#reviewScroll {
	    position: absolute;
	    bottom: 50px;
	    width: 500px;
	    height: 250px;
	    left: 40%;
	    top: 80%;
	    display: flex;
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
	#preview img{
		width: 200px;
		height: 200px;
	}
svg {
	fill: rgb(242, 242, 242);
	height: 3.6rem;
	width: 3.6rem;
	margin: 0.2rem;
}
input[type="radio"] {
	position: absolute;
	opacity: 0;
}
input[class="happy"]:hover + svg,
input[class="happy"]:checked + svg,
input[class="happy"]:focus + svg {
	fill: rgb(229, 132, 0);
}

input[class="neutral"]:hover + svg,
input[class="neutral"]:checked + svg,
input[class="neutral"]:focus + svg {
	fill: rgb(229, 132, 0);
}

input[class="sad"]:hover + svg,
input[class="sad"]:checked + svg,
input[class="sad"]:focus + svg {
	fill: rgb(229, 132, 0);
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="reviewinsert?seq=${dto.seq}" method="post" enctype="Multipart/form-data">
	<div id="reviewWord">
		 <div class="rating" style="position: absolute; left: 30%; padding-top: 40px;">
	    
	        <label for="happy">
				<input type="radio" name="rating" class="happy" id="happy" value="맛있습니다." checked />
				<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="100%" height="100%" viewBox="0 0 24 24">
				<path d="M20,12A8,8 0 0,0 12,4A8,8 0 0,0 4,12A8,8 0 0,0 12,20A8,8 0 0,0 20,12M22,12A10,10 0 0,1 12,22A10,10 0 0,1 2,12A10,10 0 0,1 12,2A10,10 0 0,1 22,12M10,9.5C10,10.3 9.3,11 8.5,11C7.7,11 7,10.3 7,9.5C7,8.7 7.7,8 8.5,8C9.3,8 10,8.7 10,9.5M17,9.5C17,10.3 16.3,11 15.5,11C14.7,11 14,10.3 14,9.5C14,8.7 14.7,8 15.5,8C16.3,8 17,8.7 17,9.5M12,17.23C10.25,17.23 8.71,16.5 7.81,15.42L9.23,14C9.68,14.72 10.75,15.23 12,15.23C13.25,15.23 14.32,14.72 14.77,14L16.19,15.42C15.29,16.5 13.75,17.23 12,17.23Z" /></svg>
				맜어요</label>
	
	        <label for="neutral">
				<input type="radio" name="rating" class="neutral" id="neutral" value="괜찮습니다." />
				<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="100%" height="100%" viewBox="0 0 24 24">
				<path d="M8.5,11A1.5,1.5 0 0,1 7,9.5A1.5,1.5 0 0,1 8.5,8A1.5,1.5 0 0,1 10,9.5A1.5,1.5 0 0,1 8.5,11M15.5,11A1.5,1.5 0 0,1 14,9.5A1.5,1.5 0 0,1 15.5,8A1.5,1.5 0 0,1 17,9.5A1.5,1.5 0 0,1 15.5,11M12,20A8,8 0 0,0 20,12A8,8 0 0,0 12,4A8,8 0 0,0 4,12A8,8 0 0,0 12,20M12,2A10,10 0 0,1 22,12A10,10 0 0,1 12,22C6.47,22 2,17.5 2,12A10,10 0 0,1 12,2M9,14H15A1,1 0 0,1 16,15A1,1 0 0,1 15,16H9A1,1 0 0,1 8,15A1,1 0 0,1 9,14Z" /></svg>
				괜찮아요</label>
	
	        <label for="sad">
				<input type="radio" name="rating" class="sad" id="sad" value="별로입니다." />
				<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="100%" height="100%" viewBox="0 0 24 24">
				<path d="M20,12A8,8 0 0,0 12,4A8,8 0 0,0 4,12A8,8 0 0,0 12,20A8,8 0 0,0 20,12M22,12A10,10 0 0,1 12,22A10,10 0 0,1 2,12A10,10 0 0,1 12,2A10,10 0 0,1 22,12M15.5,8C16.3,8 17,8.7 17,9.5C17,10.3 16.3,11 15.5,11C14.7,11 14,10.3 14,9.5C14,8.7 14.7,8 15.5,8M10,9.5C10,10.3 9.3,11 8.5,11C7.7,11 7,10.3 7,9.5C7,8.7 7.7,8 8.5,8C9.3,8 10,8.7 10,9.5M12,14C13.75,14 15.29,14.72 16.19,15.81L14.77,17.23C14.32,16.5 13.25,16 12,16C10.75,16 9.68,16.5 9.23,17.23L7.81,15.81C8.71,14.72 10.25,14 12,14Z" /></svg>
				별로</label>
	   
	    </div>
		<p style="position: absolute; left: 5%;">${dto.r_name}</p>
		<div class="greyRule"><hr /></div>
		<img id="reviewProfileImage" src="${dto.img}" alt="" style="position: absolute; top: 50px; left: 5%; width: 50px; height: 50px;">
		<input id="reviewPoint" value="${dto.rating}" disabled="disabled" style="background-color:white; position: absolute; top: 50px; right: 5%; width: 50px; border:0px; height: 50px; font-size: 25px; text-align: center;">
		<p id="reviewProfileName" style="position: absolute; top: 40px; left: 20%; font-weight: bold;">${user.name}</p>
		<a href="restaurants?seq=${dto.seq}" style="position: absolute; top: 120px; left: 3%;">리뷰의 가게로 이동</a>
		<div style="position: absolute; background-color:white; border:0px; width: 92%; top: 150px; left: 3%; resize: none; word-wrap:normal; word-break:break-all; overflow-y:auto;">					
				<input type="hidden" name ="member_id_user" value="${user.id_user}">
				<input type="hidden" name ="user_name" value="${user.name}">
				<input type="hidden" name ="user_img" value="${user.image}">
				<input type="hidden" name ="r_name" value="${dto.r_name}">
				<input type="hidden" name ="r_seq" value="${dto.seq}">
				<input type="text" name ="reviewcontent" style="width: 98%; height:500px;"><br>
				<input id="upload" name="files" multiple="multiple" type="file" name="imgs"><br><br>
				<input type="submit" value="리뷰작성" style="cursor: pointer;">					
			</div>
			</div>
		<div id="reviewScroll">
			<ul>
			<li id='preview' style="position: absolute; left: 20%; display: block;" >
        	<!-- 미리보기 공간 -->
    		</li>
    		</ul>
		</div>
		</form>
</body>
<script type="text/javascript" src="./js/jquery-3.1.0.min.js" charset="utf-8"></script>
<script type="text/javascript"></script>
<script>
    var upload = document.querySelector('#upload');
    var preview = document.querySelector('#preview');
 
    upload.addEventListener('change',function (e) {
        var get_file = e.target.files;
 
        var image = document.createElement('img');
 
        /* FileReader 객체 생성 */
        var reader = new FileReader();
 
        /* reader 시작시 함수 구현 */
        reader.onload = (function (aImg) {
            console.log(1);
 
            return function (e) {
                console.log(3);
                /* base64 인코딩 된 스트링 데이터 */
                aImg.src = e.target.result
            }
        })(image)
 
        if(get_file){
            /* 
                get_file[0] 을 읽어서 read 행위가 종료되면 loadend 이벤트가 트리거 되고 
                onload 에 설정했던 return 으로 넘어간다.
                이와 함게 base64 인코딩 된 스트링 데이터가 result 속성에 담겨진다.
            */
            reader.readAsDataURL(get_file[0]);
            console.log(2);
        }
 
        preview.appendChild(image);
    })
</script>
</html>