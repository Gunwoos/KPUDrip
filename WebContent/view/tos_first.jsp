<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<title>KPUdrip</title>
</head>
<body>
<%
	request.setAttribute("tos_agree1", "[필수] 이용약관에 동의 합니다.");
	request.setAttribute("tos_agree2", "[필수] 개인정보처리방침에 동의 합니다.");
	RequestDispatcher dispatcher =request.getRequestDispatcher("tos_second.jsp");
	dispatcher.forward(request, response);
%>
</body>
</html>