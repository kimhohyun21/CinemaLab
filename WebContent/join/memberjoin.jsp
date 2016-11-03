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
 	var eng=/^[0-9 a-z A-Z]*$/;
	 if (!eng.test(f.id.value) ){
	     alert("아이디는 영어 및 숫자만 입력 할 수 있습니다. \n ex) HoHyunMansae");
	     f.id.focus();
	     return;
	}	 
	 if(f.id.value==""){
		alert("ID를 입력하세요");
		f.id.focus();
		return;
	}
	 var eng=/^[a-z A-Z ㄱ-ㅎ]*$/;
	 if (!eng.test(f.name.value) ){
	     alert("이름에 특수문자,숫자는 입력 할 수 없습니다. \n ex) HoHyunMansae");
	     f.name.focus();
	     return;
	}
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
	if(f.pwd_check.value==""){
		alert("비밀번호를 한번 더 입력하세요");
		f.pwd_check.focus();
		return;
	}
	if(f.phone.value==""){
		alert("전화번호를 입력하세요");
		f.content.focus();
		return;
	}
	if(pwd!=pwdCheck){
		alert("비밀번호가 맞지 않습니다");
		return;
	}
	 var number = /[^0-9]/;
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
	   }  	var $ok="${ok }";
	   console.log($ok);
	 if($ok != '사용가능한 ID입니다 ^^'){
	 		alert("중복체크를 해주세요") 
	 		return;
	  }
	f.submit();
}
function checkID(){
	var f=document.frm;
	var id=f.id.value;
	var $ok="${ok}"
	var eng=/^[0-9 a-z A-Z]*$/;
	 if (!eng.test(f.id.value) ){
	     alert("아이디는 영어만 입력 할 수 있습니다. \n ex) HoHyunMansae");
	     f.id.focus();
	     return;
	}	 
	if($ok=="사용가능한 ID입니다 ^^"){
		alert("사용가능한 ID입니다")
		return;
	}
	if(id==""){
		alert("ID를 입력해주세요");
		f.id.focus();
	}
	location.href="idOverlab.do?id="+id;
}
</script>	
</head>
<body>
	<center>
		<form action="join_ok.do" method="post" name="frm">
			<table id="join_table" width="450" height="300">
				<tr>
					<td align="center">
						<b>ID : </b><input type="text" class="id" placeholder="영어만 사용가능" name="id" value="${overCheckId }">
						<input type="button" value="중복확인" onclick="checkID()" class="btn"><br/>
						${ok }										
					</td>
				</tr>				
				<tr>
					<td align="center">
						<b>이름 : </b><input type="text" placeholder="이름" name="name">										
					</td>
				</tr>
				<tr>
					<td align="center">
						<b>비밀번호 : </b><input type="password" placeholder="비밀번호" name="pwd">
					</td>
				</tr>			
				<tr>
					<td align="center">
						<b>비번 확인 : </b><input type="password" placeholder="비밀번호 확인" name="pwd_check">
					</td>
				</tr>
				<tr>
					<td align="center">
						<input type="text" placeholder="생년월일" name="birth">				
					</td>
				</tr>
				<tr>
					<td align="center">
						<input type="text" placeholder="전화번호 '-'는 빼고 써주세요" name="phone" id="phone">			
					</td>
				</tr>
			</table>
		</form>		
		<input id="button" type="button" value="회원가입" onclick="send()" width="300" class="btn"><br/>					
		<input id="button" type="button" value="뒤로" onclick="javascript:history.back()" width="300" class="btn">
	</center>
</body>
</html>