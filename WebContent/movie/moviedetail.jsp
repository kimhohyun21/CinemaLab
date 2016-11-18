<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
   <title>��ȭ ��</title>
   <link rel="stylesheet" type="text/css" href="movie/style.css">
</head>
<body>	
   <div class="detail">
   <c:if test="${mvo.admin eq '1' }">
		<div align="right">
			<a href="Amodifymovielist.do?no=${no }">
				<b style="color: red;">�����ϱ�</b>
			</a>
		</div>
	</c:if>
      <div class="detail2">
         <div id="poster_div">
            <img align="left" src="${vo.poster}" width="200" height="270" id="poster"><br>
            <a href="reserve.do?title=${vo.title }&poster=${vo.poster }">
               <c:if test="${type eq '1'}">
	               <button class="reserve_btn">
	                  <span class="list">�����ϱ�</span>
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
                        <strong>������ : </strong><span>${vo.rank }</span>
                     </td>
                     <td width="36%">
                        <strong>���� ���� :</strong><span>${vo.movieLike }</span>
                     </td >
                     <td width="33%">
                        <strong>��� : </strong><span>${vo.grade }���̻� ��������</span>
                     </td>
                  <tr>
                     <td>
                        <strong>������ : </strong><fmt:formatDate value="${vo.opendate }" pattern="yyyy-MM-dd"/>
                     </td>
                     <td>
                        <strong>�帣 : </strong><span>${vo.genre }</span>
                     </td>
                     <td>
                        <strong>�󿵽ð� : </strong><span>${vo.runtime }</span>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="3">
                        <strong>���� : </strong><span>${vo.director }</span>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="3">
                        <strong>�⿬ : </strong><span>${vo.cast }</span>
                     </td>
                  </tr>
               </table>
            </div>
         </div>
      </div>
      <table id="cont" width="1000">
         <tr>
            <td colspan="2" width="867">
               <span id="movieContent">�ٰŸ�</span><pre>${vo.content }</pre><br><br>
            </td>
         </tr>
      </table>
      <div id="cast_div">
         <table width="1000">
            <tr>
               <td><span >�⿬��</span></td>
               <td colspan="10">
               		<c:if test="${mvo.admin eq '1' }">
						<div align="right">
							<a href="Amodifymovielist.do?no=${no }">
								<b style="color: red;">�⿬�� �����ϱ�</b>
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
      <iframe width="900" height="360" src="http://www.youtube.com/embed/${url }" frameborder="0" allowfullscreen id="youtube">
         �ش� �������� iframe�� �������� �ʽ��ϴ�. IE9 �̻�, ũ��, ���̾������� �̿����ּ���.
      </iframe>
      <div align="center">
         <jsp:include page="reply.jsp"></jsp:include>
      </div>
   </div>
>>>>>>> refs/remotes/origin/hohyun
</body>
</html>
