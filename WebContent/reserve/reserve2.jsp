<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>ticket and seat</title>
	<link rel="stylesheet" type="text/css" href="reserve/style2.css">
	<script type="text/javascript">
		
	</script>
</head>
<body>
	<div align="center">
		<div class="ticket">
			<form action="reserv2.do" method="post">
				<input type="hidden" name="checkedDay" value="${checkedDay }">
				<input type="hidden" name="checkedDay2" value="${checkedDay2 }">
				<input type="hidden" name="local" value="${local }">
				<input type="hidden" name="tname" value="${tname }">
				<input type="hidden" name="grade" value="${grade }">
				<input type="hidden" name="title" value="${title }">				
				<input type="hidden" name="theaterNo" value="${theaterNo}">
				<input type="hidden" name="movietime" value="${movietime}">					
				� <select name="adult" onchange="send()">
					<option selected="selected">0</option>
				<c:forEach var="i" begin="1" end="8">
					<option>${i}</option>
				</c:forEach>					
				</select>
				û�ҳ� <select name="junior" onchange="send()">
					<option selected="selected">0</option>
				<c:forEach var="i" begin="1" end="8">
					<option>${i}</option>
				</c:forEach>					
				</select>
				�ôϾ� <select name="senior" onchange="send()">
					<option selected="selected">0</option>
				<c:forEach var="i" begin="1" end="8">
					<option>${i}</option>
				</c:forEach>					
				</select>
			</form>
		</div>
		<div class=screen>
			<Strong class=screen-title>
				SCREEN
			</strong>
		</div>
		<div class="seat" align="center">
		    <c:forEach var="sa" begin="0" end="10" items="a,b,c,d,e,f,g,h,i,j">
		    	<div class="line" align="center">
			  		<ul>
			  		<li style="border: 0px; font: 10pt normal bold; background-color: #dbf0ff;">${sa }</li>		  		
					<c:forEach var="b" begin="1" end="20">
						<li><a href="reserve2.do?seat=${sa }${b }">${b }</a></li>
					<c:if test="${b==4 || b==16}">
						<li style="border: 0px; margin: 0px; background-color: #dbf0ff;"></li>
						<li style="border: 0px; margin: 0px; background-color: #dbf0ff;"></li>		
					</c:if>
					</c:forEach>
					</ul>
				</div>
				<br/>
			</c:forEach>	
		</div>
		<div>
			<table>
				<tr>
					<th>��ȭ</th>
					<th>���� ����</th>
					<th>�� ���� �ݾ�</th>					
				</tr>
				<tr>
					<td>
						<c:if test="${grade=='0'}">
							<img src="image/bg_grade_all.png">
						</c:if>
						<c:if test="${grade=='12'}">
							<img src="image/bg_grade_12.png">
						</c:if>
						<c:if test="${grade=='15'}">
							<img src="image/bg_grade_15.png">
						</c:if>
						<c:if test="${grade=='18'}">
							<img src="image/bg_grade_18.png">
						</c:if>
						${title }			
					</td>
					<td>
						���� : ${checkedDay } {checkedDay2 }
						�󿵽ð� : ${movietime}
						�󿵰� : ${tname } ${theaterNo}
						�¼� : ${seat }
					</td>
					<td>
						��ȭ ���� : ${payment }
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>