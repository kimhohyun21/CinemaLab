<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Reserve Result</title>
	<script type="text/javascript">
		function send(){
			var f=document.frm;
			if(${ticketAll==0}){
				$.jQueryAlert('티켓 매수를 선택해 주세요.');
				return;
			}
			if(${seat==null || size!=ticketAll}){
				$.jQueryAlert('좌석 선택을 확인해 주세요.');
				return;
			}
			if(${mvo==null}){
				$.jQueryLogin();
			}else{
				f.submit();
			}	
		}; 
		
		function login(){
			var f=document.loginfrm;	
			if(f.id.value==""){
				$.jQueryAlert("아이디를 입력하세요");
				f.id.focus();
				return;
			}
			if(f.pwd.value==""){
				$.jQueryAlert("비밀번호를 입력하세요");
				f.pwd.focus();
				return;
			}
			f.submit();
		}
		
		/*jQuery Login*/
		jQuery.jQueryLogin = function (){
			var $loginform = $.parseHTML('<div id="logindiv">'
											+'<form name="loginfrm" action="login_ok.do" method="post" "id="loginfrm">'
											+'<div class="input">'
											+'<label for="id">ID</label>'
											+'<input type="text" placeholder="ID" name="id" id="id">'
											+'</div>'+'<div class="input">'
											+'<label for="pwd">PW</label>'
											+'<input type="password" placeholder="PW" name="pwd" id="pwd">'
											+'</div><input type="hidden" name="loginType" value="reserve">'
											+'</form><div id="find">'
											+'<a href="searchId.do">아이디 찾기</a>&nbsp;&nbsp;&nbsp;'
											+'<a href="searchPwd.do">비밀번호 찾기</a></div>');
			$("body").append($loginform);
			
			$($loginform).dialog({
				 open: $($loginform),
			     autoOpen: true,
			     width: 400,
			     modal: true,
			     resizable:false, 
			     buttons: {	
			       LOGIN : function() {
				         login();
				   },		 
			       Cancel: function() {
			         $(this).dialog("close");
			       }
			     }
			 });
		}
			 
			
		
		/* jQuery Alert 창 */
		jQuery.jQueryAlert = function (msg) {
	        var $messageBox = $.parseHTML('<div id="alertBox"></div>');
	        $("body").append($messageBox);
	
	        $($messageBox).dialog({
	            open: $($messageBox).append(msg),
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
	<div id="reserve">
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
							<c:forEach var="st" items="${seat }" varStatus="status">
								${st }<c:if test="${not status.last}">, </c:if>
							</c:forEach>
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
		<form action="reserve3.do" method="post" name="frm">
			<input type="hidden" name="year" value="${year }">
			<input type="hidden" name="month" value="${month }">
			<input type="hidden" name="checkedDay" value="${checkedDay }">
			<input type="hidden" name="checkedDay2" value="${checkedDay2 }">
			<input type="hidden" name="tname" value="${tname }">
			<input type="hidden" name="grade" value="${grade }">
			<input type="hidden" name="title" value="${title }">				
			<input type="hidden" name="theaterNo" value="${theaterNo}">
			<input type="hidden" name="movietime" value="${movietime}">
			<input type="hidden" name="ticketAll" value="${ticketAll}">
			<input type="hidden" name="payment" value="${payment}">	
			<input type="hidden" name="seat" value="${seat}">
			<table width="780px">
				<tr>
					<td align="left">
						<input type="button" value="이전페이지" onclick="javascript:location.href='reserve.do?'
						+'year=${year }&month=${month }&checkedDay=${checkedDay}&checkedDay2=${checkedDay2}'
						+'&local=${local }&tname=${tname }&grade=${grade }&title=${title}'
						+'&poster=${poster }&theaterNo=${theaterNo2}&movietime=${movietime}';">
					</td>
					<td align="right">
						<input type="button" value="다음페이지" onclick="send()">
					</td>
				</tr>
			</table>
		</form>	
	</div>	 
</body>
</html>