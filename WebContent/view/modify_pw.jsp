<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<title>kpuDrip</title>

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
</head>
<script type="text/javascript">
	function check() {
		var regExpPw = /^[a-zA-z0-9]{8,20}$/;	//비밀번호는 영어 소/대문자와 숫자로 8~20글자
		var form = document.modify_form;
		if (form.pw2.value != form.pw_after.value) {
			alert("비밀번호가 서로 다릅니다!");
			form.pw2.select();
			return;
		}
		if (!regExpPw.test(form.pw_after.value)) {
			alert("비밀번호는 영어와 숫자만 사용하여 8~20글자를 입력해주세요!");
			form.password.select();
			return;
		}
		form.submit();
	}
</script>
<body>

	<!-- 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
	<div id="wrap">
		<br> <b><font size="6" color="gray" align="center">KPUdrip
				회원정보 수정</font></b> <br> <br>
		<form action="modifyEnd.jsp" name="modify_form" method="post">
			<table align="center">
				<tr>
					<td id="title">비밀번호</td>
					<td><input type="password" name="pw_after" maxlength="15"
						size="34"></td>
				</tr>
				<tr>
					<td id="title">비밀번호 확인</td>
					<td><input type="password" name="pw2" maxlength="15"
						size="34"></td>
				</tr>
			</table>
			<br> <input type="button" value="수정" onclick="check()"/><br> <br>
			<input type="reset" value="초기화">
		</form>
	</div>
</body>
</html>