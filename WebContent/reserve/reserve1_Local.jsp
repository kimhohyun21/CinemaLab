<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Reserve1 Local</title>
</head>
<body>
	<div align="center">
		<c:forEach var="vo" items="${localList }">
			<a	href="reserve.do?year=${year }&month=${month }&checkedDay=${checkedDay}
				&checkedDay2=${checkedDay2}&local=${vo.local}&tname=${tname }&grade=${grade }&title=${title}
				&theaterNo=${theaterNo}&movietime=${movietime}">
				<p id="local">${vo.local }</p>
			</a>
			<br>
		</c:forEach>
	</div>
</body>
</html>