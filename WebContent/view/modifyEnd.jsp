<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
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
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id_before = (String) session.getAttribute("id");
		String id_after = (String) request.getParameter("id_after");
		String pw_after = (String) request.getParameter("pw_after");
		String nickname_after = (String) request.getParameter("nickname_after");
		String email_after = (String) request.getParameter("email_after");
		Connection conn = null;
		String url = "jdbc:mysql://localhost:3306/kpudrip?useSSL=false"; //
		String user = "root";
		String dbpw = "1234";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, dbpw);
		request.setCharacterEncoding("utf-8");
		PreparedStatement pstmt = null;
		try { //실제로 회원가입
			String sql;
			if (id_after != null) {//아이디변경을 위한 sql
				sql = "update memberdata set id= ? where id= ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id_after);
				pstmt.setString(2, id_before);
				session.removeAttribute("id");
				session.setAttribute("id", id_after);
				session.setMaxInactiveInterval(60*60);
			}
			if (pw_after != null) {
				sql = "update memberdata set pw= ? where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, pw_after);
				pstmt.setString(2, id_before);
				session.removeAttribute("pw");
				session.setAttribute("pw", pw_after);
				session.setMaxInactiveInterval(60*60);
			}
			if (nickname_after != null) {
				sql = "update memberdata set nickname= ? where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, nickname_after);
				pstmt.setString(2, id_before);
			}
			if (email_after != null) {
				sql = "update memberdata set email= ? where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, email_after);
				pstmt.setString(2, id_before);
			}
			pstmt.executeUpdate();
		} catch (SQLException e) {
			out.println(e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
	%>
	<b><font size="6" color="gray" align="center">회원정보 수정 성공!</font></b>
	<br>
	<input type="button" value="계속 수정하기" onclick="history.go(-2);">
	<br>
	<form action="home.jsp" method="post">
		<br><input type="submit" value="홈으로 돌아가기">
	</form>
	</form>
	<%
		}
	%>

</body>
</html>