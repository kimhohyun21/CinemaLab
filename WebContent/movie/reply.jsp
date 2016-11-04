<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="movie/style.css">
</head>
<body>
	<div id="reply">
		<h3 align="left">���� �� ��ȭ ����</h3>
		<form action="moviedetail.do" method="post" name="frm">
			<table border="1" id="reply_table" width="1000">
				<tr>
					<td width="20%">����<br>����</td>
					<td width="69%">
						<textarea rows="6" cols="100" placeholder="��ȭ ����� �α��� �Ŀ� �ۼ��Ͻ� �� �ֽ��ϴ�" wrap="hard" required></textarea>
					</td>
					<td width="11%">
						<a>�Է�</a>
					</td>
				</tr>
			</table>
		</form>
		<ul>
			<c:forEach var="vo" items="${replyList }">
				<li>
					<div>
						${vo.score }
					</div>
					<div>
						${vo.reContent }
					</div>
					<div>
						<fmt:formatDate value="${vo.regDate }" pattern="yyyy-MM-dd"/>
					</div>
					<div>
						${vo.id }
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>






















