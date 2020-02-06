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
	function check(){
		var regExpEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var form=document.register_form;
		if (form.email.value =="") {
			alert("이메일을 입력해주세요!");
			form.name.select();
			return;
		}
		if (!regExpEmail.test(form.email.value)) {
			alert("이메일 형식이 잘못되었습니다!");
			form.name.select();
			return;
		}
		form.submit();
	}
</script>
<body>
    <!-- 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
    <div id="wrap">
        <br>
        <b><font size="6" color="gray" align="center">아이디 / 비밀번호 찾기</font></b>
        <br><br>
        
        <form action="findEnd.jsp" name="register_form" method="post">
           <table align="center">
                <tr>
                    <td id="email">이메일</td>
                    <td>
                        <input type="text" name="email" maxlength="20" autofocus>  
                    </td>
                </tr>
            </table>
            <p style="font-size: 17px; align="center">저장된 이메일로 아이디와 비밀번호를 보냅니다.</p>
            <br>
            <input type="button" value="찾기" onclick="check()"/>
        </form>
    </div>
</body>
</html>