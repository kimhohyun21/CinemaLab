<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="customer/table.css">
<title>Insert title here</title>
</head>
<body>
	<div align="center" class="bg">
	<!-- fno순차별로 question과 answer 한 번 씩 출력    -->
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
		<h3>faq게시판</h3>
		<hr>
		<table border="0" width="600">
			<tr>
				<td align="left">
				<div id="mini_nav">
					<c:if test="${mvo.id!=null }">
						<a href="customer.do">글 관리</a>
					</c:if>
				</div>	
				</td>
			</tr>
		</table>

		<table border="1" width="800" align="center"  id="table_content">
			<c:forEach var="vo" items="${list}">
				<tr class="dataTr1">
					<td class="tdcenter">Q: ${vo.question}</td>
				</tr>
				<tr class="dataTr2">
					<td class="tdcenter">A: ${vo.answer}</td>
				</tr>
				
			</c:forEach>
		</table>

	</div>
</body>
</html>