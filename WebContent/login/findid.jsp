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
		alert("�̸��� �Է��ϼ���");
		f.name.focus();
		return;
	}
	var number = /[^0-9]/;
	 if (f.birth.value.search(number)!=-1 || f.birth.value.length != 8 || f.birth.value==""){
	        alert("��������� ���ڸ� 8�ڸ� ��� �Է��� �ֽñ� �ٶ��ϴ� "
	        		+"ex)20161018");	        
	        f.birth.focus();
	        return;
	   }
	 if (f.phone.value.search(number)!=-1 || f.phone.value.length == 0 ){
	        alert("��ȭ��ȣ�� ���ڸ� �Է��Ͻ� �� �ֽ��ϴ� ex)01015771577");	        
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
						<input type="text" placeholder="�̸�" name="name">
					</td>
				</tr>
				<tr>
					<td align="center">
						<input type="text" placeholder="�������" name="birth">				
					</td>
				</tr>
				<tr>
					<td align="center">
						<input type="text" placeholder="��ȭ��ȣ '-'�� ���� ���ּ���" name="phone" id="phone">
					</td>
				</tr>
			</table>
		</form>
		
		<input id="button" type="button" value="ã��" onclick="send()" width="300"><br/>
		<input id="button" type="button" value="�ڷ�" onclick="javascript:history.back()" width="300">
	</center>
</body>
</html>