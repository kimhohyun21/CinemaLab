<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${check == 1 }">
	<script type="text/javascript">
		alert('그동안 이용해 주셔서 감사합니다');
		/* history.back(); */
	</script>
	<c:redirect url="main.do"/>
</c:if>
<c:if test="${check == 0 }">
	<script type="text/javascript">
		alert('비밀번호가 틀립니다');		
		history.back();
	</script>
</c:if>