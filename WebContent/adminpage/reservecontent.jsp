<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="adminpage/astyle.css">
<title>Insert title here</title>
</head>
<body>
	<div align="center" class="bg">
		<table id="table_content" width="501" class="tb">
			<tr>
				<th width="20%" align="center">������</th>
				<td width="80%" align="center" colspan="3">
					<fmt:formatDate value="${vo.rdate}" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
			<tr>
				<th width="20%" align="center">��ȣ</th>
				<td width="30%" align="center">${vo.rno}</td>
				<th width="20%" align="center">�̸�</th>
				<td width="30%" align="center">${vo.name}</td>
			</tr>
			<tr>
				<th width="20%" align="center">��ȭ�̸�</th>
				<td width="30%" align="center">${vo.title}</td>
				<th width="20%" align="center">������ȣ</th>
				<td width="30%" align="center">${vo.payment_id}</td>
			</tr>
			<tr>
				<th width="20%" align="center">�¼�</th>
				<td width="30%" align="center">${vo.seat}</td>
				<th width="20%" align="center">Ƽ�ϼ�</th>
				<td width="30%" align="center">${vo.ticket}</td>
			</tr>
			<tr>
				<th width="20%" align="center">���űݾ�</th>
				<td width="30%" align="center">${vo.payment}</td>
				<th width="20%" align="center">���ҹ��</th>
				<td width="30%" align="center">${vo.paytype}</td>
			</tr>	
			<tr>
				<th width="20%" align="center">�����ݾ�</th>
				<td width="30%" align="center">${vo.serverpay}</td>
				<th width="20%" align="center">shop_id</th>
				<td width="30%" align="center">${vo.shop_id}</td>
			</tr>	
			<tr>
				<th width="20%" align="center">���ι�ȣ</th>
				<td width="30%" align="center">${vo.cardoknum}</td>
				<th width="20%" align="center">����</th>
				<td width="30%" align="center">${vo.theater}</td>
			</tr>
			<tr>
				<th width="20%" align="center">�󿵰�</th>
				<td width="30%" align="center">${vo.theaterno}</td>
				<th width="20%" align="center">�󿵽ð�</th>
				<td width="30%" align="center">${vo.movietime}</td>
			</tr>
			<tr>
				<th width="20%" align="center">���</th>
				<td width="30%" align="center">${vo.cancel}</td>
				<th width="20%" align="center">ȯ��</th>
				<td width="30%" align="center">${vo.refund}</td>
			</tr>
		</table>
		<table>
			<tr align="right">
				<td>
					<a href="reservelist.do">���ư���</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
