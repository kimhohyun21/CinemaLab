<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="a" items="${aList }">
		<%-- <button type="submit" name="tname" value="${a}">${a}</button> --%>
		<%-- <input type="hidden" name="tname" value="${a}">
		<input type="submit" value="${a}"> --%>
		<a href="reserve.do?local=${local }&tname=${a}">${a}</a>
	</c:forEach>
	<c:forEach var="b" items="${bList }">
		<a href="reserve.do?local=${local }&tname=${b}">${b}</a>
	</c:forEach>
	<c:forEach var="c" items="${cList }">
		<a href="reserve.do?local=${local }&tname=${c}">${c}</a>
	</c:forEach>
	<c:forEach var="d" items="${dList }">
		<a href="reserve.do?local=${local }&tname=${d}">${d}</a>
	</c:forEach>
	<c:forEach var="e" items="${eList }">
		<a href="reserve.do?local=${local }&tname=${e}">${a}</a>
	</c:forEach>
</body>
</html>