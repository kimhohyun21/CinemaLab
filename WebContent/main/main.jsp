<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Marvel Cinema</title>
	<link rel="stylesheet" type="text/css" href="main/style1.css">
	<script src="sliderengine/jquery.js"></script>
	<script type="text/javascript">

	</script>
</head>
<body>
	<div align="center">
		<div id="header">
			<div id="mini_nav">
				<ul>
				<c:if test="${mvo.id==null }">
					<li><a href="login.do">�α���</a></li>
					<li><a href="member.do">ȸ������</a></li>
				</c:if>
				<c:if test="${mvo.id!=null }">
					<li>${mvo.name }�� �ݰ����ϴ�!</li>
					<li><a href="logout.do">�α׾ƿ�</a></li>
					<li><a href="reservePage.do">����������</a></li>
				</c:if>					
					<li><a href="customer.do">������</a></li>
				</ul>
			</div>
			<br/>		

				<a href="main.do">
					<img alt="logo" class="logo" src="image/marvel_cinema_logo.png">
				</a>

		</div>
		<div id="nav">
			<ul>
				<li><a href="reserve.do">����</a></li>
				<li class="noeffect">|</li>
				<li><a href="movieList.do">��ȭ</a></li>
				<li class="noeffect">|</li>
				<li><a href="theater.do?local=����&theater=�ŵ���">��ȭ��</a></li>
			</ul>
		</div>
		<div id="article">
			<jsp:include page="${jsp }"></jsp:include>
		</div>
		<div id="footer">
			<span>&copy;2016 Shin Eun Hye / Kim Ho Hyun / Jun Jin Tae / Choi Tae Soek / Park Jung Hwan</span>
		</div>
	</div>
</body>
</html>