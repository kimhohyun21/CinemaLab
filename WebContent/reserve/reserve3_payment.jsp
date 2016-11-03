<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>������� - ������Ʈ</title>
	<script src="../sliderengine/jquery.js"></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
	<script type="text/javascript">
		window.onload=function(){
			var IMP = window.IMP;
			IMP.init('imp74690571'); 
		}	
		
		function payment(){
			IMP.request_pay({
			    pg : 'html5_inicis',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '�ֹ���:�����׽�Ʈ',
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
			        var msg = '������ �����Ͽ����ϴ�.';
			        msg += '�������� : ' + rsp.error_msg;
			    }

			    alert(msg);
			});
		}
	</script>
</head>
<body>
	<h2><a href="#" onclick="javascript:payment();">����</a></h2>
</body>
</html>