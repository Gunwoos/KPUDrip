<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ page import="java.sql.*" %>
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
<script type="text/javascript">
	function check() {
		var form = document.modify2_form;
		
		var regExpPw = /^[a-zA-z0-9]{8,20}$/;	//비밀번호는 영어 소/대문자와 숫자로 8~20글자
		if (!regExpPw.test(form.password.value)) {
			alert("비밀번호는 영어와 숫자만 사용하여 8~20글자를 입력해주세요!");
			form.password.select();
			return;
		}
		
		form.submit();
	}
</script>
</head>

<body>
	<%
	String id=(String)session.getAttribute("id");
	String pw=(String)session.getAttribute("pw");
	String nickname=null;
	String email=null;
	Connection conn = null;
    String url="jdbc:mysql://localhost:3306/kpudrip?useSSL=false";
    String user="root";
    String dbpw ="1234";
    Class.forName("com.mysql.jdbc.Driver");
    conn=DriverManager.getConnection(url, user, dbpw);
   	request.setCharacterEncoding("utf-8");
    PreparedStatement pstmt = null;
    ResultSet rs=null;
    try{	//실제로 회원가입
    	String sql ="SELECT nickname, email FROM memberdata WHERE id='"+id+"' and pw='"+pw+"'";
    	pstmt=conn.prepareStatement(sql);
    	rs = pstmt.executeQuery(sql);
    	if(rs.next()==true)	{
    		nickname=rs.getString("nickname");
    		email=rs.getString("email");
    		session.setAttribute("nickname", nickname);
    		session.setAttribute("email", email);
    	}
    }catch(SQLException e){
    	out.println(e.getMessage());
    }finally{
    	if(rs!=null){
    		rs.close();
    	}
    	if(pstmt!=null)
    		pstmt.close();
    	if(conn!=null)
    		conn.close();
    }
	%>
	<!-- 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
	<div id="wrap">
		<br> <b><font size="6" color="gray" align="center">KPUdrip
				회원정보 수정</font></b> <br> <br>

		<form name="modify2_form" method="post">
			<table align="center">
				<tr>
					<td id="title">아이디</td>
					<td><input type="button" value="수정" onclick="location.href='modify_id.jsp'">
				</tr>

				<tr>
					<td id="title">비밀번호</td>
					<td><input type="button" value="수정" onclick="location.href='modify_pw.jsp'">
				</tr>

				<tr>
					<td id="title">닉네임</td>
					<td><input type="button" value="수정" onclick="location.href='modify_nickname.jsp'">
				</tr>
				<tr>
					<td id="title">이메일</td>
					<td><input type="button" value="수정" onclick="location.href='modify_email.jsp'">
				</tr>
			</table>
		</form>
		<input type="submit" value="홈으로 돌아가기" onclick="history.go(-2);">	
	</div>
</body>
</html>