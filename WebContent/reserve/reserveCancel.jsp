<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Reserve Cancel</title>
	<c:if test="${cancelCheck==true }">
		<script type="text/javascript">
			alter('예약이 취소되었습니다.');
			location.href="reserveList.do?no=${no }";
		</script>
	</c:if>
	<c:if test="${cancelCheck==false }">
		<script type="text/javascript">
			alter('예약 취소에 실패하였습니다.');
			location.href="reserveList.do?no=${no }";
		</script>
	</c:if>
</head>
<body>

</body>
</html>