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
		var regExpnickname = /[a-zA-Z0-9가-힣]{2,10}$/; //이름은 한글만
		var form = document.modify_form;
		if (!regExpnickname.test(form.nickname_after.value)) {
			alert("닉네임에는 특수문자가 들어갈 수 없고, 2~10글자로 입력해주세요!");
			form.nickname.select();
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
					<td id="title">닉네임</td>
					<td><input type="text" name="nickname_after" maxlength="40" size="34"></td>
				</tr>
			</table>
			<br> <input type="button" value="수정" onclick="check()"/><br> <br>
			<input type="reset" value="초기화">
		</form>
	</div>
</body>
</html>