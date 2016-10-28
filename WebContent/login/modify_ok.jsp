<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${check == 0 }">
	<script type="text/javascript">
		alert('사용가능한 ID입니다');
		/* history.back(); */
	</script>
	<c:redirect url="member.do"/>
</c:if>
<c:if test="${check != 0 }">
	<script type="text/javascript">
		alert('이미 사용중인 ID입니다');		
		history.back();
	</script>
</c:if>ㅋㅋㅋ