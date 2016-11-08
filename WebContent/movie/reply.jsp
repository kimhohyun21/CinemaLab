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
<script type="text/javascript">
	
</script>
</head>
<body>
	<div id="reply">
		<h3 align="left">���� �� ��ȭ ����</h3>
		<form action="reply_ok.do?no=${vo.mNo }" method="post" name="frm">
			<table id="reply_table" width="1000">
				<tr>
					<td width="20%">����<br>
						<input type="text" size="10" name="score"><br>
						����
					</td>
					<td width="69%">
						<textarea id="content" name="content" rows="6" cols="100" placeholder="��ȭ ����� �α��� �Ŀ� �ۼ��Ͻ� �� �ֽ��ϴ�" wrap="hard" required></textarea>
					</td>
					<td width="11%">
						<input type="submit" value="�Է�" id="send">
					</td>
				</tr>
			</table>
		</form>
		<ul>
			<c:forEach var="vo" items="${replyList }">
				<li>
					<div align="left" id="score">
						���� : ${vo.score }
					</div>
					<div align="left" id="reContent">
						${vo.reContent }
					</div>
					<div align="left">
						<fmt:formatDate value="${vo.regDATE }" pattern="yyyy-MM-dd"/> &nbsp;|&nbsp;&nbsp;<span>${vo.id }</span>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>
						





















