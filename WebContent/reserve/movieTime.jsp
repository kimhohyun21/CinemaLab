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
	<div align="center">
		<p id="theaterNo">${theaterNo2 } 관</p>
		<c:forEach var="vo" items="${timeList }">
			<a href="reserve2.do?year=${year }&month=${month }&checkedDay=${checkedDay}
			&checkedDay2=${checkedDay2}&local=${local }&tname=${tname }&grade=${grade }&title=${title}
			&theaterNo=${theaterNo2}&movietime=${vo.movietime}">
				<p id="movietime">${vo.movietime }</p>
			</a>
		</c:forEach>
	</div>
</body>
</html>