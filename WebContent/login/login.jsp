<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
	<c:if test="${join == '���Լ���' }">
		<script type="text/javascript">
			alert("ȸ�������� �Ϸ�Ǿ����ϴ�")
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
				<input type="password" placeholder="PW" name="pwd" id="sinput">
			</div>
			<div id="find">
				<a href="searchId.do">���̵� ã��</a>&nbsp;&nbsp;&nbsp;
				<a href="searchPwd.do">��й�ȣ ã��</a>
			</div>
			<input type="button" value="�α���" onclick="login()"
				style="width: 55px;height: 25px;">
			<input id="button" type="button" value="�ڷ�" onclick="javascript:history.back()"
				style="width: 55px;height: 25px;">	
		</form>
	</div>
</body>
</html>