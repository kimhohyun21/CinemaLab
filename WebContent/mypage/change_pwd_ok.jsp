<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${pCheck == true }">
	<script type="text/javascript">
		alert('������ �Ϸ�Ǿ����ϴ�.');
	</script>
	<c:redirect url="reserveList.do?no=${mvo.no }"/>
</c:if>
<c:if test="${pCheck == false }">
	<script type="text/javascript">
		alert('��й�ȣ�� Ʋ���ϴ�');		
		history.back();
	</script>
</c:if>