<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${check=='ok' }">
	<c:redirect url="main.do"/>
</c:if>
<c:if test="${check=='pwdnot' }">
	<script type="text/javascript">
		alert('�н����尡 �߸� �Ǿ����ϴ�.');
		history.back();
	</script>
</c:if>
<c:if test="${check=='idnot' }">
	<script type="text/javascript">
		alert('���̵� �߸� �Ǿ����ϴ�.');
		history.back();
	</script>
</c:if>
