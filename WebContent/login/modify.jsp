<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="login/style3.css">
<script src="sliderengine/jquery.js"></script>
<style type="text/css">
	a{
	text-decoration: none;
	color: black;
}
	#button{	
	margin:10px;
}
	#join_table tr td input{
		margin:0px;
		padding:0px;
	}
</style>
<script type="text/javascript">
function send(){
	 var f=document.frm;	 
	 var pwd=f.pwd.value;
	var pwdCheck=f.pwd_check.value;
	 /*	
	if(f.name.value==""){
		alert("이름을 입력하세요");
		f.name.focus();
		return;
	}
	if(f.pwd.value==""){
		alert("비밀번호를 입력하세요");
		f.pwd.focus();
		return;
	}
	if(f.phone.value==""){
		alert("전화번호를 입력하세요");
		f.content.focus();
		return;
	}*/
	/* var number = /[^0-9]/;
	 if (f.birth.value.search(number)!=-1 || f.birth.value.length != 8 || f.birth.value==""){
	        alert("생년월일은 숫자만 8자리를 입력해 주시기 바랍니다 "
	        		+"\n ex)20161018");	        
	        f.birth.focus();
	        return;
	   }
	 if (f.phone.value.search(number)!=-1 || f.phone.value.length == 0 || f.phone.value.length != 11){
	        alert("전화번호를 제대로 입력해주세요. \n전화번호는 숫자만 입력하실 수 있습니다 \n ex)01015771577");
	        f.phone.focus();
	        return;
	   } */	  	
	f.submit();
}
</script>	
</head>
<body>
	<center>
		<form action="#" method="post" name="frm">
			<table id="delete_table" width="450" height="500">
				<tr>
					<td align="center">
						이름: <input type="text" placeholder="이름" name="name" value="${mvo.name }">										
					</td>
				</tr>				
				<tr>
					<td align="center">
						PW: <input type="password" placeholder="비밀번호" name="pwd">
					</td>
				</tr>
				<tr>
					<td align="center">
						생년월일: <input type="text" placeholder="생년월일" name="birth" value="${mvo.birth }">				
					</td>
				</tr>
				<tr>
					<td align="center">
						전화번호: <input type="text" placeholder="전화번호 '-'는 빼고 써주세요" name="phone" id="phone" value="${mvo.phone }">			
					</td>
				</tr>
			</table>
		</form>		
		<input id="button" type="button" value="수정" onclick="send()" width="300">&nbsp;&nbsp;&nbsp;					
		<input id="button" type="button" value="뒤로" onclick="javascript:history.back()" width="300">
	</center>
</body>
</html>