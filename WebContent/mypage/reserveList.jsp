<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="login/style3.css">
<style type="text/css">
	tr,td{
		padding: 10px;
	}
</style>
</head>
<body>
	<div class="mrList">
		<a href="#">			
			<span class="mrList_btn">���ų���</span>
		</a>
		<a href="#">			
			<span class="mrList_btn">���ݱ��� �� ��ȭ</span>
		</a>
	</div>
	<table>		
			
	<c:if test="${list == null }">
		<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNHUKwbax2uYSi3cF5wrdrj5YNSLLx-xNQCj4aj1Ajn2duwk-tUw">
		<br> ���ų����� �����ϴ�
	</c:if>
	<c:forEach var="vo" items="${list }">
			<tr>
				<td>
					<a href="moviedetail.do?no=${vo.mno }">
						<img src="${vo.poster}" width="250" height="350">
					</a>
				</td>
				<td>
					<h3>${vo.title }</h3><br>
					�󿵳�¥: ${vo.ryear }.${vo.rmonth }.${vo.rday }<br>
					������: ${vo.movietime }&nbsp;${vo.local }&nbsp;${vo.theater }&nbsp;${vo.theaterno }��<br>
					�¼�: ${vo.seat }<br>
					�������: ${vo.paytype } / �ݾ�: ${vo.payment }�� 
				</td>
			</tr>
	</c:forEach>
	</table>	
</body>
</html>