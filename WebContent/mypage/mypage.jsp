<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"	prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	tr,td{
		padding: 10px;
	}
	#menubar{
    margin-bottom: 50px;
    border-color: black;
    border-width: 2px;    
	border-collapse:collapse;  
	}
	#menubar tr,td{
		padding:0px;
	}
	#menubar tr :HOVER {
		background-color: windowframe;
	}
</style>
</head>
<body>
<input type="hidden" value="${mvo.birth }" name="birth">
	<div align="center">
				<br>
		<table id="menubar" border="1" width="900" height="100">
			<tr>
				<td align="center">
					<a href="reserveList.do?no=${mvo.no }">
						���ų���
					</a>
				</td>			
				<td align="center">
					<a href="memberModify.do?no=${mvo.no }">
						ȸ������ ����
					</a>
				</td>			
				<td align="center">
					<a href="memberChangepwd.do">
						��й�ȣ ����
					</a>
				</td>			
				<td align="center">
					<a href="memberDelete.do?no=${mvo.no }">
						ȸ��Ż��
					</a>
				</td>
			</tr>
		</table>		
		<div align="center">
			<jsp:include page="${jsp2 }"></jsp:include>
		</div>
	</div>
</body>
</html>