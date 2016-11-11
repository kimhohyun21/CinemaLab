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
	<script type="text/javascript">
		function reserveCancel(){
			$('#cancelfrm').submit();
		}
	</script>
</head>
<body>
	<div class="mrList">
		<a href="reserveList.do?no=${mvo.no }">
			<span class="mrList_btn">���ų���</span>
		</a>
		<a href="reserveList.do?no=${mvo.no }&type=1">
			<span class="mrList_btn">��������</span>
		</a>
	</div>
	<table>
	<c:if test="${list == '[]' }">
		<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNHUKwbax2uYSi3cF5wrdrj5YNSLLx-xNQCj4aj1Ajn2duwk-tUw">
		<br> ������ �����ϴ�
	</c:if>
	<c:forEach var="vo" items="${list }" begin="${start }" end="${end }" step="1">
			<tr>
				<td>
					<a href="moviedetail.do?no=${vo.mno }">
						<img src="${vo.poster}" width="250" height="350">
					</a>
				</td>
				<td>
					<h3>${vo.title }</h3><br><br>					
					�󿵳�¥: ${vo.listdate }<br>
					������: ${vo.movietime }&nbsp;${vo.local }&nbsp;${vo.theater }&nbsp;${vo.theaterno }��<br>
					�¼�: ${vo.seat }<br>
					�������: ${vo.paytype } / �ݾ�: ${vo.payment }�� 
					<c:if test="${vo.rdate > today}">	
						<div align="right">
							<form id="cancelfrm" action="reserveCancel.do" method="post">
								<input type="hidden" name="rNo" value="${vo.rNo}">					
							</form>
							<input type="button" value="�������" onclick="reserveCancel()">
						</div>
					</c:if>
				</td>
			</tr>
	</c:forEach>
	</table>
	
	<!-- �������� �϶� -->
	<c:if test="${type eq '1' }">
		<table>
			<tr>
				<td align="right">
					<a href="reserveList.do?no=${mvo.no }&type=1&page=1">ó��</a>&nbsp;
					
					<c:if test="${page > 1 }"> <!-- 1�������� �ƴҶ� -->
						<a href="reserveList.do?no=${mvo.no }&type=1&page=${page -1 }">����</a>&nbsp;&nbsp;
					</c:if>
					<c:if test="${page eq 1 }"> <!-- 1������ �϶� -->
						<a href="reserveList.do?no=${mvo.no }&type=1&page=${page }">����</a>&nbsp;&nbsp;
					</c:if>
					
					<c:if test="${page != totalPage }">	<!-- �������������� �ƴҶ� -->
						<a href="reserveList.do?no=${mvo.no }&type=1&page=${page + 1}">����</a>&nbsp;
					</c:if>
					<c:if test="${page eq totalPage }">	<!-- ������ �������϶� -->
						<a href="reserveList.do?no=${mvo.no }&type=1&page=${page}">����</a>&nbsp;
					</c:if>
					
					<a href="reserveList.do?no=${mvo.no }&type=1&page=${totalPage }">������</a>
				</td>
			</tr>
		</table>
	</c:if>
	
	<!-- ���ų����϶� -->
	<c:if test="${type eq '0' }">
		<table>
			<tr>
				<td align="right">
					<a href="reserveList.do?no=${mvo.no }&page=1">ó��</a>&nbsp;
					
					<c:if test="${page > 1 }"> <!-- 1�������� �ƴҶ� -->
						<a href="reserveList.do?no=${mvo.no }&page=${page -1 }">����</a>&nbsp;&nbsp;
					</c:if>
					<c:if test="${page eq 1 }"> <!-- 1������ �϶� -->
						<a href="reserveList.do?no=${mvo.no }&page=${page }">����</a>&nbsp;&nbsp;
					</c:if>
					
					<c:if test="${page != totalPage }">	<!-- �������������� �ƴҶ� -->
						<a href="reserveList.do?no=${mvo.no }&page=${page + 1}">����</a>&nbsp;
					</c:if>
					<c:if test="${page eq totalPage }">	<!-- ������ �������϶� -->
						<a href="reserveList.do?no=${mvo.no }&page=${page}">����</a>&nbsp;
					</c:if>
					
					<a href="reserveList.do?no=${mvo.no }&page=${totalPage }">������</a>
				</td>
			</tr>
		</table>
	</c:if>
</body>
</html>