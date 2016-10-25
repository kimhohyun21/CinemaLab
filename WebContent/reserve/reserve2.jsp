<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>ticket and seat</title>
	<link rel="stylesheet" type="text/css" href="reserve/style2.css">
	<script type="text/javascript">

	</script>
</head>
<body>
	<div align="center">
		<div class="ticket">
			<form action="reserv2.do" method="post">
				어른 <select name="adult" onchange="send()">
					<option selected="selected">0</option>
				<c:forEach var="i" begin="1" end="8">
					<option>${i}</option>
				</c:forEach>					
				</select>
				청소년 <select name="junior" onchange="send()">
					<option selected="selected">0</option>
				<c:forEach var="i" begin="1" end="8">
					<option>${i}</option>
				</c:forEach>					
				</select>
				시니어 <select name="senior" onchange="send()">
					<option selected="selected">0</option>
				<c:forEach var="i" begin="1" end="8">
					<option>${i}</option>
				</c:forEach>					
				</select>
			</form>
		</div>
		<div class="seat" align="center">
		    <c:forEach var="sa" begin="0" end="10" items="a,b,c,d,e,f,g,h,i,j">
		    	<div class="line" align="center">
			  		<ul>
			  		<li style="border: 0px; font: 10pt normal bold">${sa }</li>		  		
					<c:forEach var="b" begin="1" end="20">
						<li><a href="reserve2.do?sa=${sa }&sn=${b }">${b }</a></li>
					</c:forEach>
					<c:if test="${b == 10}">
						<li style="border: 0px;"></li>
						<li style="border: 0px;"></li>	
						<li style="border: 0px;"></li>	
					</c:if>
					</ul>
				</div>
				<br/>
			</c:forEach>	
		</div>
	</div>
</body>
</html>