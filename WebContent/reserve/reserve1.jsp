<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="reserve/style.css">
<script type="text/javascript">
	/* $(function() {
		$('#sendBtn').click(function () {
			if($('#checkedDay').val()==""){
				alert("날짜를 선택하세요");
				$('#checkedDay').focus();
				return;
			}
			var theater=$('#theater').val();
			if(theater.trim()==""){
				alert("영화관을 선택하세요");
				$('#theater').focus();
				return;
			}
			$('#frm').submit();
		})
	}); */
</script>
</head>
<body>
	<center>
		<h2>예매</h2>
		<form action="reserve/reserve3.jsp" method="post" id="frm">
			<table width="1000" height="400" border="1">
				<tr height="40">
					<td align="center" class="menu" width="15%">날짜</td>
					<td align="center" class="menu" width="25%">극장</td>
					<td align="center" class="menu" width="45%">영화</td>
					<td align="center" class="menu" width="15%">시간</td>
				</tr>
				<tr>
					<!-- 날짜설정 -->
					<td width="15%" align="center">
						<p class="year">${year }</p>
						<p class="month">${month }</p><br>
						<c:forEach var="c" begin="0" end="6" step="1" items="${strWeek2 }">
							<c:choose>
								<c:when test="${day7[z]==1}">	<!-- 다음달로 넘어가게 되면 다음달 표기 -->
									<br><p class="month">${month+1 }</p>
									<a id="checkedDay" href="reserve.do?checkedDay=${day7[z]}&checkedDay2=${c}&local=${local }
									&tname=${tname }&grade=${grade }&title=${title}&theaterNo=${theaterNo}&movietime=${movietime}">
										<c:choose>
											<c:when test="${c eq '토'}">
												<span class="day" style="color:blue">${c }</span> <span class="day2" style="color:blue">${day7[z] }</span><br>
											</c:when>
											<c:when test="${c eq '일'}">
												<span class="day" style="color:red">${c }</span> <span class="day2" style="color:red">${day7[z] }</span><br>
											</c:when>
											<c:otherwise>
												<span class="day">${c }</span> <span class="day2">${day7[z] }</span><br>
											</c:otherwise>
										</c:choose>
									</a>
								</c:when>
								<c:when test="${month==12 }&${day7[z]==31 }"> <!-- 12월 31일이면 다음년도, 1월로 표기 -->
									<p class="year">${year+1 }</p>
									<p class="month">1<br></p>
									<a id="checkedDay" href="reserve.do?checkedDay=${day7[z]}&checkedDay2=${c}&local=${local }
									&tname=${tname }&grade=${grade }&title=${title}&theaterNo=${theaterNo}&movietime=${movietime}">
										<c:choose>
											<c:when test="${c eq '토'}">
												<span class="day" style="color:blue">${c }</span> <span class="day2" style="color:blue">${day7[z] }</span><br>
											</c:when>
											<c:when test="${c eq '일'}">
												<span class="day" style="color:red">${c }</span> <span class="day2" style="color:red">${day7[z] }</span><br>
											</c:when>
											<c:otherwise>
												<span class="day">${c }</span> <span class="day2">${day7[z] }</span><br>
											</c:otherwise>
										</c:choose>
									</a>
								</c:when>	
								<c:otherwise>
									<a id="checkedDay" href="reserve.do?checkedDay=${day7[z]}&checkedDay2=${c}&local=${local }
									&tname=${tname }&grade=${grade }&title=${title}&theaterNo=${theaterNo}&movietime=${movietime}">
										<c:choose>
											<c:when test="${c eq '토'}">
												<span class="day" style="color:blue">${c }</span> <span class="day2" style="color:blue">${day7[z] }</span><br>
											</c:when>
											<c:when test="${c eq '일'}">
												<span class="day" style="color:red">${c }</span> <span class="day2" style="color:red">${day7[z] }</span><br>
											</c:when>
											<c:otherwise>
												<span class="day">${c }</span> <span class="day2">${day7[z] }</span><br>
											</c:otherwise>
										</c:choose>
									</a>
								</c:otherwise>
							</c:choose>
							<c:set var="z" value="${z=z+1 }"></c:set>
						</c:forEach>
					</td>
					
					<!-- 극장설정 -->
					<td width="25%" align="left">
						<table id="theater_table">
							<tr>
								<td>
									<c:forEach var="vo" items="${localList }">
										<a href="reserve.do?checkedDay=${checkedDay}&checkedDay2=${checkedDay2}&local=${vo.local}
										&tname=${tname }&grade=${grade }&title=${title}&theaterNo=${vo.theaterNo}&movietime=${vo.movietime}">
											<p id="local">${vo.local }</p>
										</a>
									</c:forEach>
								</td>
								<td>
									&nbsp;&nbsp;<jsp:include page="theater.jsp"/>
								</td>
							</tr>
						</table>
					</td>
					
					<!-- 영화리스트설정 --> 
					<td width="45%">
						<jsp:include page="movieList.jsp"/>
					</td>
					
					<!-- 상영시간설정 -->
					<td width="15%">
						<jsp:include page="movieTime.jsp"/>
					</td>
				</tr>
			</table>
			<table width="1000" border="1">
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
			<input type="button" value="취소" onclick="javascript:history.back()">
			<input type="button" value="좌석선택">
		</form>
	</center>
</body>
</html>























