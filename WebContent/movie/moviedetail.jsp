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
	<div class="detail">
	<c:if test="${mvo.admin eq '1' }">
		<div align="right">
			<a href="Amodifymovielist.do?no=${no }">
				<b style="color: red;">수정하기</b>
			</a>
		</div>
	</c:if>
		<table id="cont" align="center" width="1000">
			<tr>
				<td align="center" rowspan="6" width="200"><br>
					<img src="${vo.poster}" width="200" height="270">
					<a href="reserve.do?title=${vo.title }&poster=${vo.poster }">
						<button class="reserve_btn">
							<span class="list">예매하기${no }</span>
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
		<table id="cont" width="1000">
			<tr>
				<td colspan="2" width="867">
					<span>줄거리 : </span><pre>${vo.content }</pre><br><br>
				</td>
			</tr>			
			<tr align="center">
				<c:forEach items="${list }" var="cvo">
					<td style="font-size: 12px" width="33%" >
						<img src="${cvo.img }" style="border-radius: 84px"><br>
						${cvo.cname }
					</td>
				</c:forEach>
			</tr>
		</table>
		<iframe width="640" height="360" src="http://www.youtube.com/embed/${url }" frameborder="0" allowfullscreen id="youtube">
			해당 브라우저는 iframe을 지원하지 않습니다. IE9 이상, 크롬, 파이어폭스를 이용해주세요.
		</iframe>
		<div align="center">
			<jsp:include page="reply.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>
