<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	function display1() {
		card.style.display='block';
		account.style.display='none';
		return;
	}
	
	function display2(){
		card.style.display='none';
		account.style.display='block';
		return;
	} 
	
	$(function(){
		$('#send').click(function(){
			if($('#chooseCard').val()=="���þ���"){
				alert("ī�带 �����ϼ���");
				$('#chooseCard').focus();
				return;
			}
			if($('#number1').val()==""){
				alert("ī�� ��ȣ�� �Է��ϼ���");
				$('#number1').focus();
				return;
			}
			if($('#number2').val()==""){
				alert("ī�� ��ȣ�� �Է��ϼ���");
				$('#number2').focus();
				return;
			}
			if($('#number3').val()==""){
				alert("ī�� ��ȣ�� �Է��ϼ���");
				$('#number3').focus();
				return;
			}
			if($('#number4').val()==""){
				alert("ī�� ��ȣ�� �Է��ϼ���");
				$('#number4').focus();
				return;
			}
			if($('#pwd').val()==""){
				alert("��й�ȣ�� �Է��ϼ���");
				$('#pwd').focus();
				return;
			}
			if($('#month').val()==""){
				alert("��ȿ ���� �Է��ϼ���");
				$('#month').focus();
				return;
			}
			if($('#year').val()==""){
				alert("��ȿ ���� �Է��ϼ���");
				$('#year').focus();
				return;
			}
			if($('#birth').val()==""){
				alert("�ֹι�ȣ ���ڸ��� �Է��ϼ���");
				$('#birth').focus();
				return;
			}
			$('#frm').submit();
		})
	});
</script>
</head>
<body>
	<center>
		<h2>����</h2>
		<form action="reserve2.do" method="post" name="frm" id="frm">
		<table width="700" border="1">
			<tr>
				<td align="center">�������� �Է�</td>
			</tr>
			<tr>
				<td align="center">
					<input type="radio" name="pay" value="card" onClick="display1()" checked>�ſ�ī��
					<input type="radio" name="pay" value="account" onClick="display2()">������ü
				</td>
			</tr>
		</table>
		<table width="700" border="1" id="card">
			<tr>
				<td width="700">
					ī������ 
					<select id="chooseCard" name="chooseCard">
						<option>���þ���</option>
						<option value="����">����ī��</option>
						<option value="����">�Ｚī��</option>
						<option value="����">����ī��</option>
						<option value="����">����ī��</option>
						<option value="����">����ī��</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>ī���ȣ 
					<input type="text" name="number1" id="number1" size="10">-
					<input type="text" name="number2" id="number2" size="10">- 
					<input type="text" name="number3" id="number3" size="10">-
					<input type="text" name="number4" id="number4" size="10">
				</td>
			</tr>
			<tr>
				<td>��й�ȣ <input type="password" name="pwd" id="pwd" size="5">
				</td>
			</tr>
			<tr>
				<td>��ȿ�Ⱓ 
					<input type="text" name="month" id="month" size="5"> �� 
					<input type="text" name="year" id="year" size="5"> ��
				</td>
			</tr>
			<tr>
				<td>�����������(6�ڸ�) <input type="text" name="birth" id="birth" size="10">
				</td>
			</tr>
		</table>
		<table width="700" border="1" id="account" style="display:none">
			<tr>
				<td align="center" width="700">
					������ü ����<br>
					1.�Ʒ� �����ϱ� ��ư Ŭ�� �� ���� �ܰ�� �̵�<br>
					2.�������� Ȯ�� �� �����ϱ� ��ư Ŭ�� �� �˾�â�� ��<br>
					3.�ش� �˾����� ���ϴ� ������ ���� �� ������ü ������ �Է��Ͻø� �˴ϴ�.
				</td>
			</tr>
		</table>
		<input type="button" value="���" onclick="javascript:history.back()">
		<input type="button" value="����" id="send">
		</form>
	</center>
</body>
</html>





