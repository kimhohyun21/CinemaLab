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
		<table>
			<tr id="sub">
				<td>
					<a href="customer.do">
						<button class="list_btn">
							<span>QnA</span>
						</button>
					</a>
				</td>
				<td>
					<a href="faq.do">
						<button class="list_btn">
							<span>FAQ</span>
						</button>
					</a>
				</td>
			</tr>
		</table>
		<table border="0" width="700">
			<tr align="left">
				<td>
					<a href="insert.do">글쓰기</a>
				</td>
			</tr>
		</table>
		<table class="tb" width="700">
			<tr>
				<th width="10%" align="center">번호</th>
				<th width="45%" align="center">제목</th>
				<th width="15%" align="center">이름</th>
				<th width="20%" align="center">작성일</th>
				<th width="10%" align="center">조회수</th>
			</tr>
		<c:forEach var="vo" items="${list}">
			<tr>
				<td width="10%" align="center">${vo.qno}</td>
				<td width="45%" align="left">
					
					<c:if test="${vo.group_tab!=0}">
						<c:forEach var="i" begin="1" end="${vo.group_tab}">
							&nbsp;&nbsp;
							<img alt="reply" src="customer/img/icon_reply.gif">
						</c:forEach>
					</c:if>
					<c:if test="${msg eq vo.qsubject}">
					<span>${vo.qsubject}</span>
					</c:if>
					
					<c:if test="${msg ne vo.qsubject}">
						<a href="content.do?no=${vo.qno}&page=${page }">${vo.qsubject}</a>
					</c:if>
				</td>
				<td width="15%" align="center">${vo.name}</td>
				<td width="20%" align="center">
					<fmt:formatDate value="${vo.qregdate}" pattern="yyyy-MM-dd"/>
				</td>
				<td width="10%" align="center">${vo.qhit}</td>
			</tr>
			</c:forEach>
		</table>
		<table border="0" width="700">
			<tr>
				<td align="right">
					<a href="customer.do?page=${page>1?page-1:page}">이전</a>
					&nbsp;
					<a href="customer.do?page=${page<totalpage?page+1:page}">다음</a>
					&nbsp;&nbsp;
					${page} page / ${totalpage} pages
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
