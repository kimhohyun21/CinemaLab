<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>영화 상세</title>
	<link rel="stylesheet" type="text/css" href="movie/style.css">
</head>
<body>
	<div align="center">
		<table id="cont" align="center">
						<tr>
							<td align="center" rowspan="9" width="200">
								<img src="${vo.poster}" width="200" height="270">
								<a href="reserve.do?">
									<button class="reserve_btn">
										<span class="list">예매하기</span>
									</button>
								</a>
							</td>
							<td>
								<span class="title_2">${vo.title }</span>
							</td>
						</tr>
						<tr>
							<td>
								<span>예매율 :</span> ${vo.rank }
							</td>
							<td>
								<span>등급 :</span> ${vo.grade }세이상 관람가능
							</td>
						</tr>
						<tr>
							<td>
								<span>관람 평점 :</span> ${vo.movieLike }
							</td>
							<td>
								<span>개봉일 :</span><fmt:formatDate value="${vo.opendate }" pattern="yyyy-MM-dd"/>
							</td>
						</tr>
						<tr>
							<td>
								<span>장르 :</span> ${vo.genre }&nbsp;&nbsp;
							</td>
							<td>
								<span>상영 시간 :</span> ${vo.runtime }&nbsp;&nbsp;
							</td>
						</tr>
						<tr>
							<td>
								<span>감독 :</span> ${vo.director }<br>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span>출연 :</span> ${vo.cast }<br>
							</td>
						</tr>
					</table>
					&nbsp;
					<table id="cont">
						<tr>
							<td colspan="2" width="867">
								<span>줄거리 : </span><pre>${vo.content }</pre>
							</td>
						</tr>
						<tr>
							<td>
								
							</td>
						</tr>
					</table>
		<iframe width="640" height="360" src="http://www.youtube.com/embed/${url }" frameborder="0" allowfullscreen/>
	</div>
</body>
</html>