<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="mypage/style.css">
<script src="sliderengine/jquery.js"></script>
<script type="text/javascript">
function send(){
	var f = document.frm;
	if(f.pwd.value==""){
		alert("���� ��й�ȣ�� �Է����ּ���");
		f.pwd.focus();
		return;
	}//��й�ȣ üũ �Ұ�	
	if(f.change_pwd.value==""){
		alert("�ٲٽ� ��й�ȣ�� �Է����ּ���");
		f.change_pwd.focus();
		return;
	}
	if(f.check_pwd.value==""){
		alert("��й�ȣ�� �ѹ� �� �Է����ּ���");
		f.check_pwd.focus();
		return;
	}	
	f.submit();
}
</script>
</head>
<body>
	<center>
		<form method="post" action="changepwd_ok.do?no=${mvo.no }" name="frm">
			���� ��й�ȣ:<input type="password" name="pwd"><br>
			�ٲ� ��й�ȣ:<input type="password" name="change_pwd"><br>
			��й�ȣ Ȯ��:<input type="password" name="check_pwd"><br>
			<input type="button" onclick="send()" value="����" class="btn">
			<input type="button" onclick="javascript:hitory.back()" value="�ڷ�" class="btn">			
		</form>
	</center>
</body>
</html>