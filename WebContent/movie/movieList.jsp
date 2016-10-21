<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<a href="main.do"/>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Marvel Cinema</title>
	<link rel="stylesheet" type="text/css" href="movie/style.css">
	<script type="text/javascript">

	</script>
</head>
<body>
	<div align="center">
		<table>
			<tr>
				<td>
					<a href="movieList.do?type=0">
						<button class="past_btn">
							<img src="">
							<span class="past">�� ���� ��ȭ</span>
						</button>
					</a>
					<a href="movieList.do?type=1">
						<button class="present_btn">
							<img src="">
							<span class="present">���� �� ��ȭ</span>
						</button>
					</a>
					<a href="movieList.do?type=2">
						<button class="future_btn">
							<img src="">
							<span class="future">�� ���� ��ȭ</span>
						</button>
					</a>
				</td>
			</tr>
		</table>
	<c:set var="i" value="1"/>
	<c:set var="j" value="3" />
	<c:if test="${list!=null }">
		<table>
	<c:forEach var="vo" items="${list }">
		<c:if test="${i==1}">
			<tr>
		</c:if>
				<td>
					<table>
						<tr>
							<td colspan="2">
								<a href="movie_detail.do?no=cno">
									<img src="${vo.poster}" width="200" height="270">
								</a>
							</td>
						</tr>
						<tr>	
							<td align="center" colspan="2">
							<span class="grade">${vo.grade }</span>
								${vo.title }
							</td>
						</tr>
						<tr>
							<td align="center">
								${vo.rank }
							</td>
							<td align="center">
								${vo.movieLike }
							</td>
						</tr>
					</table>
				</td>
		<c:set var="i" value="${i+1}" />
		<c:if test="${i==j+1}">
			</tr>
			<c:set var="i" value="1" />
		</c:if>
	</c:forEach>
		</table>
	</c:if>
	</div>
</body>
</html>