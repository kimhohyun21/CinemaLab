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
		<h3>내용보기</h3>
		<table id="table_content" width="500">
			<tr>
				<th width="20%" align="center">번호</th>
				<td width="30%" align="center">${vo.no}</td>
				<th width="20%" align="center">작성일</th>
				<td width="30%" align="center">
					<fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
			
			<tr>
				<th width="20%" align="center">이름</th>
				<td width="30%" align="center">${vo.name}</td>
				
				<th width="20%" align="center">조회수</th>
				<td width="30%" align="center">${vo.hit}</td>
			</tr>
			
			<tr>
				<th width="20%" align="center">제목</th>
				<td colspan="3" align="center">${vo.subject}</td>
			</tr>
			
			<tr>
				<td colspan="4" valign="top" align="left" height="200">
					<pre>${vo.content}</pre>
				</td>
			</tr>
			
		</table>
	</center>
</body>
</html>
