<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@page import="java.sql.*"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="KPUdrip.com.SMTPAuthenticatior"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
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
	<!-- 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->

	<%
		Connection conn = null;
		String url = "jdbc:mysql://localhost:3306/kpudrip";
		String user = "root";
		String dbpw = "1234";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, dbpw);
		request.setCharacterEncoding("utf-8");
		String email = request.getParameter("email");
		Statement stmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT id, pw FROM memberdata WHERE email='" + email + "'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next() == true) {// 이메일있으면 보내기
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				//여기서부터 메일보내기
				Properties p = new Properties(); // 정보를 담을 객체
				
				p.put("mail.smtp.starttls.enable", "true");    
		        p.put("mail.smtp.host", "smtp.gmail.com");      // smtp 서버 호스트
		        p.put("mail.smtp.auth","true");
		        p.put("mail.smtp.port", "587");

				try{
				    Authenticator auth = new SMTPAuthenticatior();
				    Session ses = Session.getInstance(p, auth);
				    ses.setDebug(true);
				    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체 
				 
				    msg.setFrom(new InternetAddress(user));

		            //수신자메일주소
		            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email)); 
		            // Subject
		            msg.setSubject("KPUdrip 아이디 / 비밀번호 찾기 결과입니다!"); //메일 제목을 입력

		            // Text
		            msg.setText("아이디 : "+id+" / 비밀번호 : "+pw);    //메일 내용을 입력

		            // send the message
		            Transport.send(msg); ////전송
				} catch(Exception e){
				    e.printStackTrace();
				}
	%>
	<div id="wrap">
		<br> <b><font size="6" color="gray" align="center">메일을
				보내었습니다!</font></b> <br>
		<form action="home.jsp">
			<input type="submit" value="홈으로 돌아가기">
		</form>
	</div>
	<%
		} else {//가입된 이메일 없음.
	%>
	<div id="wrap">
		<br> <b><font size="6" color="gray" align="center">가입하지 않은 이메일입니다!</font></b> <br>
		<form action="home.jsp">
			<input type="submit" value="홈으로 돌아가기">
		</form>
	</div>
	<%
		}
		} catch (SQLException e) {
			out.println("실패 : " + email);
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