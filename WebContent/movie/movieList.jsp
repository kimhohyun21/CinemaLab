<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
							<span class="past">마블 대표 영화</span>
						</button>
					</a>
					<a href="movieList.do?type=1">
						<button class="present_btn">
							<img src="">
							<span class="present">현재 상영 영화</span>
						</button>
					</a>
					<a href="movieList.do?type=2">
						<button class="future_btn">
							<img src="">
							<span class="future">상영 예정 영화</span>
						</button>
					</a>
				</td>
			</tr>
		</table>
		<table border="0">
			<c:set var="loop" value="false"/>
			<c:set var="a" value="0"/>
			<c:set var="b" value="${(fn:length(list))/3 }"/>
			<c:if test="${(fn:length(list))%3!=0}">
				<c:set var="b" value="${b+1 }"/>
			</c:if>
			<c:forEach var="vo" items="${list }">			
			<c:forEach var="i" begin="1" end="${b }" step="1">
				<tr>
				<c:if test="${not loop }">
				<c:forEach var="j" begin="1" end="4" step="1" >
					<td align="center" class="link">
						<table border="0">
							<tr>
								<td colspan="2">
									<a href="movie_detail.do?no=cno">
										<img src="${list[a].poster}" width="200" height="270">
									</a>
								</td>
							</tr>
							<tr>	
								<td align="center" colspan="2">
								<span class="grade">${list[a].grade }</span>
									${list[a].title }
								</td>
							</tr>
							<tr>
								<td align="center">
									${list[a].rank }
								</td>
								<td align="center">
									${list[a].movieLike }
								</td>
							</tr>
						</table>
					</td>
					<c:set var="a" value="${a+1 }"/>
				</c:forEach>
				<c:if test="${a>(fn:length(list))-1 }">
					<c:set var="loop" value="true"/>
				</c:if>	
				</c:if>			
				</tr>				
			</c:forEach>		
			</c:forEach>
		</table>		
	</div>
</body>
</html>