<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${check == 0 }">
	<script type="text/javascript">
		alert('��밡���� ID�Դϴ�');
		/* history.back(); */
	</script>
	<c:redirect url="member.do"/>
</c:if>
<c:if test="${check != 0 }">
	<script type="text/javascript">
		alert('�̹� ������� ID�Դϴ�');		
		history.back();
	</script>
</c:if>������