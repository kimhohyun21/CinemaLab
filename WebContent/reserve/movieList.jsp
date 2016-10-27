<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="reserve/style.css">
</head>
<body>
	<div id="movieList">
		<c:forEach var="vo" items="${movieList }">
			<c:if test="${vo.grade=='0'}">
				<img src="image/bg_grade_all.png">
			</c:if>
			<c:if test="${vo.grade=='12'}">
				<img src="image/bg_grade_12.png">
			</c:if>
			<c:if test="${vo.grade=='15'}">
				<img src="image/bg_grade_15.png">
			</c:if>
			<c:if test="${vo.grade=='18'}">
				<img src="image/bg_grade_18.png">
			</c:if>
			<a href="reserve.do?checkedDay=${checkedDay}&checkedDay2=${checkedDay2}&local=${local }
			&tname=${tname}&grade=${vo.grade }&title=${vo.title}&theaterNo=${theaterNo}&movietime=${movietime}">${vo.title}</a><br><br>
		</c:forEach>
	</div>
</body>
</html>