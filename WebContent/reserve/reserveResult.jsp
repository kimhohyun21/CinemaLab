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
	<div id="reserve">
		<table width="780px">
			<tr>
				<th width="33%">영화</th>
				<th width="33%">예매 정보</th>
				<th width="33%">총 결제 금액</th>					
			</tr>
			<tr>
				<td width="33%">
					<c:if test="${grade=='0'}">
						<img src="image/bg_grade_all.png">
					</c:if>
					<c:if test="${grade=='12'}">
						<img src="image/bg_grade_12.png">
					</c:if>
					<c:if test="${grade=='15'}">
						<img src="image/bg_grade_15.png">
					</c:if>
					<c:if test="${grade=='18'}">
						<img src="image/bg_grade_18.png">
					</c:if>
					${title }			
				</td>
				<td width="33%">
					상영일 : ${year }. ${month }. ${checkedDay } (${checkedDay2 })<br/>
					상영시간 : ${movietime} <br/>
					상영관 : ${tname } ${theaterNo}관 <br/>
					좌석 : <c:forEach var="st" items="${seat }" varStatus="status">
							${st }<c:if test="${not status.last }">, </c:if>
						 </c:forEach><br/>
				</td>
				
				<td width="33%">
					영화 예매 : ${payment }원
				</td>
			</tr>
		</table>
		<form action="reserve3.do" method="post">
			<input type="hidden" name="year" value="${year }">
			<input type="hidden" name="month" value="${month }">
			<input type="hidden" name="checkedDay" value="${checkedDay }">
			<input type="hidden" name="checkedDay2" value="${checkedDay2 }">
			<input type="hidden" name="tname" value="${tname }">
			<input type="hidden" name="grade" value="${grade }">
			<input type="hidden" name="title" value="${title }">				
			<input type="hidden" name="theaterNo" value="${theaterNo}">
			<input type="hidden" name="movietime" value="${movietime}">
			<input type="hidden" name="seat" value="${seat}">
			<input type="hidden" name="payment" value="${payment }">			
			<table width="780px">
				<tr>
					<td align="left">
						<input type="button" value="이전페이지" onclick="javascript:history.back();">
					</td>
					<td align="right">
						<input type="button" value="다음페이지" onclick="send()">
					</td>
				</tr>
			</table>
		</form>	
	</div>	
</body>
</html>