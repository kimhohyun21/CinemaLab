<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
	<c:if test="${id==null || pwd==null}">
		<script type="text/javascript">
			alert('�Է��Ͻ� ������ Ʋ���ų� ID�� �������� �ʽ��ϴ�');
			history.back();
		</script>
	</c:if>
<style type="text/css">
	#find a{
		color: gray;
		text-decoration: none;
	}
	#find a:HOVER {
		color: #CD426B;
}
</style>
</head>
<body>
	<div align="center">
		<div id="find">
			<c:if test="${id != '�н�' }">
				<h3>
				<b>${id }</b><br/>
				�Է��Ͻ� ������ ID��<br/>
				�Դϴ�
				</h3>
				<a href="find_pwd.do">��й�ȣ ã��</a>
			</c:if>
			
			<c:if test="${pwd != '�н�' }">
				<h3>
				�Է��Ͻ� ������ �н������<br/>
				<b>${pwd }</b><br/>
				�Դϴ�
				</h3>
			</c:if>
			<input type="button" value="�α���" ondblclick="location.href='login.do';">
		</div>
	</div>
</body>
</html>