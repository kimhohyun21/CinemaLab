<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Main Page</title>
	<!-- Responsive Slider Library -->
    <script src="sliderengine/jquery.js"></script>
    <script src="sliderengine/amazingslider.js"></script>
    <link rel="stylesheet" type="text/css" href="sliderengine/amazingslider-1.css">
    <script src="sliderengine/initslider-1.js"></script>
    <!-- End of Responsive Slider -->
</head>
<body>
	<div align="center">
		<!-- Insert to your webpage where you want to display the slider -->
	    <div id="amazingslider-wrapper-1" style="display:block;position:relative;max-width:1000px;margin:0px auto 56px;">
	        <div id="amazingslider-1" style="display:block;position:relative;margin:0 auto;">
	            <ul class="amazingslider-slides" style="display:none;">
	                <li><img src="images/7SlILk2WMTI.jpg" alt="Marvel&apos;s Captain America: The Winter Soldier"  title="Marvel&apos;s Captain America: The Winter Soldier" />
	                <video preload="none" src="https://www.youtube.com/embed/7SlILk2WMTI?list=PLK5HARgNfgj95xG4t5gk7k0f6HV1TW71F" ></video>
	                </li>
	                <li><img src="images/pWdKf3MneyI.jpg" alt="Marvel&apos;s Ant-Man"  title="Marvel&apos;s Ant-Man" />
	                <video preload="none" src="https://www.youtube.com/embed/pWdKf3MneyI?list=PLK5HARgNfgj8P7WV6xvuVcZInRnqIy9Zd" ></video>
	                </li>
	                <li><img src="images/HSzx-zryEgM.jpg" alt="Marvel&apos;s Doctor Strange"  title="Marvel&apos;s Doctor Strange" />
	                <video preload="none" src="https://www.youtube.com/embed/HSzx-zryEgM" ></video>
	                </li>
	                <li><img src="images/dKrVegVI0Us.jpg" alt="Marvel&apos;s Captain America: Civil War"  title="Marvel&apos;s Captain America: Civil War" />
	                <video preload="none" src="https://www.youtube.com/embed/dKrVegVI0Us?list=PLK5HARgNfgj-cuVJ8e3XrMRFtl-JE0uiQ" ></video>
	                </li>
	                <li><img src="images/JAUoeqvedMo.jpg" alt="Marvel&apos;s Avengers: Age of Ultron"  title="Marvel&apos;s Avengers: Age of Ultron" />
	                <video preload="none" src="https://www.youtube.com/embed/JAUoeqvedMo?list=PLK5HARgNfgj-aohotCZ6Bi6fkSouCbGuO" ></video>
	                </li>
	            </ul>
	            <ul class="amazingslider-thumbnails" style="display:none;">
	                <li><img src="images/7SlILk2WMTI-tn.jpg" alt="Marvel&apos;s Captain America: The Winter Soldier" title="Marvel&apos;s Captain America: The Winter Soldier" /></li>
	                <li><img src="images/pWdKf3MneyI-tn.jpg" alt="Marvel&apos;s Ant-Man" title="Marvel&apos;s Ant-Man" /></li>
	                <li><img src="images/HSzx-zryEgM-tn.jpg" alt="Marvel&apos;s Doctor Strange" title="Marvel&apos;s Doctor Strange" /></li>
	                <li><img src="images/dKrVegVI0Us-tn.jpg" alt="Marvel&apos;s Captain America: Civil War" title="Marvel&apos;s Captain America: Civil War" /></li>
	                <li><img src="images/JAUoeqvedMo-tn.jpg" alt="Marvel&apos;s Avengers: Age of Ultron" title="Marvel&apos;s Avengers: Age of Ultron" /></li>
	            </ul>
	        <div class="amazingslider-engine"><a href="http://amazingslider.com" title="Responsive jQuery Content Slider">Responsive jQuery Content Slider</a></div>
	        </div>
        </div>
    </div>
    <!-- End of body section HTML codes -->
   	<div id="vertical-slider">
   		<jsp:include page="slider.jsp"></jsp:include>
   	</div>

</body>
</html>