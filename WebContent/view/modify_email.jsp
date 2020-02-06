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
		var regExpEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var form = document.modify_form;
		if (!regExpEmail.test(form.email_after.value)){
			alert("이메일의 형식과 맞지 않습니다. 다시 확인해주세요!");
			form.email.select();
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
					<td id="title">이메일</td>
					<td><input type="text" name="email_after" maxlength="34" size="34">
				</tr>
			</table>
			<br> <input type="button" value="수정" onclick="check()"/><br> <br>
			<input type="reset" value="초기화">
		</form>
	</div>
</body>
</html>