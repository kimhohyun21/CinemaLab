<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<table width="700">
			<tr>
				<th align="center">
					����
				</th>
				<th align="center">
					������
				</th>
				<th align="center">
					������
				</th>
				<th align="center">
					����
				</th>
				<th align="center">
					���ƿ�
				</th>
			</tr>
			<c:forEach items="${list }" var="vo">
				<tr>
					<td align="left">
						${vo.title }						
					</td>
					<td align="center">
						${vo.date }
					</td>
					<td align="center">
						<c:if test="${vo.type == 0 }">������</c:if>
						<c:if test="${vo.type == 1 }">����</c:if>
						<c:if test="${vo.type == 2 }">�󿵿���</c:if>
					</td>
					<td align="center">
						${vo.rank }
					</td>
					<td align="center">
						${vo.movieLike }
					</td>
				</tr>
				<%-- <a href="moviedetail.do?no=${vo.mNo }"></a> --%>
			</c:forEach>
		</table>
	</center>
</body>
</html>