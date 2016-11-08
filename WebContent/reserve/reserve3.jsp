<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>����</title>
	<link rel="stylesheet" type="text/css" href="reserve/style2.css">
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
	<script type="text/javascript">	
		/* ���� ��� ����� ���� �ʱ�ȭ */
		window.onload=function(){
			var IMP = window.IMP;
			IMP.init('imp74690571'); 
		}
		
		/* ���� ��� ���ÿ� ���� ���� ��� �� ���� �� ȭ�� ǥ�� ��ȯ*/
		var type="";
		function display1() {
			card.style.display='block';
			account.style.display='none';
			type="card"
			return;
		}
		
		function display2(){
			card.style.display='none';
			account.style.display='block';
			type="trans"
			return;
		} 
	    
		/* ���� ��� ȣ��*/
		function payment(type){
			IMP.request_pay({
			    pg : 'html5_inicis',
			    pay_method : type,
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : 'Marvel Cinema ����',
			    amount : 1000,
			    buyer_email : '',
			    buyer_name : '��ȣ��',
			    buyer_tel : '010-1234-5678'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '������ �Ϸ�Ǿ����ϴ�.';
			        /* msg += '����ID : ' + rsp.imp_uid;
			        msg += '���� �ŷ�ID : ' + rsp.merchant_uid;	
			        msg += '���� �ݾ� : ' + rsp.paid_amount;
			        msg += 'ī�� ���ι�ȣ : ' + rsp.apply_num; */
			        
			        location.href="reserve4.do?pid="+ rsp.imp_uid+"&sid="+ rsp.merchant_uid+"&sp="
			        			+rsp.paid_amount+"&cokn="+rsp.apply_num;
			      
			    } else {
			        var msg = '������ �����Ͽ����ϴ�.<br/>';
			        msg += '�������� : ' + rsp.error_msg+'.';			        
			    }
			    $.jQueryAlert(msg);
			});
		}	
		
		/* jQuery Alert â */
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
	</script>
</head>
<body>
	<div align="center" class="finalPaymentInfo">		
		<h2>����</h2>
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
		<form name="pgForm" id="card" action="javascript:payment(type);" method="post">
		<table width="700" border="1">
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
		<input type="button" value="���" onclick="javascript:history.back()">
		<input type="submit" value="����" id="send">
		</form>
		<form name="pgForm" id="account" action="javascript:payment(type);" method="post" style="display:none">
		<table width="700" border="1">
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
		<input type="submit" value="����" id="send">		
		</form>
	</div>	
</body>
</html>






