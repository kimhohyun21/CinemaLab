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
   <table style="margin:10px 0px 10px 0px">
      <tr>
         <td class="movieBtn">
            <a href="movieList.do?type=0">
               <button class="list_btn">
                  <span class="list">�� ���� ��ȭ</span>
               </button>
            </a>
            <a href="movieList.do?type=1">
               <button class="list_btn">
                  <span class="list">���� �� ��ȭ</span>
               </button>
            </a>
            <a href="movieList.do?type=2">
               <button class="list_btn">
                  <span class="list">�� ���� ��ȭ</span>
               </button>
            </a>
         </td>
      </tr>
   </table>
   
   <!-- ��ȭ ����Ʈ 4���� ���� -->
   <c:set var="i" value="1"/>
   <c:set var="j" value="4" />
   <c:if test="${list!=null }">
   <div class="movielist">
      <table class="tb">
      <c:forEach var="vo" items="${list }">
      <c:if test="${i==1}">
         <tr>
      </c:if>
            <td>
               <table border="0" id="movie">
                  <tr>
                     <td colspan="2">
                        <a href="moviedetail.do?no=${vo.mNo }&type=${vo.type}">
                           <img src="${vo.poster}" width="200" height="270">
                        </a>
                     </td>
                  </tr>
                  <tr>   
                     <td align="center" colspan="2" class="title" height="42">
                     <c:if test="${vo.grade=='0'}">
                     <img src="image/bg_grade_all.png" width="18px" class="grade_image">
                     </c:if>
                     <c:if test="${vo.grade=='12'}">
                     <img src="image/bg_grade_12.png" width="18px" class="grade_image">
                     </c:if>
                     <c:if test="${vo.grade=='15'}">
                     <img src="image/bg_grade_15.png" width="18px" class="grade_image">
                     </c:if>
                     <c:if test="${vo.grade=='18'}">
                     <img src="image/bg_grade_18.png" width="18px" class="grade_image">
                     </c:if>
                     ${vo.title }
                     </td>
                  </tr>
                  <tr>
                     <td align="center" class="td" height="42">
                        ������<br>${vo.rank }%
                     </td>
                     <td align="center">
                        ���� ����<br>${vo.movieLike }
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
   </div>
   </c:if>
</body>
</html>