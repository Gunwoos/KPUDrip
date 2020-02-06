<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<title>약 관 동 의</title>
<style>
#wrap {
	width: 530px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}
table {
	border: 3px solid #A9BCF5
}

td {
	border: 1px solid #2EFEF7
}

#title {
	background-color: #9FF781
}
</style>
<script type="text/javascript">
	function check_all(){
		var form = document.tos_form;
		if(form.tos_1.checked==true && form.tos_2.checked==true){
			location.href='register.jsp';
		}else{
			alert("모든 약관에 동의해주세요!");
		}
	}
</script>
</head>
<body>
	<form name="tos_form" method="post">
		<jsp:include page="tos_put1.jsp"/>	<%-- 표준액션 --%>
		<input type="checkbox" name="tos_1">${tos_agree1}
		
		<%@taglib prefix="tos_put2" tagdir="/WEB-INF/tags" %>
		<tos_put2:tos_put2/>	<%-- 커스텀액션 --%>
		<input type="checkbox" name="tos_2">${tos_agree2}
		
	</form>
	<p align="center"><img src="login.png" width="50" height="50" alt="눌러서 가입하러 가기!" onclick="check_all()">
</body>
</html>