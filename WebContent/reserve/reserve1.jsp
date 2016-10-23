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
			<table width="1200" height="500" border="1">
				<tr height="40">
					<td>날짜</td>
					<td>극장</td>
					<td>영화</td>
					<td>시간</td>
				</tr>
				<tr>
					<td width="25%">
						<p>${year }</p>
						<p>${month }</p>
						<c:forEach var="c" begin="0" end="6" step="1" items="${strWeek2 }">
							<c:choose>
								<c:when test="${day7[z]==1}">	<!-- 다음달로 넘어가게 되면 다음달 표기 -->
									<p>${month+1 }</p>
									<p><a href="reserve.do?checkedDay=${day7[z]}&checkedDay2=${c}">${c } ${day7[z] }</a></p>
								</c:when>
								<c:when test="${month==12 }&${day7[z]==31 }"> <!-- 12월 31일이면 다음년도, 1월로 표기 -->
									<p>${year+1 }</p>
									<p>1</p>
									<p><a href="reserve.do?checkedDay=${day7[z]}&checkedDay2=${c}">${c } ${day7[z] }</a></p>
								</c:when>	
								<c:otherwise>
									<p><a href="reserve.do?checkedDay=${day7[z]}&checkedDay2=${c}">${c } ${day7[z] }</a></p>
								</c:otherwise>
							</c:choose>
							<c:set var="z" value="${z=z+1 }"></c:set>
						</c:forEach>
					</td>
					<td width="25%">
						<table>
							<tr>
								<td>
									<a href="reserve.do?local=서울">서울</a><br>
									<a href="reserve.do?local=경기">경기</a><br>
									<a href="reserve.do?local=인천">인천</a><br>
									<a href="reserve.do?local=대구">대구</a><br>
									<a href="reserve.do?local=부산">부산</a><br>
								</td>
								<td>
									<jsp:include page="theater.jsp"/>
								</td>
							</tr>
						</table>
					</td> 
					<td>
						<jsp:include page="movieList.jsp"/>
					</td>
					<td>
						<jsp:include page="movieTime.jsp"/>
					</td>
				</tr>
			</table>
			<table width="1200" border="1">
				<tr>
					<td>
						포스터 이미지
						영화 : ${grade } / ${title } 
					</td>
					<td>
						일시 : ${year }.${month }.${checkedDay }.${checkedDay2 }
					</td>
					<td>
						극장 : ${tname } / ${theaterNo } 관 / ${movietime }
					</td>
					
				</tr>
			</table>
			<input type="button" value="취소">
			<input type="submit" value="결제">
	</center>
</body>
</html>























