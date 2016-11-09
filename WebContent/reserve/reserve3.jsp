<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>결제</title>
	<link rel="stylesheet" type="text/css" href="reserve/style2.css">
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
	<script type="text/javascript">	
		/* 결제 모듈 사용을 위한 초기화 */
		window.onload=function(){
			var IMP = window.IMP;
			IMP.init('imp74690571'); 
		}
		
		/* 결제 방법 선택에 따라 결제 방법 값 변경 및 화면 표시 전환*/
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
	    
		/* 결제 모듈 호출*/
		function payment(type){
			IMP.request_pay({
			    pg : 'html5_inicis',
			    pay_method : type,
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '{title} 결제',
			    amount : '${payment }',
			    buyer_name : '${mvo.name }'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        /* msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;	
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num; */
			        
			        location.href="reserve4.do?pid="+ rsp.imp_uid+"&sid="+ rsp.merchant_uid+"&sp="
			        			+rsp.paid_amount+"&cokn="+rsp.apply_num;
			      
			    } else {
			        var msg = '결제에 실패하였습니다.<br/>';
			        msg += '에러내용 : ' + rsp.error_msg+'.';			        
			    }
			    $.jQueryAlert(msg);
			});
		}	
		
		/* jQuery Alert 창 */
		jQuery.jQueryAlert = function (msg) {
            var $messageBox = $.parseHTML('<div id="alertBox"></div>');
            $("body").append($messageBox);

            $($messageBox).dialog({
                open: $($messageBox).append(msg),
                title: "처리 결과",
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
		<h2>예매 확인</h2>
		<table class="paymentInfo">
			<tr>
				<th width="33%">영화</th>
				<th width="33%">예매 정보</th>
				<th width="33%">총 결제 금액</th>					
			</tr>
			<tr>
				<td width="40%">
					<img alt="${title }_poster" src="${poster }" width="110px" height="160px">
					<c:if test="${grade=='0'}">
						<img src="image/bg_grade_all.png">
					</c:if>
					<c:if test="${grade=='12'}">
						<img src="image/bg_grade_12.png">
					</c:if>
					<c:if test="${grade=='15'}">
						<img src="image/bg_grade_15.png">
					</c:if>
					<c:if test="${grade=='18'}">
						<img src="image/bg_grade_18.png">
					</c:if>
					<span style="width: 180px;display: inline-block; vertical-align: inherit; color:#f78824;">
						${title }
					</span>				
				</td>
				<td width="30%">
					<ul>
						<li>
							<strong>상영일 :</strong> 
							<span style="color:#f78824;">
								${year }. ${month }. ${checkedDay } (${checkedDay2 })
							</span>
						</li>
						<li>
							<strong>상영시간 :</strong> 
							<span style="color:#f78824;">	
								${movietime}
							</span>	
						</li>
						<li>
							<strong>상영관 :</strong> 
							<span style="color:#f78824;">	
								${tname } ${theaterNo} 
							</span>관
						</li>
						<li>
							<strong>좌석 :</strong>
							<span style="color:#f78824;">  
							${seatNo }
							</span>
						</li>						 
					</ul>
				</td>
				
				<td width="30%">
					<ul>
						<li>
							<strong>영화 예매 :</strong>
							<span style="color:#f78824;">  
							<c:if test="${payment!=0 }"> 
								<fmt:formatNumber value="${payment }" pattern=",000"/> 
							</c:if>
							<c:if test="${payment==0 }">
								${payment }
							</c:if>	
							</span>원
						</li>
					</ul>
				</td>
			</tr>
		</table>		
		<h2>결제</h2>
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
		<form name="pgForm" id="card" action="javascript:payment(type);" method="post">
		<table width="700" border="1">
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
		<input type="button" value="취소" onclick="javascript:history.back()">
		<input type="submit" value="결제" id="send">
		</form>
		<form name="pgForm" id="account" action="javascript:payment(type);" method="post" style="display:none">
		<table width="700" border="1">
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
		<input type="submit" value="결제" id="send">		
		</form>
	</div>	
</body>
</html>






