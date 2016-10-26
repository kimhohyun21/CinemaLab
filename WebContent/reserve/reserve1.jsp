<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$('#sendBtn').click(function () {
			if($('#checkedDay').val()==""){
				alert("��¥�� �����ϼ���");
				$('#checkedDay').focus();
				return;
			}
			var theater=$('#theater').val();
			if(theater.trim()==""){
				alert("��ȭ���� �����ϼ���");
				$('#theater').focus();
				return;
			}
			/* var movieList=$('#movieList').val();
			if(movieList.trim()==""){
				alert("��ȭ�� �����ϼ���");
				$('#movieList').focus();
				return;
			}
			var movietime=$('#movietime').val();
			if(movietime.trim()==""){
				alert("�󿵽ð��� �����ϼ���");
				$('#movietime').focus();
				return;
			} */
			$('#frm').submit();
		})
	});
</script>
</head>
<body>
	<center>
		<h2>����</h2>
		<form action="reserve/reserve3.jsp" method="post" id="frm">
			<table width="1200" height="500" border="1">
				<tr height="40">
					<td align="center">��¥</td>
					<td align="center">����</td>
					<td align="center">��ȭ</td>
					<td align="center">�ð�</td>
				</tr>
				<tr>
					<td width="25%" align="center">
						<p>${year }</p>
						<p>${month }</p>
						<c:forEach var="c" begin="0" end="6" step="1" items="${strWeek2 }">
							<c:choose>
								<c:when test="${day7[z]==1}">	<!-- �����޷� �Ѿ�� �Ǹ� ������ ǥ�� -->
									<p>${month+1 }</p>
									<p><a id="checkedDay" href="reserve.do?checkedDay=${day7[z]}&checkedDay2=${c}&local=${local }&tname=${tname }&grade=${grade }&title=${title}&theaterNo=${theaterNo}&movietime=${movietime}">${c } ${day7[z] }</a></p>
								</c:when>
								<c:when test="${month==12 }&${day7[z]==31 }"> <!-- 12�� 31���̸� �����⵵, 1���� ǥ�� -->
									<p>${year+1 }</p>
									<p>1</p>
									<p><a id="checkedDay" href="reserve.do?checkedDay=${day7[z]}&checkedDay2=${c}&local=${local }&tname=${tname }&grade=${grade }&title=${title}&theaterNo=${theaterNo}&movietime=${movietime}">${c } ${day7[z] }</a></p>
								</c:when>	
								<c:otherwise>
									<p><a id="checkedDay" href="reserve.do?checkedDay=${day7[z]}&checkedDay2=${c}&local=${local }&tname=${tname }&grade=${grade }&title=${title}&theaterNo=${theaterNo}&movietime=${movietime}">${c } ${day7[z] }</a></p>
								</c:otherwise>
							</c:choose>
							<c:set var="z" value="${z=z+1 }"></c:set>
						</c:forEach>
					</td>
					<td width="25%" align="center">
						<table>
							<tr>
								<td>
									<c:forEach var="vo" items="${localList }">
										<a href="reserve.do?checkedDay=${checkedDay}&checkedDay2=${checkedDay2}&local=${vo.local}&tname=${tname }&grade=${grade }&title=${title}&theaterNo=${vo.theaterNo}&movietime=${vo.movietime}">${vo.local }</a><br>
									</c:forEach>
								</td>
								<td>
									&nbsp;&nbsp;<jsp:include page="theater.jsp"/>
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
						������ �̹���
						��ȭ : ${grade } / ${title } 
					</td>
					<td>
						�Ͻ� : ${year }.${month }.${checkedDay }.${checkedDay2 }
					</td>
					<td>
						���� : ${tname } / ${theaterNo } �� / ${movietime }
					</td>
					
				</tr>
			</table>
			<input type="button" value="���" onclick="javascript:history.back()">
			<input type="button" value="�¼�����" id="send">
		</form>
	</center>
</body>
</html>























