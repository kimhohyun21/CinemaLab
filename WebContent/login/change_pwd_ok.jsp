<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${pCheck == true }">
	<script type="text/javascript">
		alert('������ �Ϸ�Ǿ����ϴ�.');
		/* history.back(); */
	</script>
	<c:redirect url="mypage.do"/>
</c:if>
<c:if test="${pCheck == false }">
	<script type="text/javascript">
		alert('��й�ȣ�� Ʋ���ϴ�');		
		history.back();
	</script>
</c:if>