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
		var regExpPw = /^[a-zA-z0-9]{8,20}$/;	//비밀번호는 영어 소/대문자와 숫자로 8~20글자
		var regExpnickname = /[a-zA-Z0-9가-힣]{2,10}$/; //이름은 한글만
		var regExpEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var form = document.register_form;
		if (!regExpId.test(form.id.value)) {
			alert("아이디는 영어와 숫자만 사용하여 8~14글자를 입력해주세요!");
			form.id.select();
			return;
		}
		if (form.pw2.value != form.pw.value) {
			alert("비밀번호가 서로 다릅니다!");
			form.pw2.select();
			return;
		}
		if (!regExpPw.test(form.pw.value)) {
			alert("비밀번호는 영어와 숫자만 사용하여 8~20글자를 입력해주세요!");
			form.password.select();
			return;
		}
		if (!regExpnickname.test(form.nickname.value)) {
			alert("닉네임에는 특수문자가 들어갈 수 없고, 2~10글자로 입력해주세요!");
			form.nickname.select();
			return;
		}
		if (!regExpEmail.test(form.email.value)){
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
				회원가입</font></b> <br> <br>

		<form action="registerEnd.jsp" name="register_form" method="post">
			<table align="center">
				<tr>
					<td id="title">아이디</td>
					<td><input type="text" name="id" maxlength="20" size="34" autofocus>
				</tr>

				<tr>
					<td id="title">비밀번호</td>
					<td><input type="password" name="pw" maxlength="15"
						size="34"></td>
				</tr>

				<tr>
					<td id="title">비밀번호 확인</td>
					<td><input type="password" name="pw2" maxlength="15"
						size="34"></td>
				</tr>

				<tr>
					<td id="title">닉네임</td>
					<td><input type="text" name="nickname" maxlength="40" size="34"></td>
				</tr>
				<tr>
					<td id="title">이메일</td>
					<td><input type="text" name="email" maxlength="34" size="34">
				</tr>
			</table>
			<br> <input type="button" value="가입" onclick="check()"/><br> <br>
			<input type="reset" value="초기화">
		</form>
	</div>
</body>
</html>