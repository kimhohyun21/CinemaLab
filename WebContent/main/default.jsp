<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Main Page</title>
	<!-- Responsive Slider Library -->
    <script src="sliderengine/amazingslider.js"></script>
    <link rel="stylesheet" type="text/css" href="sliderengine/amazingslider-1.css">
    <link rel="stylesheet" type="text/css" href="main/style1.css">
    <script src="sliderengine/initslider-1.js"></script>
    <!-- End of Responsive Slider -->
</head>
<body>
	<div align="center">
		<!-- Insert to your webpage where you want to display the slider -->
	    <div id="amazingslider-wrapper-1" style="display:block;position:relative;max-width:1200px;margin:10px auto 54px;">
        <div id="amazingslider-1" style="display:block;position:relative;margin:0 auto;">
            <ul class="amazingslider-slides" style="display:none;">
            <c:forEach var="vo" items="${plist2 }">
                <li>
                	<img src="https://img.youtube.com/vi/${vo.trailer }/maxresdefault.jpg" alt="마블&apos;s ${vo.title }"  title="마블&apos;s ${vo.title }"/>
                	<video preload="none" src="https://www.youtube.com/embed/${vo.trailer }" ></video>
                </li>
            </c:forEach>
            </ul>
            <ul class="amazingslider-thumbnails" style="display:none;">
            <c:forEach var="vo" items="${plist2 }">
                <li><img src="https://img.youtube.com/vi/${vo.trailer }/mqdefault.jpg" alt="마블&apos;s ${vo.title }" title="마블&apos;s ${vo.title }" /></li>
            </c:forEach>
            </ul>
        <div class="amazingslider-engine">Marvel Cinema</div>
        </div>
    </div>
    </div>
    <!-- End of body section HTML codes -->
   	<div id="vertical-slider">
   		<jsp:include page="slider.jsp"></jsp:include>
   	</div>

</body>
</html>