<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<title>KPUdrip</title>
<script type="text/javascript">
	function check_form() {
		var form = document.modify1_form;
		var password = form.pw.value;
		var pw = form.pw1.value;
		var regExpPw = /^[a-zA-z0-9]{8,20}$/; //비밀번호는 영어 소/대문자와 숫자로 8~20글자
		if (!regExpPw.test(password)) {
			alert("비밀번호는 영어와 숫자만 사용하여 8~20글자를 입력해주세요!");
			form.password.select();
			return;
		}
		if (pw != password) {
			alert("비밀번호가 틀립니다");
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

</head>
<body>
	<%
		String id = "";
		String pw = "";
		id = (String) session.getAttribute("id");
		pw = (String) session.getAttribute("pw");
		if (id.equals("") == false || pw.equals("") == false) { //로그인해서 세션이 존재.
	%>
	<form action="modify2.jsp" name="modify1_form" method="post">
		<table align="center">
			<tr>
				<td id="title">비밀번호</td>
				<td><input type="password" name="pw" maxlength="15" size="30"
					placeholder="비밀번호를 다시 입력해주세요" ></td>
				<td><input type="button" value="수정" onclick="check_form()"/>
			</tr>
		</table>
		<input type="hidden" name="pw1" value="<%out.print(pw);%>">
	</form>
	<%
		} else {
	%>
	<b><font size="5" color="gray" align="center">현재 로그인 상태가
			아닙니다.</font></b>
	<input type="submit" value="돌아가기" onclick="history.back(-1);">
	<%
		}
	%>

</body>
</html>