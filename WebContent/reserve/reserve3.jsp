<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Reserve3 Payment</title>
	<link rel="stylesheet" type="text/css" href="reserve/reserve_style.css">
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
	<script type="text/javascript">	
		/* 결제 모듈 사용을 위한 초기화 */
		window.onload=function(){
			var IMP = window.IMP;
			IMP.init('imp74690571'); 
		}
		
		/* 결제 방법 선택에 따라 결제 방법 값 변경 및 화면 표시 전환*/
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
		
		/* 결제 모듈 호출*/
		function payment(type){
			IMP.request_pay({
			    pg : 'html5_inicis',
			    pay_method : type,
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : 'Marvel Cinema ${title} 예매',
			    amount : '${payment }',
			    buyer_name : '${mvo.name }',
			    buyer_email :''
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        /*
			        	고유ID : rsp.imp_uid
			        	상점 거래ID : rsp.merchant_uid	
			       		결제 금액 : rsp.paid_amount
			        	카드 승인번호 : rsp.apply_num
			        */
			        $.jQueryAlert(msg);
			        var $frmBox = $.parseHTML('<input type="hidden" name="pid" value='+rsp.imp_uid+'>'
			        						+'<input type="hidden" name="sid" value='+rsp.merchant_uid+'>'
			        						+'<input type="hidden" name="sp" value='+rsp.paid_amount+'>'
			        						+'<input type="hidden" name="cokn" value='+rsp.apply_num+'>'
			        						+'<input type="hidden" name="paytype" value='+type+'>');
			        $('#paymentfrm').append($frmBox);
			        $('#paymentfrm').submit();
			    } else {
			        var msg = '결제에 실패하였습니다.<br/>';
			        msg += '에러내용 : ' + rsp.error_msg+'.';	
			        $.jQueryAlert(msg);
			    }
			    
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
                        $('div #alertBox').dialog("close");
                    }
                }
            });
        };
        
        function reback(){
			location.href="reserve2.do?year=${year }&month=${month }&checkedDay=${checkedDay}&checkedDay2=${checkedDay2}"
				+"&poster=${poster}&tname=${tname }&grade=${grade }&title=${title}&theaterNo=${theaterNo}&movietime=${movietime}"
				+"&ticketAll=${ticketAll}&payment=${payment}&seatNo=${seatNo }";
		}	
        
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
		<h2 class="payment_title">결제</h2>
		<table width="700">
			<tr>
				<td align="center" id="td1">결제정보 입력</td>
			</tr>
			<tr>
				<td align="center" id="td2">
					<input type="radio" name="pay" value="card" onclick="display1()" checked>신용카드
					<input type="radio" name="pay" value="account" onclick="display2()">계좌이체
					<form id="paymentfrm" action="reserve4.do" method="post">
						<input type="hidden" name="year" value="${year }">
						<input type="hidden" name="month" value="${month }">
						<input type="hidden" name="checkedDay" value="${checkedDay }">
						<input type="hidden" name="checkedDay2" value="${checkedDay2 }">
						<input type="hidden" name="tname" value="${tname }">
						<input type="hidden" name="grade" value="${grade }">
						<input type="hidden" name="title" value="${title }">
						<input type="hidden" name="poster" value="${poster }">					
						<input type="hidden" name="theaterNo" value="${theaterNo}">
						<input type="hidden" name="movietime" value="${movietime}">
						<input type="hidden" name="ticketAll" value="${ticketAll}">
						<input type="hidden" name="payment" value="${payment}">	
						<input type="hidden" name="seatNo" value="${seatNo }">
					</form>
				</td>
			</tr>
		</table>
		<div id="card">
			<table width="700" class="payment_table">
				<tr>
					<td>
						신용카드 결제 안내<br>
						1.결제내역 확인 후 결제하기 버튼을 클릭시, 팝업창이 나타납니다.<br>
						2.해당 팝업에서 원하는 카드사를 선택 후 결제 정보를 입력하시면 됩니다.
						     ※ 신용카드 결제 가능 최소 금액은 1,000원 이상 입니다.     
					</td>
				</tr>
			</table>
			<input type="button" value="취소" onclick="reback()" class="back_button2">
			<input type="button" value="결제" onclick="javascript:payment('card')" class="next_button2">
		</div>
		<div id="account" style="display:none">
			<table width="700" class="payment_table">
				<tr>
					<td>
						실시간 계좌이체 안내<br>
						1.결제내역 확인 후 결제하기 버튼을 클릭시, 팝업창이 나타납니다.<br>
						2.해당 팝업에서 원하는 은행을 선택 후 계좌이체 정보를 입력하시면 됩니다.
					</td>
				</tr>
			</table>
			<input type="button" value="취소" onclick="reback()" class="back_button2">
			<input type="button" value="결제" onclick="javascript:payment('trans')" class="next_button2">
		</div>
	</div>	
</body>
</html>






