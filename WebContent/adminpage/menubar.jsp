<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="adminpage/astyle.css">
</head>
<body>
	<center>
		<br>
			<a href="Amovielist.do">
				<button>��ȭ����Ʈ</button>
			</a>			
			<a href="reservelist.do">
				<button>������</button>
			</a>		
		<div>
		<br>
			<jsp:include page="${jsp2 }"></jsp:include>
		</div>
	</center>
</body>
</html>