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
		alert("�̸��� �Է��ϼ���");
		f.name.focus();
		return;
	}
	if(f.pwd.value==""){
		alert("��й�ȣ�� �Է��ϼ���");
		f.pwd.focus();
		return;
	}
	if(f.phone.value==""){
		alert("��ȭ��ȣ�� �Է��ϼ���");
		f.content.focus();
		return;
	}*/
	/* var number = /[^0-9]/;
	 if (f.birth.value.search(number)!=-1 || f.birth.value.length != 8 || f.birth.value==""){
	        alert("��������� ���ڸ� 8�ڸ��� �Է��� �ֽñ� �ٶ��ϴ� "
	        		+"\n ex)20161018");	        
	        f.birth.focus();
	        return;
	   }
	 if (f.phone.value.search(number)!=-1 || f.phone.value.length == 0 || f.phone.value.length != 11){
	        alert("��ȭ��ȣ�� ����� �Է����ּ���. \n��ȭ��ȣ�� ���ڸ� �Է��Ͻ� �� �ֽ��ϴ� \n ex)01015771577");
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
						�̸�: <input type="text" placeholder="�̸�" name="name" value="${mvo.name }">										
					</td>
				</tr>				
				<tr>
					<td align="center">
						PW: <input type="password" placeholder="��й�ȣ" name="pwd">
					</td>
				</tr>
				<tr>
					<td align="center">
						�������: <input type="text" placeholder="�������" name="birth" value="${mvo.birth }">				
					</td>
				</tr>
				<tr>
					<td align="center">
						��ȭ��ȣ: <input type="text" placeholder="��ȭ��ȣ '-'�� ���� ���ּ���" name="phone" id="phone" value="${mvo.phone }">			
					</td>
				</tr>
			</table>
		</form>		
		<input id="button" type="button" value="����" onclick="send()" width="300">&nbsp;&nbsp;&nbsp;					
		<input id="button" type="button" value="�ڷ�" onclick="javascript:history.back()" width="300">
	</center>
</body>
</html>