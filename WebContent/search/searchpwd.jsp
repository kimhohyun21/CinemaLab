<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="search/style.css">
<script type="text/javascript">
function send(){
	 var f=document.frm;	
	if(f.name.value==""){
		alert("�̸��� �Է��ϼ���");
		f.name.focus();
		return;
	}
	if(f.id.value==""){
		alert("���̵� �Է��ϼ���");
		f.id.focus();
		return;
	}
	var number = /[^0-9]/;
	 if (f.phone.value.search(number)!=-1 || f.phone.value.length == 0 || f.phone.value.length != 11){
	       alert("��ȭ��ȣ�� ����� �Է����ּ���. \n��ȭ��ȣ�� ���ڸ� �Է��Ͻ� �� �ֽ��ϴ� \n ex)01015771577");
	       f.phone.focus();
	       return;
	}
	f.submit();  
}
</script>
</head>
<body>
	<center>		
		<form action="searchPwd_ok.do" method="post" id="frm">
			<table id="join_table" width="450" height="200">
				<tr>
					<td align="right">
						<b>�̸� :</b>
					</td>
					<td align="left">
						<input type="text" placeholder="�̸�" name="name">
					</td>
				</tr>
				<tr>
					<td align="right">
						<b>���̵� :</b>
					</td>
					<td align="left">
						<input type="text" placeholder="���̵�" name="id">
					</td>
				</tr>
				<tr>
					<td align="right">
						<b>��ȭ��ȣ :</b>
					</td>
					<td align="left">
						<input type="text" placeholder="��ȭ��ȣ" name="phone">
					</td>
				</tr>
			</table>
		</form>
		
		<input class="btn" id="btn1" type="button" value="ã��" onclick="send()"><br/>
		<input class="btn" type="button" value="�ڷ�" onclick="javascript:history.back()">
	</center>
</body>
</html>