<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="login/style3.css">
	<c:if test="${join == '���Լ���' }">
		<script type="text/javascript">
			alert("ȸ�������� �Ϸ�Ǿ����ϴ�");
		</script>
	</c:if>
<script type="text/javascript">
function login(){
	var f=document.frm;	
	if(f.id.value==""){
		alert("���̵� �Է��ϼ���");
		f.id.focus();
		return;
	}
	if(f.pwd.value==""){
		alert("��й�ȣ�� �Է��ϼ���");
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
				<input type="password" placeholder="PW" name="pwd" id="pwd">
			</div>
			<div id="find">
				<a href="searchId.do">���̵� ã��</a>&nbsp;&nbsp;&nbsp;
				<a href="searchPwd.do">��й�ȣ ã��</a>
			</div>
		<table height="100">
			<tr>
				<td>
					<input type="button" value="�α���" onclick="login()"
						class="btn">
				</td>
			</tr>
			<tr>
				<td>
					<input id="button" type="button" value="�ڷ�" onclick="javascript:history.back()"
						class="btn">
				</td>
			</tr>
		</table>	
		</form>
	</div>
</body>
</html>