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
		<button type="button" name="${a}" value="${a}">${a}</button>
		<jsp:include page="movieList.jsp"></jsp:include>
	</c:forEach>
	<c:forEach var="b" items="${bList }">
		<button type="button" name="${b}" value="${b}">${b}</button>
		<jsp:include page="movieList.jsp"></jsp:include>
	</c:forEach>
	<c:forEach var="c" items="${cList }">
		<button type="button" name="${c}" value="${c}">${c}</button>
		<jsp:include page="movieList.jsp"></jsp:include>
	</c:forEach>
	<c:forEach var="d" items="${dList }">
		<button type="button" name="${d}" value="${d}">${d}</button>
		<jsp:include page="movieList.jsp"></jsp:include>
	</c:forEach>
	<c:forEach var="e" items="${eList }">
		<button type="button" name="${e}" value="${e}">${e}</button>
		<jsp:include page="movieList.jsp"></jsp:include>
	</c:forEach>
</body>
</html>