<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
					</a>&nbsp;&nbsp;
					<a href="movieList.do?type=1">
						<button class="present_btn">
							<img src="">
							<span class="present">현재 상영 영화</span>
						</button>
					</a>&nbsp;&nbsp;
					<a href="movieList.do?type=2">
						<button class="future_btn">
							<img src="">
							<span class="future">상영 예정 영화</span>
						</button>
					</a>
				</td>
			</tr>
		</table>
		<table>
			<c:forEach var="vo" items="${list}">
				<tr>
				<c:forEach var="i" begin="1" end="3" step="1" >
					<td align="center" class="link">
						<table>
							<tr>
								<td colspan="2">
									<a href="movie_detail.do?no=cno">
										<img src="${vo.poster}" width="200" height="180" border="0">
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
				</c:forEach>				
				</tr>
			</c:forEach>
		</table>		
	</div>
</body>
</html>