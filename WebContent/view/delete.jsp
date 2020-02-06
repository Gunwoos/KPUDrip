<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>

<title>KPUdrip</title>
</head>
<script type="text/javascript">
	function check() {
		var regExpPw = /^[a-zA-z0-9]{8,20}$/;	//비밀번호는 영어 소/대문자와 숫자로 8~20글자
		var form = document.delete_form;
		if (form.pw2.value != form.pw1.value) {
			alert("비밀번호가 서로 다릅니다!");
			form.pw2.select();
			return;
		}
		if (!regExpPw.test(form.pw1.value)) {
			alert("비밀번호는 영어와 숫자만 사용하여 8~20글자를 입력해주세요!");
			return;
		}
		if(form.pw_real.value != form.pw1.value){
			
			return;
		}
		form.submit();
	}
</script>
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
<body>
	<%
		if(session.getAttribute("id")!=null){
			String pw = (String)session.getAttribute("pw");
		%>
		<!-- 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
	<div id="wrap">
		<br> <b><font size="6" color="gray" align="center">KPUdrip
				회원정보 삭제</font></b> <br> <br>
		<form action="deleteEnd.jsp" name="delete_form" method="post">
			<table align="center">
				<tr>
					<td id="title">비밀번호</td>
					<td><input type="password" name="pw1" maxlength="15"
						size="34"></td>
				</tr>
				<tr>
					<td id="title">비밀번호 확인</td>
					<td><input type="password" name="pw2" maxlength="15"
						size="34"></td>
				</tr>
			</table>
			<br> <input type="button" value="삭제" onclick="check()"/><br> <br>
			<input type="reset" value="초기화">
			<input type="hidden" name="pw_real" value="<%out.print(pw);%>">
		</form>
	</div>
		<%
		}else{
			%>
			<b><font size="6" color="gray" align="center">로그인 상태가 아닙니다.</font></b>
					<br><input type="button" value="돌아가기" onclick="history.back(-1);">
			<%
		}
	%>
</body>
</html>