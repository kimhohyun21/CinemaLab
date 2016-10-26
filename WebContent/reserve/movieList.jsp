<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<c:forEach var="vo" items="${movieList }">
			<span>${vo.grade}</span>
			<a id="movieList" href="reserve.do?checkedDay=${checkedDay}&checkedDay2=${checkedDay2}&local=${local }&tname=${tname}&grade=${vo.grade }&title=${vo.title}&theaterNo=${theaterNo}&movietime=${movietime}">${vo.title}</a><br>
		</c:forEach>
	</center>
</body>
</html>