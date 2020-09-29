<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 </title>
</head>
<style>
.img{
        position: relative;
        background-image: url("https://t1.daumcdn.net/cfile/tistory/998792415A31ADE616");                                                               
        height: 100vh;
        background-size: cover;
    }

    .img-cover{
       position: absolute;
       height: 100%;
       width: 100%;
       background-color: rgba(0, 0, 0, 0.7);                                                                 
       z-index:1;
    }

    .img .content{
         position: absolute;
         top:50%;
         left:50%;
         transform: translate(-50%, -50%);                                                                   
         font-size:5rem;
         color: white;
         z-index: 2;
         text-align: center;
    }
</style>
<style>
						div.button
				{
				   margin: auto;
				   width: 50%;
				}
				div.button input
				{
				border:1x solid #ff0080;    /*---테두리 정의---*/
				background-Color:#ffe6f2;   /*--백그라운드 정의---*/
				font:12px 굴림;      /*--폰트 정의---*/
				font-weight:bold;   /*--폰트 굵기---*/
				color:#ff0080;    /*--폰트 색깔---*/
				width:130;height:30;  /*--버튼 크기---*/	
				   padding: 5px;
				   width: 45%;
				   font-size: 18px;
				}
				</style>
	<center>
	<div class="img">
        <div class="content">
            <h2>망고플레이트 관리자</h2>
        </div>
        <div class="img-cover"></div>
    </div>
	</center>
<body>
		<center>
	<form action="insertRestaurants.do" method="post">
		<div style="height:100%; background-color: #FF7100">
			<table>
				<tr>
					<td>카테고리:</td>
					<td><input type="text" name="category"  size="50"></td>
				</tr>
				<tr>
					<td>가게이름:</td>
					<td><input type="text" name="R_name"  size="50"></td>
				</tr>
				<tr>
					<td>주소:</td>
					<td><input type="text" name="addr"  size="50"></td>
				</tr>
				<tr>
					<td>전화번호:</td>
					<td><input type="text" name="tel"   size="50"></td>
				</tr>
				<tr>
					<td>음식종류:</td>
					<td><input type="text" name="kind"  size="50"></td>
				</tr>
				<tr>
					<td>오픈시간:</td>
					<td><input type="text" name="open_time"  size="50"></td>
				</tr>
				<tr>
					<td>휴일:</td>
					<td><input type="text" name="holiday"  size="50"></td>
				</tr>
				</center>
				
			</table>
			<tr>
				<div class="button">
				   <input type="submit" value="맛집입력">
				</div>
			</tr>
	</div>
		</form>
</body>
</html>