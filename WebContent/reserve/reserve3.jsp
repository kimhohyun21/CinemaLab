<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>결제</title>
	<link rel="stylesheet" type="text/css" href="reserve/style.css">
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
	<script type="text/javascript">		
		window.onload = function () {
			 IMP.init();
		}
		
		var IMP = window.IMP;
		IMP.init('imp74690571');
		
		IMP.request_pay({
		    pg : 'inicis',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : 14000,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456'
		}, function(rsp) {
		    if ( rsp.success ) {
		        //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
		        jQuery.ajax({
		            url: "/payments/complete", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
		            type: 'POST',
		            dataType: 'json',
		            data: {
		                imp_uid : rsp.imp_uid
		                //기타 필요한 데이터가 있으면 추가 전달
		            }
		        }).done(function(data) {
		            //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
		            if ( everythings_fine ) {
		                var msg = '결제가 완료되었습니다.';
		                msg += '\n고유ID : ' + rsp.imp_uid;
		                msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		                msg += '\결제 금액 : ' + rsp.paid_amount;
		                msg += '카드 승인번호 : ' + rsp.apply_num;

		                alert(msg);
		            } else {
		                //[3] 아직 제대로 결제가 되지 않았습니다.
		                //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
		            }
		        });
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;

		        alert(msg);
		    }
		});
	
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
				if($('#chooseCard').val()=="선택없음"){
					alert("카드를 선택하세요");
					$('#chooseCard').focus();
					return;
				}
				if($('#number1').val()==""){
					alert("카드 번호를 입력하세요");
					$('#number1').focus();
					return;
				}
				if($('#number2').val()==""){
					alert("카드 번호를 입력하세요");
					$('#number2').focus();
					return;
				}
				if($('#number3').val()==""){
					alert("카드 번호를 입력하세요");
					$('#number3').focus();
					return;
				}
				if($('#number4').val()==""){
					alert("카드 번호를 입력하세요");
					$('#number4').focus();
					return;
				}
				if($('#pwd').val()==""){
					alert("비밀번호를 입력하세요");
					$('#pwd').focus();
					return;
				}
				if($('#month').val()==""){
					alert("유효 월을 입력하세요");
					$('#month').focus();
					return;
				}
				if($('#year').val()==""){
					alert("유효 년을 입력하세요");
					$('#year').focus();
					return;
				}
				if($('#birth').val()==""){
					alert("주민번호 앞자리를 입력하세요");
					$('#birth').focus();
					return;
				}
				IMP.request_pay();
			})
		});
	</script>
</head>
<body>
	<center>
		<h2>결제</h2>
		<form name="pgForm" id="pgForm">
		<table width="700" border="1">
			<tr>
				<td align="center">결제정보 입력</td>
			</tr>
			<tr>
				<td align="center">
					<input type="radio" name="pay" value="card" onClick="display1()" checked>신용카드
					<input type="radio" name="pay" value="account" onClick="display2()">계좌이체
				</td>
			</tr>
		</table>
		<table width="700" border="1" id="card">
			<tr>
				<td width="700">
					카드종류 
					<select id="chooseCard" name="chooseCard">
						<option>선택없음</option>
						<option value="현대">현대카드</option>
						<option value="현대">삼성카드</option>
						<option value="현대">신한카드</option>
						<option value="현대">농협카드</option>
						<option value="현대">국민카드</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>카드번호 
					<input type="text" name="number1" id="number1" size="10">-
					<input type="text" name="number2" id="number2" size="10">- 
					<input type="text" name="number3" id="number3" size="10">-
					<input type="text" name="number4" id="number4" size="10">
				</td>
			</tr>
			<tr>
				<td>비밀번호 <input type="password" name="pwd" id="pwd" size="5">
				</td>
			</tr>
			<tr>
				<td>유효기간 
					<input type="text" name="month" id="month" size="5"> 월 
					<input type="text" name="year" id="year" size="5"> 년
				</td>
			</tr>
			<tr>
				<td>법정생년월일(6자리) <input type="text" name="birth" id="birth" size="10">
				</td>
			</tr>
		</table>
		<table width="700" border="1" id="account" style="display:none">
			<tr>
				<td width="700">
					계좌이체 순서<br>
					1.아래 결제하기 버튼 클리 후 다음 단계로 이동<br>
					2.결제내역 확인 후 결제하기 버튼 클릭 시 팝업창이 뜸<br>
					3.해당 팝업에서 원하는 은행을 선택 후 계좌이체 정보를 입력하시면 됩니다.
				</td>
			</tr>
		</table>
		<input type="button" value="취소" onclick="javascript:history.back()">
		<input type="button" value="결제" id="send">
		</form>
	</center>
</body>
</html>






