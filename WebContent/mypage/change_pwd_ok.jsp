<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${pCheck == true }">
	<script type="text/javascript">
		alert('수정이 완료되었습니다.');
	</script>
	<c:redirect url="reserveList.do?no=${mvo.no }"/>
</c:if>
<c:if test="${pCheck == false }">
	<script type="text/javascript">
		alert('비밀번호가 틀립니다');		
		history.back();
	</script>
</c:if>