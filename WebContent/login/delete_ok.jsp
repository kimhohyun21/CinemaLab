<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${check == 1 }">
	<script type="text/javascript">
		alert('�׵��� �̿��� �ּż� �����մϴ�');
		/* history.back(); */
	</script>
	<c:redirect url="main.do"/>
</c:if>
<c:if test="${check == 0 }">
	<script type="text/javascript">
		alert('��й�ȣ�� Ʋ���ϴ�');		
		history.back();
	</script>
</c:if>