<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
    <title>kpuDrip</title>
    
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
</head>
<script type="text/javascript">
	function check() {
		var form = document.login_form
		var regExpId = /^[a-zA-Z0-9]{8,14}$/; //아이디는 영어 소/대문자와 숫자로 8~14글자
		var regExpPw = /^[a-zA-z0-9]{8,20}$/;	//비밀번호는 영어 소/대문자와 숫자로 8~20글자
		if (!regExpId.test(form.id.value)) {
			alert("아이디는 영어와 숫자만 사용하여 8~14글자를 입력해주세요!");
			form.id.select();
			return;
		}
		if (!regExpPw.test(form.password.value)) {
			alert("비밀번호는 영어와 숫자만 사용하여 8~20글자를 입력해주세요!");
			form.password.select();
			return;
		}
		form.submit();
	}
</script>
<body>
<%
	String id=(String)session.getAttribute("id");
	if(id==null){
		%>
		<!-- 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
    <div id="wrap">
        <br>
        <b><font size="6" color="gray" align="center">KPUdrip 로그인</font></b>
        <br><br>
        
        <form action="loginEnd.jsp" name="login_form" method="post">
           <table align="center">
                <tr>
                    <td id="title">아이디</td>
                    <td>
                        <input type="text" name="id" maxlength="20" autofocus>  
                    </td>
                </tr>
                        
                <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        <input type="password" name="pw" maxlength="15" size="20">
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" value="로그인" onclick="check()"/>
            <br>
        </form>
        <form action="tos_first.jsp" method="post">
        	<b><font size="2" color="black" align="center">아이디가 없으십니까?</font></b>
            <input type="submit" value="회원가입" action="register.jsp"/>
        </form>
    </div>
		<%
	}else{
		%>
		<div id="wrap">
			<b><font size="6" color="black" align="center">로그인 중입니다!</font></b>
		</div>
		<%
	}
%>
    
</body>
</html>