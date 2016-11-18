<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="movie/style.css">
<script type="text/javascript">
	//��� ���� �Է��� �� �α��� �ߴ��� üũ 
	function loginCheck(){
		if(${mvo==null}){
			$.jQueryLogin();
			return;
		}
	}
	
	 /* ���� üũ �ߴ��� Ȯ�� */
    function replycheck(){
    	/* �α��� ���� üũ */
		if(${mvo==null}){
			$.jQueryLogin();
			return;
		} 
    	/*����üũ*/    	
    	var f=document.frm;
    	if($(':input[name=star-input]:radio:checked').val()==null){
    		$.jQueryAlert('������ üũ�� �ּ���.');
    		return;
    	}
    	if(f.content.value==""){
    		$.jQueryAlert('������ �Է��� �ּ���.');
    		return;
    	}
    	console.log($('textarea.mcont').val());
    	f.submit();
    }
    
    /* ��� ���� ��ư Ŭ�� �� �� ������*/ 
    function replydelete(reNo){
       	location.href="replyCheck.do?no=${vo.mNo}&reNo="+reNo;
    }
	
	/*jQuery Login*/
	jQuery.jQueryLogin = function (){
		var $loginform = $.parseHTML('<div id="logindiv">'
										+'<form name="loginfrm" action="login_ok.do" method="post" "id="loginfrm">'
										+'<div class="input">'
										+'<label class="idlabel" for="id">ID</label>'
										+'<input type="text" placeholder="���̵� �Է��ϼ���." name="id" id="id" onkeydown="enter()">'
										+'</div>'+'<div class="input">'
										+'<label class="pwlabel" for="pwd">PW</label>'
										+'<input type="password" placeholder="�н����带 �Է��ϼ���." name="pwd" id="pwd" onkeydown="enter()">'
										+'</div><input type="hidden" name="loginType" value="reserve">'
										+'</form><div id="find">'
										+'<a href="searchId.do">���̵� ã��</a>&nbsp;|&nbsp;'
										+'<a href="searchPwd.do">��й�ȣ ã��</a></div>');
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
	
	//���� �α���
	function enter(){
		if(window.event.keyCode == 13){
			login();
		}
	}
	
	//�α��� â �� �Է� üũ
	function login(){
		var f=document.loginfrm;	
		if(f.id.value==""){
			$.jQueryAlert("���̵� �Է��ϼ���");
			f.id.focus();
			return;
		}
		if(f.pwd.value==""){
			$.jQueryAlert("��й�ȣ�� �Է��ϼ���");
			fs.pwd.focus();
			return;
		}
		f.submit();
	}
	
	/* jQuery Alert â */
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
    }  
