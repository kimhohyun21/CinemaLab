<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>작성 결과</title>
</head>
<body>
	<div class=screen>
		<Strong class=screen-title>
			SCREEN
		</strong>
	</div>
	<div class="seat" align="center">
    <c:forEach var="sa" begin="0" end="10" items="a,b,c,d,e,f,g,h,i,j">
    	<div class="line" align="center">
	  		<ul>
	  		<li style="border: 0px; font: 10pt normal bold; background-color: #dbf0ff;">${sa }</li>		  		
			<c:forEach var="b" begin="1" end="20">
				<li><a href="reserve2.do?seat=${sa }${b }">${b }</a></li>
			<c:if test="${b==4 || b==16}">
				<li style="border: 0px; margin: 0px; background-color: #dbf0ff;"></li>
				<li style="border: 0px; margin: 0px; background-color: #dbf0ff;"></li>		
			</c:if>
			</c:forEach>
			</ul>
		</div>
		<br/>
	</c:forEach>	
	</div>
	<jsp:include page="${jsp3 }"></jsp:include>
</body>
</html>