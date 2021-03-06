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
	<!-- 관리자로 로그인했을 시 영화 정보 수정하기 버튼 띄우기 -->
	<c:if test="${mvo.admin eq '1' }">
		<div align="right">
			<a href="Amodifymovielist.do?no=${no }">
				<b class="modify">수정하기</b>
			</a>
		</div>
	</c:if>	
	<!-- 영화 상세 정보 불러오기 -->
   <div class="detail">
      <div class="detail2">
         <div id="poster_div">
            <img align="left" src="${vo.poster}" width="200" height="270" id="poster"><br>
            <a href="reserve.do?title=${vo.title }&poster=${vo.poster }">
               <c:if test="${type eq '1'}">
	               <button class="reserve_btn">
	                  <span class="list">예매하기</span>
	               </button>
               </c:if>
            </a>
         </div>
         <div id="title">
            <div align="left">
               <h3 class="title_2">${vo.title }</h3>
            </div>
            <div id="content">
               <table width="650">
                  <tr>
                     <td width="30%">
                        <strong>예매율 : </strong><span>${vo.rank } %</span>
                     </td>
                     <td width="36%">
                        <strong>관람 평점 : </strong><span>${vo.movieLike }</span>
                     </td >
                     <td width="33%">
                        <strong>등급 : </strong><span>${vo.grade }세이상 관람가능</span>
                     </td>
                  <tr>
                     <td>
                        <strong>개봉일 : </strong><fmt:formatDate value="${vo.opendate }" pattern="yyyy-MM-dd"/>
                     </td>
                     <td>
                        <strong>장르 : </strong><span>${vo.genre }</span>
                     </td>
                     <td>
                        <strong>상영시간 : </strong><span>${vo.runtime }</span>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="3">
                        <strong>감독 : </strong><span>${vo.director }</span>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="3">
                        <strong>출연 : </strong><span>${vo.cast }</span>
                     </td>
                  </tr>
               </table>
            </div>
         </div>
      </div>
      <table id="cont" width="1000">
         <tr>
            <td colspan="2" width="867">
               <span id="movieContent">줄거리</span><pre>${vo.content }</pre><br><br>
            </td>
         </tr>
      </table>
      <div id="cast_div">
         <table width="1000">
            <tr>
               <td><span >출연진</span></td>
               <td colspan="10">
               		<c:if test="${mvo.admin eq '1' }">
						<div align="right">
							<a href="Amodifymovielist.do?no=${no }">
								<b style="color: red;">출연진 수정하기</b>
							</a>
						</div>
					</c:if>
               </td>
            </tr>
            <tr>
               <c:forEach items="${list }" var="cvo">
               <td style="font-size: 14px" align="center">
                  <img src="${cvo.img }" style="border-radius: 84px"><br>
                  ${cvo.cname }
               </td>
               </c:forEach>
            </tr>
         </table>
      </div>
      <iframe width="900" height="400" src="http://www.youtube.com/embed/${url }" frameborder="0" allowfullscreen id="youtube">
         해당 브라우저는 iframe을 지원하지 않습니다. IE9 이상, 크롬, 파이어폭스를 이용해주세요.
      </iframe>
      <!-- 댓글 페이지 --> 
      <div align="center">
         <jsp:include page="reply.jsp"></jsp:include>
      </div>
   </div>
</body>
</html>
