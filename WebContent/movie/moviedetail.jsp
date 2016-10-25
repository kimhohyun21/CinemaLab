<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>상세 보기</title>
</head>
<body>
	<div align="center">
		${vo.title }<br/>
		<iframe width="640" height="360" src="http://www.youtube.com/embed/${url }" frameborder="0" allowfullscreen/>
	</div>
</body>
</html>