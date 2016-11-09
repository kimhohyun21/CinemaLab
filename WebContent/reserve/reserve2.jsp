<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Ticket and Seat</title>
	<link rel="stylesheet" type="text/css" href="reserve/style2.css">
	<script type="text/javascript">
		function select(){			
			$.ajax({
				type: "POST",
				url: "reserve2.do",
				data:$('#frm').serialize(),
				success:function(data){
					$('#result').html(data);
				},
				error:function(data){
					alert("실패");
				}
			});
		};	
	
		$('document').ready(function(){
			$('select').click(function(){
				if(${mvo==null}){
					$.jQueryLogin();
					return;
				}
			});
		});				
				
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
		
		//로그인 창 값입력 체크
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
	<div align="center" class="reserve2">
		<!-- 티켓 매수 선택 -->
		<div class="ticket">
			<form id="frm">
				<input type="hidden" name="year" value="${year }">
				<input type="hidden" name="month" value="${month }">
				<input type="hidden" name="checkedDay" value="${checkedDay }">
				<input type="hidden" name="checkedDay2" value="${checkedDay2 }">
				<input type="hidden" name="local" value="${local }">
				<input type="hidden" name="tname" value="${tname }">
				<input type="hidden" name="grade" value="${grade }">
				<input type="hidden" name="title" value="${title }">
				<input type="hidden" name="poster" value="${poster }">				
				<input type="hidden" name="theaterNo" value="${theaterNo}">
				<input type="hidden" name="movietime" value="${movietime}">
				<input type="hidden" name="rType" value="seat">
				<strong>어른</strong>
				<select id="adult" name="adult" onchange="select()">
					<option selected="selected">0</option>
				<c:forEach var="i" begin="1" end="8">
					<option>${i}</option>
				</c:forEach>					
				</select>
				<strong>청소년</strong>
				<select id="junior" name="junior" onchange="select()">
					<option selected="selected">0</option>
				<c:forEach var="i" begin="1" end="8">
					<option>${i}</option>
				</c:forEach>					
				</select>
				<strong>시니어</strong> 
				<select id="senior" name="senior" onchange="select()">
					<option selected="selected">0</option>
				<c:forEach var="i" begin="1" end="8">
					<option>${i}</option>
				</c:forEach>					
				</select>
			</form>
			<!-- 선택 초기화 버튼 -->
			<span class="resetBtn">
				<a href="reserve2.do?year=${year }&month=${month }&checkedDay=${checkedDay}
				&checkedDay2=${checkedDay2}&local=${local }&tname=${tname }&grade=${grade }&title=${title}
				&poster=${poster }&theaterNo=${theaterNo2}&movietime=${movietime}">
					선택초기화
				</a>
			</span>
		</div>
		<!-- 자리 선택  include-->
		<div id="result">
			<jsp:include page="${jsp2 }"></jsp:include>		
		</div>			
	</div>
</body>
</html>