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
		alert("��й�ȣ�� �Է����ּ���");
		return;
	}
	
	f.submit();
}
</script>
</head>
<body>
	<center>
		<b style="color:red;">Ż���� ���̵�� ���� �� �� �����ϴ�</b>
		<form name="frm" method="post" action="delete_ok.do?no=${mvo.no }">
			��й�ȣ : <input type="password" name="pwd"><br/>
		<div>
			<input type="button" onclick="send()" value="����" class="btn">
		</div>
		</form>
	</center>
</body>
</html>