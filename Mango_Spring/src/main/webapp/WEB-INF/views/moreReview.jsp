<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
			
	</script>
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
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
	
</body>
</html>