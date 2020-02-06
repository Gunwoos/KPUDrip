<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<title>KPUdrip</title>
</head>
<body>
	<%
		if(session.getAttribute("id")!=null){
		session.invalidate();
		response.sendRedirect("home.jsp");
		}else{
			%>
			<b><font size="6" color="gray" align="center">로그인 상태가 아닙니다.</font></b>
					<br><input type="button" value="돌아가기" onclick="history.back(-1);">
			<%
		}
	%>
</body>
</html>