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
		<form action="reserve.do" method="post" name="frm">
			<table width="1000" height="500" border="1">
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
							<p><input type="radio" name="day" value="${day7[z] }" style="display:none">${c } ${day7[z] }</p>
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
						
					</td>
				</tr>
			</table>
		</form>	
	</center>
</body>
</html>

















