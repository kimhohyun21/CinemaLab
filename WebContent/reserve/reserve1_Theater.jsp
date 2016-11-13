<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Reserve1 Theater</title>
</head>
<body>
	<center>
		<c:forEach var="vo" items="${theaterList}">
			<a href="reserve.do?year=${year }&month=${month }&checkedDay=${checkedDay}
			&checkedDay2=${checkedDay2}&local=${local }&tname=${vo.theater}&grade=${grade }&title=${title}
			&theaterNo=${theaterNo}&movietime=${movietime}">
				<p id="theater">${vo.theater}</p>
			</a>
		</c:forEach>
	</center>
</body>
</html>