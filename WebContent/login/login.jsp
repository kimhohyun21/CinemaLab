<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
	<c:if test="${join == '가입성공' }">
		<script type="text/javascript">
			alert("회원가입이 완료되었습니다")
		</script>
	</c:if>
<style type="text/css">
	#find a{
		color: gray;
		text-decoration: none;
	}
	#find a:HOVER {
		color: #CD426B;
	}
	form{
		padding-top:50px;
	}
	input{
		padding:0px;
		height: 35px;
		width: 200px;
		font-size: 10pt;
	}
	#sinput{
		margin-bottom: 10px;
	}
</style>
<script type="text/javascript">
function login(){
	var f=document.frm;	
	if(f.id.value==""){
		alert("아이디를 입력하세요");
		f.id.focus();
		return;
	}
	if(f.pwd.value==""){
		alert("비밀번호를 입력하세요");
		f.pwd.focus();
		return;
	}
	f.submit();
}
</script>
</head>
<body>
	<div align="center">		
		<form method="post" action="login_ok.do" name="frm">
			<div class="input">
				<input type="text" placeholder="ID" name="id">
			</div>
			<div class="input">
				<input type="password" placeholder="PW" name="pwd" id="sinput">
			</div>
			<div id="find">
				<a href="searchId.do">아이디 찾기</a>&nbsp;&nbsp;&nbsp;
				<a href="searchPwd.do">비밀번호 찾기</a>
			</div>
			<input type="button" value="로그인" onclick="login()"
				style="width: 55px;height: 25px;">
			<input id="button" type="button" value="뒤로" onclick="javascript:history.back()"
				style="width: 55px;height: 25px;">	
		</form>
	</div>
</body>
</html>