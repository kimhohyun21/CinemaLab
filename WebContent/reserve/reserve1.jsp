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
		<h2>����</h2>
			<table width="1200" height="500" border="1">
				<tr height="40">
					<td>��¥</td>
					<td>����</td>
					<td>��ȭ</td>
					<td>�ð�</td>
				</tr>
				<tr>
					<td width="25%">
						<p>${year }</p>
						<p>${month }</p>
						<c:forEach var="c" begin="0" end="6" step="1" items="${strWeek2 }">
							<c:choose>
								<c:when test="${day7[z]==1}">	<!-- �����޷� �Ѿ�� �Ǹ� ������ ǥ�� -->
									<p>${month+1 }</p>
									<p><a href="reserve.do?checkedDay=${day7[z]}&checkedDay2=${c}">${c } ${day7[z] }</a></p>
								</c:when>
								<c:when test="${month==12 }&${day7[z]==31 }"> <!-- 12�� 31���̸� �����⵵, 1���� ǥ�� -->
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
									<a href="reserve.do?local=����">����</a><br>
									<a href="reserve.do?local=���">���</a><br>
									<a href="reserve.do?local=��õ">��õ</a><br>
									<a href="reserve.do?local=�뱸">�뱸</a><br>
									<a href="reserve.do?local=�λ�">�λ�</a><br>
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
			<input type="button" value="���">
			<input type="submit" value="����">
	</center>
</body>
</html>























