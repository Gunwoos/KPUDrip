<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<html>
<head>
<title>kpuDrip</title>
</head>
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
	<!-- 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->

	<%
		Connection conn = null;
		String url = "jdbc:mysql://localhost:3306/kpudrip?useSSL=false";
		String user = "root";
		String dbpw = "1234";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, dbpw);
		request.setCharacterEncoding("utf-8");
		String id = (String)session.getAttribute("id");
		String pw = (String)session.getAttribute("pw");
		Statement stmt = null;
		ResultSet rs = null;
		session.invalidate();
		try { //실제로 회원가입
			String sql = "SELECT id, pw FROM memberdata WHERE id='" + id + "' and pw='" + pw + "'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next() == true) {
				sql = "delete from memberdata where id='" + id + "' and pw='" + pw + "'";
				stmt.executeUpdate(sql);
	%>
	<div id="wrap">
		<form action="home.jsp" method="post">
			<br> <b><font size="6" color="gray" align="center">아이디
					삭제 완료!</font></b> <br> <input type="submit" value="홈으로 돌아가기">
		</form>
	</div>
	<%
		}
		} catch (SQLException e) {
			out.println(e.getMessage());
		} finally {
			
			if (rs != null) {
				rs.close();
			}
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
	%>
</body>
</html>