</script>
</head>
<body>
	<div id="reply">
		<h3 align="left">���� �� ��ȭ ����</h3>
		<!-- ����� �ѹ��� �Է����� �ʾҴ� ������Ը� �Է�â�� �����. -->
		<c:if test="${check=='0'}">
		<form action="replyCheck.do?no=${vo.mNo }&page=${curpage}" method="post" name="frm">	
			<table id="reply_table" width="1000">
				<tr>
					<td width="20%" align="center">
						����<br>
						<span class="star-input">
							<span class="input">
								<input type="radio" name="star-input" id="p1" value="1"><label for="p1">1</label>
								<input type="radio" name="star-input" id="p2" value="2"><label for="p2">2</label>
								<input type="radio" name="star-input" id="p3" value="3"><label for="p3">3</label>
								<input type="radio" name="star-input" id="p4" value="4"><label for="p4">4</label>
								<input type="radio" name="star-input" id="p5" value="5"><label for="p5">5</label>
								<input type="radio" name="star-input" id="p6" value="6"><label for="p6">6</label>
								<input type="radio" name="star-input" id="p7" value="7"><label for="p7">7</label>
								<input type="radio" name="star-input" id="p8" value="8"><label for="p8">8</label>
								<input type="radio" name="star-input" id="p9" value="9"><label for="p9">9</label>
								<input type="radio" name="star-input" id="p10" value="10"><label for="p10">10</label>
					   		</span><br>
					   		<output for="star-input"><b name="score">0</b>��</output>
				  		</span>	
					</td>
					<td width="69%">
					<c:if test="${mvo==null }">	
						<textarea name="content" class="mcont" rows="6" cols="100" placeholder="��ȭ ����� �α��� �Ŀ� �ۼ��Ͻ� �� �ֽ��ϴ�" wrap="hard" required onclick="loginCheck();"></textarea>
					</c:if>
					<c:if test="${mvo!=null }">	
						<textarea name="content" class="mcont" rows="6" cols="100" wrap="hard" required onclick="loginCheck();"></textarea>
					</c:if>
					</td>
					<td width="11%">
						<input type="button" value="�Է�" id="send" onclick="replycheck()">
					</td>
				</tr>
			</table>
		</form>
		</c:if>
		
		<ul id="ul">
			<c:forEach var="vo" items="${replyList }">
				<li>
					<div align="left" id="score">
						&nbsp;${vo.score }
						<!-- �޸� ��ۿ� ���� ǥ�� -->
						<div style="CLEAR: both;	PADDING-RIGHT: 0px;	PADDING-LEFT: 0px;	BACKGROUND: url(movie/img/icon_star2.gif) 0px 0px;	FLOAT: left;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	WIDTH: 90px;	PADDING-TOP: 0px;	HEIGHT: 18px;">
							<p style="WIDTH: ${vo.score*10}%; PADDING-RIGHT:0px;	PADDING-LEFT:0px;	BACKGROUND: url(movie/img/icon_star.gif) 0px 0px;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	PADDING-TOP: 0px;	HEIGHT: 18px;"></p>
						</div>
					</div>
					<div align="left" id="reContent">
						${vo.reContent }
					</div>
					<div align="left">
						<fmt:formatDate value="${vo.regDATE }" pattern="yyyy-MM-dd"/> &nbsp;|&nbsp;&nbsp;<span>${vo.id }</span>
						<c:if test="${mvo.id eq vo.id }"> <!-- �α����� ���̵�� ��� ���̵�� ���� ��� ��� ���� ��ư ������ -->
							<input class="replyDeleteBtn" type="button" value="��ۻ���" onclick="replydelete('${vo.reNo}')">	
						</c:if>
					</div>
				</li>
			</c:forEach>
		</ul>
		
		<!-- ��� ������ -->
		<table width="1000">
			<tr>
				<td align="right">
					<a href="moviedetail.do?page=${1 }&no=${vo.mNo}">
						<img src="movie/img/begin.gif">
					</a>
					<c:if test="${curpage>block }">
						<a href="moviedetail.do?page=${frompage-1 }&no=${vo.mNo}">
							<img src="movie/img/prev.gif">
						</a>
					</c:if>
					<c:if test="${curpage<=block }">
						<a href="moviedetail.do?page=${curpage>1 ? curpage-1 : 1}&no=${vo.mNo}">
							<img src="movie/img/prev.gif">
						</a>
					</c:if>
					<c:forEach var="i" begin="${frompage }" end="${topage }">
						[<c:if test="${curpage==i }">
							<font color="red">${i }</font>
						</c:if>
						<c:if test="${curpage!=i }">
							<a href="moviedetail.do?page=${i }&no=${vo.mNo}">${i }</a>
						</c:if>]
					</c:forEach>
					<c:if test="${topage<totalpage }">
						<a href="moviedetail.do?page=${topage+1 }&no=${vo.mNo}">
							<img src="movie/img/next.gif">
						</a>
					</c:if>
					<c:if test="${topage>=totalpage }">
						<a href="moviedetail.do?page=${curpage<totalpage ? curpage+1 : totalpage}&no=${vo.mNo}">
							<img src="movie/img/next.gif">
						</a>
					</c:if>
					<a href="moviedetail.do?page${totalpage }&no=${vo.mNo}">
						<img src="movie/img/end.gif">
					</a>
					&nbsp;
					${curpage } page / ${totalpage } pages
				</td>
			</tr>
		</table>
	</div>
	
	<!-- ���� -->
	<script type="text/javascript">	
		var starRating = function() {
			var $star = $(".star-input"), $result = $star.find("output>b");
			$(document).on("focusin", ".star-input>.input", function() {
				$(this).addClass("focus");
			}).on("focusout", ".star-input>.input", function() {
				var $this = $(this);
				setTimeout(function() {
					if ($this.find(":focus").length === 0) {
						$this.removeClass("focus");
					}
				}, 100);
			}).on("change", ".star-input :radio", function() {
				$result.text($(this).next().text());
			}).on("mouseover", ".star-input label", function() {
				$result.text($(this).text());
			}).on("mouseleave", ".star-input>.input", function() {
				var $checked = $star.find(":checked");
				if ($checked.length === 0) {
					$result.text("0");
				} else {
					$result.text($checked.next().text());
				}
			});
		};
		starRating();
	</script>
</body>
</html>
						





















