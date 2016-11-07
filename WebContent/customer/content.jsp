<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<table id="table_content" width="500">
			<tr>
				<th width="20%" align="center">번호</th>
				<td width="30%" align="center">${vo.qno}</td>
				<th width="20%" align="center">작성일</th>
				<td width="30%" align="center">
					<fmt:formatDate value="${vo.qregdate}" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
			
			<tr>
				<th width="20%" align="center">이름</th>
				<td width="30%" align="center">${vo.name}</td>
				
				<th width="20%" align="center">조회수</th>
				<td width="30%" align="center">${vo.qhit}</td>
			</tr>
			
			<tr>
				<th width="20%" align="center">제목</th>
				<td colspan="3" align="center">${vo.qsubject}</td>
			</tr>
			
			<tr>
				<td colspan="4" valign="top" align="left" height="200">
					<pre>${vo.qcontent}</pre>
				</td>
			</tr>
		</table>
		<table>
			<tr align="right">
				<td>
					<a href="update.do?no=${vo.qno }&page="${page }">수정</a>
					&nbsp;&nbsp;
					<a href="delete.do?no=${vo.qno }&page="${page }"">삭제</a>
					&nbsp;&nbsp;
					<a onclick="javascript:history.back()">돌아가기</a>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>
