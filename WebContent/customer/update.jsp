<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="customer/style.css">
	<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->
	<script type="text/javascript">
		$(function(){
			$('#sendBtn').click(function(){
				send();
			});
			
			$('input').keypress(function(key) {
				if(key.keyCode == 13){
					send();
				}
			});
				send=function(){
				var subject=$('#subject').val();
				if(subject.trim()==""){
					$('#subject').focus();
					alert('제목을 입력하세요.');
					$('#subject').val("");
					return;
				}
				var content=$('#content').val();
				if(content.trim()==""){
					$('#content').focus();
					alert('내용을 입력하세요.');
					$('#content').val("");
					return;
				}	
				$('#frm').submit();
			};
		});
	</script>
</head>
<body>
	<div align="center" class="bg">
		<div id="article">
			<h3>수정하기</h3>
			<form action="update_ok.do" method="post" name="frm" id="frm">
				<table id="insert_table">
					<tr height="27">
						<th width="20%" align="center">이름</th>
						<td width="80%" align="left">
							<input type="text" size="10" name="name" value="${mvo.name}">
							<input type="hidden" size="10" name="no" value="${no}">
							<input type="hidden" size="10" name="page" value="${page}">
						</td>
					</tr>
					<tr>
						<th width="20%">제목</th>
						<td>
							<input type="text" size="50" value="${vo.qsubject }" name="subject" id="subject">
						</td>
					</tr>
					<tr >
						<th width="20%">내용</th>
						<td>
							<div style="block">
								<textArea cols="70" rows="20" name="content" id="content" >${vo.qcontent }</textArea>
							</div>
						</td>
					</tr>
				</table>
				<table class="button_table" width="50%">
					<tr>
						<td align="center">
							<input type="button" value="수정하기" id="sendBtn" class="btn_normal2">
							<input type="reset" value="취소" onclick="javascript:history.back()" class="btn_normal2">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>