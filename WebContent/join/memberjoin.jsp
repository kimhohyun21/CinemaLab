<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="join/style3.css">
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
  window.onload=function(){	
	 <%
		HttpSession abc=request.getSession(); 
		abc.removeAttribute("ok");
		abc.removeAttribute("join");
	%>
} 
function send(){
	 var f=document.frm;
	 var pwd=f.pwd.value;
	var pwdCheck=f.pwd_check.value;
 	var eng=/^[0-9 a-z A-Z]*$/;
	 if (!eng.test(f.id.value) ){
	     alert("���̵�� ���� �� ���ڸ� �Է� �� �� �ֽ��ϴ�. \n ex) HoHyunMansae");
	     f.id.focus();
	     return;
	}	 
	 if(f.id.value==""){
		alert("ID�� �Է��ϼ���");
		f.id.focus();
		return;
	}	 
	 var kor=/^[a-z A-Z ��-��]*$/;
	 if (!kor.test(f.name.value) ){
	     alert("�̸��� Ư������,���ڴ� �Է� �� �� �����ϴ�. \n ex) HoHyunMansae");
	     f.name.focus();
	     return;
	}
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
	if(f.pwd_check.value==""){
		alert("��й�ȣ�� �ѹ� �� �Է��ϼ���");
		f.pwd_check.focus();
		return;
	}
	if(f.phone.value==""){
		alert("��ȭ��ȣ�� �Է��ϼ���");
		f.content.focus();
		return;
	}
	if(pwd!=pwdCheck){
		alert("��й�ȣ�� ���� �ʽ��ϴ�");
		return;
	}
	 var number = /[^0-9]/;
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
	   } 	
	 var $vvvv="${vvvv }";	   
	 if($vvvv == "üũ�Ϸ�"){
	 		alert("�ߺ�üũ�� ���ּ���") 
	 		return;
	  }
	f.submit();
}

function checkID(){
	var f=document.frm;
	var id=f.id.value;
	var $ok="${ok}"
	var eng=/^[0-9 a-z A-Z]*$/;
	
	 if(!eng.test(f.id.value)){
	     alert("���̵�� ��� �Է� �� �� �ֽ��ϴ�. \n ex) HoHyunMansae");
	     f.id.focus();
	     return;
	}	 
	if(id==""){
		alert("ID�� �Է����ּ���");
		f.id.focus();
		return;
	}
	location.href="idOverlab.do?id="+id; 
}

function enter(){
	if(window.event.keyCode == 13){
		send();
	}
}
function NORTHFACE(){
	if(window.event.keyCode == 32){
		alert("������ ����� �Ұ����մϴ�");
		event.returnValue=false;
	}
}
</script>	
</head>
<body>
	<center>
		<form action="join_ok.do" method="post" name="frm">
			<table id="join_table" width="450" height="400">
				<tr>
					<td align="right">
						<b class="fc">ID : </b>
					</td>
					<td>
						<input type="text" class="id" id="id" placeholder="��� ��밡��" name="id" value="${overCheckId }" size="30" onkeydown="NORTHFACE()">					
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<input type="button" value="�ߺ�Ȯ��" onclick="checkID()" class="btn" >
					</td>
				</tr>
				<tr>
					<td align="right">
						<b class="fc">�̸� : </b>
					</td>
					<td>
						<input type="text" placeholder="�̸�" name="name" onkeydown="NORTHFACE()">
					</td>
				</tr>
				<tr>
					<td align="right">
						<b class="fc">��й�ȣ : </b>
					</td>
					<td>
						<input type="password" placeholder="��й�ȣ" name="pwd" onkeydown="NORTHFACE()">
					</td>
				</tr>			
				<tr>
					<td align="right">
						<b class="fc">��� Ȯ�� : </b>
					</td>
					<td>
						<input type="password" placeholder="��й�ȣ Ȯ��" name="pwd_check">
					</td>
				</tr>
				<tr>
					<td align="right">
						<b class="fc">������� : </b>
					</td>
					<td>
						<input type="text" placeholder="�������" name="birth">				
					</td>
				</tr>
				<tr>
					<td align="right">
						<b class="fc">��ȭ��ȣ : </b>
					</td>
					<td>
						<input type="text" placeholder="��ȭ��ȣ '-'�� ���� ���ּ���" name="phone" 
						id="phone" onkeyup="enter()">			
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input id="button" type="button" value="ȸ������" onclick="send()" 
						class="btn"><br/>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">					
						<input id="button" type="button" value="���" onclick="javascript:location.href='main.do'" class="btn">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>