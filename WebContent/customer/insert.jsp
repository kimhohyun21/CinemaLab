<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="customer/style.css">
<script type="text/javascript">		
	function send(){
		var f=document.frm;
		
		if(f.subject.value==""){
			alert("������ �Է��Ͻÿ�");
			f.subject.focus();
			return;
		}
		
		if(f.content.value==""){
			alert("������ �Է��Ͻÿ�");
			f.content.focus();
			return;
		}
		f.submit();
	}
</script>
</head>
<body>
	<div align="center" class="bg">
		<h3>�۾���</h3>
		<form action="insert_ok.do" method="post" name="frm">
			<table width="500" id="insert_table">
				<tr height="27">
					<td width="20%" align="center" class="insert_td">�̸�</td>
					<td width="80%" align="left">
						<input type="text" size="10" name="name" value="${mvo.name}">
						<input type="hidden" size="10" name="no" value="${mvo.no}">
					</td>
				</tr>
				<tr height="27">
					<td width="20%" align="center" class="insert_td">����</td>
					<td width="80%" align="left">
						<input type="text" size="45" name="subject">
					</td>
				</tr>
				<tr height="27">
					<td width="20%" align="center" class="insert_td">����</td>
					<td width="80%" align="left">
						<textarea rows="8" cols="50" name="content"></textarea>
					</td>
				</tr>
			</table>
			<table width="500">
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="�۾���" onclick="send()" class="insert_btn">
						<input type="button" value="���" onclick="javascript:history.back()" class="cancel_btn">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>