<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>작성 결과</title>
	<script type="text/javascript">
		function check(){
			$.ajax({
				type: "POST",
				url: "reserveResult.do",
				data:$('#frm2').serialize(),
				success:function(data){
					alert('성공'+this.data)
					$('#result2').html(data);
				},
				error:function(data){
					alert("실패");
				}
			});
		};
	</script>
</head>
<body>
	<div class=screen>
		<Strong class=screen-title>
			SCREEN
		</strong>
	</div>
	<div class="seat" align="center">
    <form id="frm2">
    	<input type="hidden" name="year" value="${year }">
		<input type="hidden" name="month" value="${month }">
		<input type="hidden" name="checkedDay" value="${checkedDay }">
		<input type="hidden" name="checkedDay2" value="${checkedDay2 }">
		<input type="hidden" name="local" value="${local }">
		<input type="hidden" name="tname" value="${tname }">
		<input type="hidden" name="grade" value="${grade }">
		<input type="hidden" name="title" value="${title }">				
		<input type="hidden" name="theaterNo" value="${theaterNo}">
		<input type="hidden" name="movietime" value="${movietime}">
		<input type="hidden" name="payment" value="${payment}">
	   	<c:forEach var="sa" begin="0" end="10" items="a,b,c,d,e,f,g,h,i,j">
	   	<div class="line" align="center">
	  		<ul>
	  		<li style="border: 0px; font: 10pt normal bold; background-color: #dbf0ff;">${sa }</li>		  		
			<c:forEach var="b" begin="1" end="20">
				<li>
					<input type="checkbox" name="seat" value="${sa }${b }" onchange="check()" id="${sa }${b }">
				</li>
			<c:if test="${b==4 || b==16}">
				<li style="border: 0px; margin: 0px; background-color: #dbf0ff;"></li>
				<li style="border: 0px; margin: 0px; background-color: #dbf0ff;"></li>		
			</c:if>
			</c:forEach>
			</ul>
		</div>
		<br/>
		</c:forEach>	
    </form>
	</div>
	<div id="result2">
		<jsp:include page="${jsp3 }"></jsp:include>
	</div>
</body>
</html>