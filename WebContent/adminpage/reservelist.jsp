<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="customer/style.css">
</head>
<body>
	<div align="center" class="bg">
		<table class="tb" width="700">
			<tr>
				<th width="10%" align="center">��ȣ</th>
				<th width="25%" align="center">�̸�</th>
				<th width="25%" align="center">��ȭ�̸�</th>
				<th width="20%" align="center">������</th>
				<th width="10%" align="center">���</th>
				<th width="10%" align="center">ȯ��</th>
			</tr>
		<c:forEach var="vo" items="${list}">
			<tr>
				<td width="10%" align="center">${vo.rno}</td>
				<td width="25%" align="center">${vo.name}</td>
				<td width="25%" align="left">
					<c:if test="${msg eq vo.rtitle}">
					<span>${vo.rtitle}</span>
					</c:if>
					
					<c:if test="${msg ne vo.rtitle}">
						<a href="rcontent.do?no=${vo.rno}&page=${curpage }">${vo.rtitle}</a>
					</c:if>
				</td>
				<td width="20%" align="center">
					<fmt:formatDate value="${vo.rdate}" pattern="yyyy-MM-dd"/>
				</td>
				<td width="10%" align="center">${vo.cancle}</td>
				<td width="10%" align="center">${vo.refund}</td>
			</tr>
			</c:forEach>
		</table>
		<table border="0" width="700">
			<tr>
				<td align="right">
					<a href="customer.do?page=${page>1?page-1:page}">����</a>
					&nbsp;
					<a href="customer.do?page=${page<totalpage?page+1:page}">����</a>
					&nbsp;&nbsp;
					${page} page / ${totalpage} pages
				</td>
			</tr>
		</table>
	</div>
</body>
</html>