<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>

<title>KPUdrip</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		Connection conn = null;
		String url = "jdbc:mysql://localhost:3306/kpudrip?useSSL=false";
		String user = "root";
		String dbpw = "1234";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, dbpw);
		request.setCharacterEncoding("utf-8");
		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email");
		Statement stmt = null;
		ResultSet rs = null;
		try{
			String sql = "SELECT id, pw FROM memberdata WHERE id='" + id + "' and pw='"+pw+"'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next() == true) {	//로그인 성공하기
					session.setAttribute("id", id);// 세션만들기
					session.setAttribute("pw", pw);
					session.setMaxInactiveInterval(60*60);
					response.sendRedirect("modify1.jsp");
				}else{
					%>
					<b><font size="6" color="gray" align="center">아이디 및 비밀번호가 틀렸습니다.</font></b>
					<br><input type="button" value="돌아가기" onclick="history.back(-1);">
					<%
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
	%>
</body>
</html>