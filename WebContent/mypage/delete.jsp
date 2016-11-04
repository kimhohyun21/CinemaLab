<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="sliderengine/jquery.js"></script>
<script type="text/javascript">
function send(){
	var f = document.frm;
	if(f.pwd.value==""){
		alert("비밀번호를 입력해주세요");
		return;
	}
	
	f.submit();
}
</script>
</head>
<body>
	<center>
		<form name="frm" method="post" action="delete_ok.do?no=${mvo.no }">
			비밀번호 : <input type="password" name="pwd"><br/>
			<input type="button" onclick="send()" value="삭제"><br/>			
		</form>
	</center>
</body>
</html>