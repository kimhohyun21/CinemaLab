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
<script type="text/javascript">
	/* function click(){
		location.href="reserve.do?year=${year }&month=${month }&checkedDay=${checkedDay}&checkedDay2=${checkedDay2}&local=${vo.local}&tname=${tname }&grade=${grade }&title=${title}&theaterNo=${theaterNo}&movietime=${movietime}&click=click";
	} */
	function send(){
		location.href="reserve2.do?year=${year }&month=${month }&checkedDay=${checkedDay}&checkedDay2=${checkedDay2}"
		+"&local=${local}&tname=${tname }&grade=${grade }&title=${title}&theaterNo=${theaterNo}&movietime=${movietime}";
	}
</script>
</head>
<body>
	<center>
		<table width="1000" id="main_table">
			<tr height="40">
				<th align="center" class="menu" width="15%">��¥</th>
				<th align="center" class="menu" width="25%">����</th>
				<th align="center" class="menu" width="45%">��ȭ</th>
				<th align="center" class="menu" width="15%">�ð�</th>
			</tr>
			<tr>
				<!-- ��¥���� -->
				<td width="15%" align="center" class="main_table_td">
					<p class="year">${year }</p>
					<p class="month">${month }</p>
					<br> <c:forEach var="c" begin="0" end="6" step="1"
						items="${strWeek2 }">
						<c:choose>
							<c:when test="${day7[z]==1}">
								<!-- �����޷� �Ѿ�� �Ǹ� ������ ǥ�� -->
								<br>
								<p class="month">${month+1 }</p>
								<a id="checkedDay"
									href="reserve.do?year=${year }&month=${month+1 }&checkedDay=${day7[z]}
									&checkedDay2=${c}&local=${local }&tname=${tname }&grade=${grade }&title=${title}
									&theaterNo=${theaterNo}&movietime=${movietime}">
									<c:choose>
										<c:when test="${c eq '��'}">
											<span class="day" style="color: blue">${c }</span>
											<span class="day2" style="color: blue">${day7[z] }</span>
											<br>
										</c:when>
										<c:when test="${c eq '��'}">
											<span class="day" style="color: red">${c }</span>
											<span class="day2" style="color: red">${day7[z] }</span>
											<br>
										</c:when>
										<c:otherwise>
											<span class="day">${c }</span>
											<span class="day2">${day7[z] }</span>
											<br>
										</c:otherwise>
									</c:choose>
								</a>
							</c:when>
							<c:when test="${month==12 }&${day7[z]==31 }">
								<!-- 12�� 31���̸� �����⵵, 1���� ǥ�� -->
								<p class="year">${year+1 }</p>
								<p class="month">
									1<br>
								</p>
								<a id="checkedDay"
									href="reserve.do?year=${year+1 }&month=${1 }&checkedDay=${day7[z]}
									&checkedDay2=${c}&local=${local }&tname=${tname }&grade=${grade }&title=${title}
									&theaterNo=${theaterNo}&movietime=${movietime}">
									<c:choose>
										<c:when test="${c eq '��'}">
											<span class="day" style="color: blue">${c }</span>
											<span class="day2" style="color: blue">${day7[z] }</span>
											<br>
										</c:when>
										<c:when test="${c eq '��'}">
											<span class="day" style="color: red">${c }</span>
											<span class="day2" style="color: red">${day7[z] }</span>
											<br>
										</c:when>
										<c:otherwise>
											<span class="day">${c }</span>
											<span class="day2">${day7[z] }</span>
											<br>
										</c:otherwise>
									</c:choose>
								</a>
							</c:when>
							<c:otherwise>
								<a id="checkedDay"
									href="reserve.do?year=${year }&month=${month }&checkedDay=${day7[z]}
									&checkedDay2=${c}&local=${local }&tname=${tname }&grade=${grade }&title=${title}
									&theaterNo=${theaterNo}&movietime=${movietime}">
									<c:choose>
										<c:when test="${c eq '��'}">
											<span class="day" style="color: blue">${c }</span>
											<span class="day2" style="color: blue">${day7[z] }</span>
											<br>
										</c:when>
										<c:when test="${c eq '��'}">
											<span class="day" style="color: red">${c }</span>
											<span class="day2" style="color: red">${day7[z] }</span>
											<br>
										</c:when>
										<c:otherwise>
											<span class="day">${c }</span>
											<span class="day2">${day7[z] }</span>
											<br>
										</c:otherwise>
									</c:choose>
								</a>
							</c:otherwise>
						</c:choose>
						<c:set var="z" value="${z=z+1 }"></c:set>
					</c:forEach>
				</td>

				<!-- ���弳�� -->
				<td width="25%" align="left" class="main_table_td">
					<table id="theater_table">
						<tr>
							<td><c:forEach var="vo" items="${localList }">
									<a
										href="reserve.do?year=${year }&month=${month }&checkedDay=${checkedDay}
										&checkedDay2=${checkedDay2}&local=${vo.local}&tname=${tname }&grade=${grade }&title=${title}
										&theaterNo=${theaterNo}&movietime=${movietime}">
										<p id="local">${vo.local }</p>
									</a>
									<br>
								</c:forEach></td>
							<td>&nbsp;&nbsp;<jsp:include page="theater.jsp" />
							</td>
						</tr>
					</table>
				</td>

				<!-- ��ȭ����Ʈ���� -->
				<td width="45%" class="main_table_td"><jsp:include
						page="movieList.jsp" /></td>

				<!-- �󿵽ð����� -->
				<td width="15%"><jsp:include page="movieTime.jsp" /></td>
			</tr>
		</table>
		<table width="1000" id="movieInfo_table">
			<tr>
				<td>��ȭ : <c:if test="${grade=='0'}">
						<img src="image/bg_grade_all.png" width="15">
					</c:if> <c:if test="${grade=='12'}">
						<img src="image/bg_grade_12.png" width="15">
					</c:if> <c:if test="${grade=='15'}">
						<img src="image/bg_grade_15.png" width="15">
					</c:if> <c:if test="${grade=='18'}">
						<img src="image/bg_grade_18.png" width="15">
					</c:if> ${title }
				</td>
				<td>�Ͻ� : ${year }.${month }.${checkedDay }.${checkedDay2 }</td>
				<td>���� : ${tname } / ${theaterNo } �� / ${movietime }</td>
			</tr>
		</table>
		<input type="button" value="���" class="back_button"
			onclick="javascript:history.back()"> <input type="button" value="����"
			class="next_button" onclick="send()">

	</center>
</body>
</html>























