<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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
	if(f.name.value==""){
		alert("이름을 입력하세요");
		f.name.focus();
		return;
	}
	var number = /[^0-9]/;
	 if (f.birth.value.search(number)!=-1 || f.birth.value.length != 8 || f.birth.value==""){
	        alert("생년월일은 숫자만 8자리 모두 입력해 주시기 바랍니다 "
	        		+"ex)20161018");	        
	        f.birth.focus();
	        return;
	   }
	 if (f.phone.value.search(number)!=-1 || f.phone.value.length == 0 ){
	        alert("전화번호는 숫자만 입력하실 수 있습니다 ex)01015771577");	        
	        f.phone.focus();
	        return;
	   }
	f.submit();  
}
</script>
</head>
<body>
	<center>
		<form action="find_id_ok.do" method="post" name="frm">
			<table id="join_table" width="450" height="500">
				<tr>
					<td align="center">
						<input type="text" placeholder="이름" name="name">
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
		
		<input id="button" type="button" value="찾기" onclick="send()" width="300"><br/>
		<input id="button" type="button" value="뒤로" onclick="javascript:history.back()" width="300">
	</center>
</body>
</html>