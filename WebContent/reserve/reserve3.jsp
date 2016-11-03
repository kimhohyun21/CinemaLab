<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>����</title>
	<link rel="stylesheet" type="text/css" href="reserve/style.css">
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
	<script type="text/javascript">	
		window.onload=function(){
			var IMP = window.IMP;
			IMP.init('imp74690571'); 
		}
		
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
		
		jQuery.jQueryAlert = function (msg) {
            var $messageBox = $.parseHTML('<div id="alertBox"></div>');
            $("body").append($messageBox);

            $($messageBox).dialog({
                open: $($messageBox).append(msg),
                title: "ó�� ���",
                autoOpen: true,
                modal: true,
                resizable:false, 
				width: 400,
                buttons: {
                    OK: function () {
                        $(this).dialog("close");
                    }
                }
            });
        };
	     
		function payment(){
			IMP.request_pay({
			    pg : 'html5_inicis',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : 'Marvel Cinema ����',
			    amount : 14000,
			    buyer_email : 'iamport@siot.do',
			    buyer_name : '�������̸�',
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '����Ư���� ������ �Ｚ��',
			    buyer_postcode : '123-456'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '������ �Ϸ�Ǿ����ϴ�.';
			        msg += '����ID : ' + rsp.imp_uid;
			        msg += '���� �ŷ�ID : ' + rsp.merchant_uid;
			        msg += '���� �ݾ� : ' + rsp.paid_amount;
			        msg += 'ī�� ���ι�ȣ : ' + rsp.apply_num;
			    } else {
			        var msg = '������ �����Ͽ����ϴ�.<br/>';
			        msg += '�������� : ' + rsp.error_msg+'.';
			    }
	
			    /* alert(msg); */
			    $.jQueryAlert(msg);
			});
		}	
		
		
		/* $(function(){
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
				alert('����');
				$('#pgForm').submit();
			})
		}); */
	</script>
</head>
<body>
	<center>
		
		<h2>����</h2>
		<form name="pgForm" id="pgForm" action="javascript:payment();" method="post">
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
				<td width="700">
					������ü ����<br>
					1.�Ʒ� �����ϱ� ��ư Ŭ�� �� ���� �ܰ�� �̵�<br>
					2.�������� Ȯ�� �� �����ϱ� ��ư Ŭ�� �� �˾�â�� ��<br>
					3.�ش� �˾����� ���ϴ� ������ ���� �� ������ü ������ �Է��Ͻø� �˴ϴ�.
				</td>
			</tr>
		</table>
		<input type="button" value="���" onclick="javascript:history.back()">
		<input type="submit" value="����" id="send" onclick="">
		</form>
	</center>	
</body>
</html>






