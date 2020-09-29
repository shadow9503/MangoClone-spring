<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
		String seq = request.getParameter("seq");
	%>
	<script type="text/javascript">
		alert("리뷰가 작성되었습니다.");
		location.href="restaurants.do?seq=" + <%=seq%>;
	</script>
</body>
</html>