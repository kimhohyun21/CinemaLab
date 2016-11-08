<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="customer/table.css">
</head>
<body>
	<center>
		<h3>게시판</h3>
		<hr>
		<table border="0" width="600">
			<tr>
				<td align="left">
					<a href="insert.do"><img src="customer/img/btn_write.gif" border="0"></a>
				</td>
			</tr>
		</table>
		<table id="table_content">
			<tr>
				<th width="10%">번호</th>
				<th width="45%">제목</th>
				<th width="15%">이름</th>
				<th width="20%">작성일</th>
				<th width="10%">조회수</th>
			</tr>
			<c:forEach var="vo" items="${list}">
				<tr class="dataTr">
					<td width="10%" class="tdcenter">${vo.no}</td>
					<td width="45%" class="tdleft">
						<!-- group_tab : 몇 번째 단계의 답변인지 나타내는 컬럼
							     새로운 글				0
							     |
							     -- 답변1				1
							     	 |
							     	 -- 답변1의 답변	2
						 -->
						 <c:if test="${vo.group_tab>0}">
						 	<c:forEach var="i" begin="1" end="${vo.group_tab}">
						 		&nbsp;&nbsp;
						 	</c:forEach>
						 	<img src="board/img/icon_reply.gif">
						 </c:if>
						 <c:if test="${msg == vo.subject}">
						 	<font color="blue">${vo.subject}</font>
						 </c:if>
						 <c:if test="${msg != vo.subject}">
						 	<a href="content.do?no=${vo.no}&page=${curPage}">${vo.subject}</a>
						 </c:if>
						 <c:if test="${today == vo.dbday}">
						 	<img src="board/img/icon_new (2).gif">
						 </c:if>
					</td>
					<td width="15%" class="tdcenter">${vo.name}</td>
					<td width="20%" class="tdcenter">${vo.date}</td>
					<td width="10%" class="tdcenter">${vo.hit}</td>
				</tr>
			</c:forEach>
		</table>
		<table border="0" width="600">
			<tr>
				<td align="right">
					<!-- [1][2][3][4][5]
						  fp		  tp
					 -->
					 <c:if test="${curPage > block}">
					 	<a href="list.do?page=1">
					 		<img src="board/img/begin.gif" border="0">
					 	</a>&nbsp;
					 	<a href="list.do?page=${fromPage-1}">
					 		<img src="board/img/prev.gif" border="0">
					 	</a>
					 </c:if>
					 <c:if test="${curPage <= block}">
					 	<a href="list.do?page=1">
					 		<img src="board/img/begin.gif" border="0">
					 	</a>&nbsp;
					 	<a href="list.do?page=${curPage>1?curPage-1:curPage}">
					 		<img src="board/img/prev.gif" border="0">
					 	</a>
					 </c:if>
					 
					 <c:forEach var="i" begin="${fromPage}" end="${toPage}">
					 	&nbsp;[ 
					 	<c:if test="${curPage == i}">
					 		<span style="color:red">${i}</span>
					 	</c:if>
					 	<c:if test="${curPage != i}">
					 		<a href="list.do?page=${i}">${i}</a>
					 	</c:if>
					 	]&nbsp;
					 </c:forEach>
					 
					 <c:if test="${toPage >= totalPage}">
					 	<a href="list.do?page=${curPage<totalPage?curPage+1:curPage}">
					 		<img src="board/img/next.gif" border="0">
					 	</a>&nbsp;
					 	<a href="list.do?page=${totalPage}">
					 		<img src="board/img/end.gif" border="0">
					 	</a>
					 </c:if>
					 <c:if test="${toPage < totalPage}">
					 	<a href="list.do?page=${toPage+1}">
					 		<img src="board/img/next.gif" border="0">
					 	</a>&nbsp;
					 	<a href="list.do?page=${totalPage}">
					 		<img src="board/img/end.gif" border="0">
					 	</a>
					 </c:if>
					 &nbsp;&nbsp;
					 ${curPage} page / ${totalPage} pages
				</td>
			</tr>
		</table>
	</center>
</body>
</html>
