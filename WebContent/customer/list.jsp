<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>QNA List</title>
	<link rel="stylesheet" type="text/css" href="customer/style.css">
	<script type="text/javascript">
		function qnainsert(){
			if(${mvo==null}){
				$.jQueryLogin();
				return;
			}
			location.href='insert.do';
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
	<div align="center" class="bg">
		<table>
			<tr id="sub">
				<td>
					<a href="customer.do">
						<button class="list_btn">
							<span>QnA</span>
						</button>
					</a>
				</td>
				<td>
					<a href="faq.do">
						<button class="list_btn">
							<span>FAQ</span>
						</button>
					</a>
				</td>
			</tr>
		</table>
		<div id="qna_title">QnA</div>
		<hr>
		<table border="0" width="800">
			<tr align="left">
				<td>
					<button type="button" class="insert" onclick="qnainsert()">�۾���</button>
				</td>
			</tr>
		</table>
		<table class="list" width="800">
			<tr>
				<th width="10%" align="center">��ȣ</th>
				<th width="45%" align="center">����</th>
				<th width="15%" align="center">�̸�</th>
				<th width="20%" align="center">�ۼ���</th>
				<th width="10%" align="center">��ȸ��</th>
			</tr>
		<c:forEach var="vo" items="${list}">
			<tr>
				<td width="10%" align="center">${vo.qno}</td>
				<td width="45%" align="left" class="subject">
					
					<c:if test="${vo.group_tab!=0}">
						<c:forEach var="i" begin="1" end="${vo.group_tab}">
							&nbsp;&nbsp;
							<img alt="reply" src="customer/img/icon_reply.gif">
						</c:forEach>
					</c:if>
					<c:if test="${msg eq vo.qsubject}">
					<span>${vo.qsubject}</span>
					</c:if>
					
					<c:if test="${msg ne vo.qsubject}">
						<a href="content.do?no=${vo.qno}&page=${page }">${vo.qsubject}</a>
					</c:if>
				</td>
				<td width="15%" align="center">${vo.name}</td>
				<td width="20%" align="center">
					<fmt:formatDate value="${vo.qregdate}" pattern="yyyy-MM-dd"/>
				</td>
				<td width="10%" align="center">${vo.qhit}</td>
			</tr>
			</c:forEach>
		</table>
		<table width="800">
			<tr>
				<td align="right">
					<a href="customer.do?page=${page>1?page-1:page}" style="color: red">����</a>
					&nbsp;
					<a href="customer.do?page=${page<totalpage?page+1:page}" style="color: blue">����</a>
					&nbsp;&nbsp;
					${page} page / ${totalpage} pages
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
