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
		var regExpId = /^[a-zA-Z0-9]{8,14}$/; //아이디는 영어 소/대문자와 숫자로 8~14글자
		var form = document.modify_form;
		if (!regExpId.test(form.id_after.value)) {
			alert("아이디는 영어와 숫자만 사용하여 8~14글자를 입력해주세요!");
			form.id.select();
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
					<td id="title">아이디</td>
					<td><input type="text" name="id_after" maxlength="20" size="34" autofocus>
				</tr>
			</table>
			<br> <input type="button" value="수정" onclick="check()"/><br> <br>
			<input type="reset" value="초기화">
		</form>
	</div>
</body>
</html>