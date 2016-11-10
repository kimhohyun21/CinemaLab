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
		<table border="1">
			<tr>
				<td>
					<a href="Amovielist.do">영화리스트</a>
				</td>
				<td>
					<a href="customer.do">고객센터</a>
				</td>
			</tr>
		</table>
		<div>
			<jsp:include page="${jsp2 }"></jsp:include>
		</div>
	</center>
</body>
</html>