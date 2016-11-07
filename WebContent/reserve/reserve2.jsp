<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Ticket and Seat</title>
	<link rel="stylesheet" type="text/css" href="reserve/style2.css">
	<script type="text/javascript">
		function select(){
			$.ajax({
				type: "POST",
				url: "reserve2.do",
				data:$('#frm').serialize(),
				success:function(data){
					$('#result').html(data);
				},
				error:function(data){
					alert("실패");
				}
			});
		};
	</script>
</head>
<body>
	<div align="center" class="reserve2">
		<!-- 티켓 매수 선택 -->
		<div class="ticket">
			<form id="frm">
				<input type="hidden" name="year" value="${year }">
				<input type="hidden" name="month" value="${month }">
				<input type="hidden" name="checkedDay" value="${checkedDay }">
				<input type="hidden" name="checkedDay2" value="${checkedDay2 }">
				<input type="hidden" name="local" value="${local }">
				<input type="hidden" name="tname" value="${tname }">
				<input type="hidden" name="grade" value="${grade }">
				<input type="hidden" name="title" value="${title }">
				<input type="hidden" name="poster" value="${poster }">				
				<input type="hidden" name="theaterNo" value="${theaterNo}">
				<input type="hidden" name="movietime" value="${movietime}">
				<input type="hidden" name="rType" value="seat">
				<strong>어른</strong>
				<select id="adult" name="adult" onchange="select()">
					<option selected="selected">0</option>
				<c:forEach var="i" begin="1" end="8">
					<option>${i}</option>
				</c:forEach>					
				</select>
				<strong>청소년</strong>
				<select id="junior" name="junior" onchange="select()">
					<option selected="selected">0</option>
				<c:forEach var="i" begin="1" end="8">
					<option>${i}</option>
				</c:forEach>					
				</select>
				<strong>시니어</strong> 
				<select id="senior" name="senior" onchange="select()">
					<option selected="selected">0</option>
				<c:forEach var="i" begin="1" end="8">
					<option>${i}</option>
				</c:forEach>					
				</select>
			</form>
			<!-- 선택 초기화 버튼 -->
			<span class="resetBtn">
				<a href="reserve2.do?year=${year }&month=${month }&checkedDay=${checkedDay}
				&checkedDay2=${checkedDay2}&local=${local }&tname=${tname }&grade=${grade }&title=${title}
				&poster=${poster }&theaterNo=${theaterNo2}&movietime=${movietime}">
					선택초기화
				</a>
			</span>
		</div>
		<!-- 자리 선택  include-->
		<div id="result">
			<jsp:include page="${jsp2 }"></jsp:include>		
		</div>			
	</div>
</body>
</html>