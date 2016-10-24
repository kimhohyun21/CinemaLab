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
			<div>
				<input type="text" placeholder="ID" name="id">
			</div>
			<div>
				<input type="password" placeholder="PW" name="pwd">
			</div>
			<div id="find">
				<a href="find_id.do">아이디 찾기</a>&nbsp;&nbsp;&nbsp;
				<a href="find_pwd.do">비밀번호 찾기</a>
			</div>
			<input type="button" value="로그인" onclick="login()">
			<input id="button" type="button" value="뒤로" onclick="javascript:history.back()" width="300">
		</form>
	</div>
</body>
</html>