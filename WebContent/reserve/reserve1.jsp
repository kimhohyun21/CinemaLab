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
	<center>
		<h2>예매</h2>
		<form action="reserve1.jsp" method="post" name="frm">
			<table width="700" height="500" border="1">
				<tr>
					<td>날짜</td>
					<td>극장</td>
					<td>영화</td>
					<td>시간</td>
				</tr>
				<tr>
					<td align="left">
						<p>${year }</p>
						<p>${month }</p>
						<c:forEach var="c" begin="0" end="6" step="1" items="${strWeek2 }">
							<p><input type="radio" name="day" value="${day7[z] }" style="display:none">${c } ${day7[z] }</p>
							<c:set var="z" value="${z=z+1 }"></c:set>
						</c:forEach>
					</td>
					<td>
						<ul>
							<li>
								<span><a><h4>서울</h4></a></span>
							</li>
						</ul>
					</td>
				</tr>
			</table>
		</form>
		
	</center>
</body>
</html>