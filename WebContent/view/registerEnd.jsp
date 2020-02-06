<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.sql.*" %>
<html>
<head>
    <title>kpuDrip</title>

</head>
    <style>
        #wrap{
            width:530px;
            margin-left:auto; 
            margin-right:auto;
            text-align:center;
        }
        table{
            border:3px solid #A9BCF5
        }
        
        td{
            border:1px solid #2EFEF7
        }
        
        #title{
            background-color:#9FF781
        }
    </style>
<body>
    <!-- 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
    
    <%
    Connection conn = null;
    String url="jdbc:mysql://localhost:3306/kpudrip";
    String user="root";
    String dbpw ="1234";
    Class.forName("com.mysql.jdbc.Driver");
    conn=DriverManager.getConnection(url, user, dbpw);
   	request.setCharacterEncoding("utf-8");
    String id=request.getParameter("id");
    String pw=request.getParameter("pw");
    String nickname=request.getParameter("nickname");
    String email=request.getParameter("email");
    Statement stmt = null;
    ResultSet rs=null;
    try{	//실제로 회원가입
    	String sql ="SELECT email FROM memberdata WHERE email='"+email+"'";
    	stmt=conn.createStatement();
    	rs = stmt.executeQuery(sql);
    	if(rs.next()==true)	{
	%>
    		<div id="wrap">
            <br>
            <b><font size="6" color="gray" align="center">회원가입 실패!</font></b>
            <br>
            <b><font size="3" color="gray" align="center">이미 사용된 이메일입니다...</font></b>
            <br>
            <br>
            	<input type="submit" value="회원가입으로 돌아가기" onclick="history.back(-1);">	
        </div>
	<%
    	}else{
    		sql ="INSERT INTO memberdata(id, pw, nickname, email) VALUES('"+id+"','"+pw+"','"+nickname+"','"+email+"')";
        	stmt.executeUpdate(sql);
    		%>
    		<div id="wrap">
            <br>
            <b><font size="6" color="gray" align="center">회원가입 성공!</font></b>
            <br>
            <b><font size="3" color="gray" align="center"><%=nickname %>님 축하드립니다.</font></b>
            <br>
            <form action="">
            <input type="submit" value="홈으로 돌아가기"></form>
        </div>
	<%
    	}
    }catch(SQLException e){
    	out.println("실패 : "+id+" / "+pw+" / "+nickname+" / "+email);
    	out.println(e.getMessage());
    }finally{
    	if(rs!=null){
    		rs.close();
    	}
    	if(stmt!=null)
    		stmt.close();
    	if(conn!=null)
    		conn.close();
    }
    %>
</body>
</html>