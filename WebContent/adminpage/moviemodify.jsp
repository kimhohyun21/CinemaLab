<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function send(){
		var f=document.frm;
		
		f.submit();
}
</script>
</head>
<body>
	<div align="center">
	<form action="main.do" name="frm">
		<table width="600" height="300" class="TT">
			<tr>
				<th align="right">
					����
				</th>
				<td align="left">
					<input type="text" value="${vo.title }" name="title" size="30">					
				</td>
				<th align="right">
					��û����
				</th>
				<td align="left">
					<select name="grade">
						<option>����</option>						
						<c:if test="${vo.grade eq '12' }">
							<option value="12" selected="selected">12</option>
							<option value="15">15</option>
							<option value="18">18</option>
						</c:if>
						<c:if test="${vo.grade eq '15' }">
							<option value="12">12</option>
							<option value="15" selected="selected">15</option>
							<option value="18">18</option>
						</c:if>
						<c:if test="${vo.grade eq '18' }">
							<option value="12">12</option>
							<option value="15">15</option>
							<option value="18" selected="selected">18</option>
						</c:if>
					</select>
					��
				</td>
			</tr>
			
			<tr>
				<th align="right">
					������ URL
				</th>
				<td align="left" colspan="3">
					<input type="text" value="${vo.poster }" name="poster" style="width:100%">
				</td>
			</tr>
			
			<tr>
				<th align="right">
					����
				</th>
				<td align="left">					
					<input type="number" value="${year }" name="year" size="1" placeholder="�⵵">
					<b>- </b><input type="number" value="${month }" name="month" size="1" placeholder="��">
					<b>- </b><input type="number" value="${day }" name="day" size="1" placeholder="��">
				</td>
				<th align="right">
					������
				</th>
				<td align="left">
					<select name="type">
						<option>����</option>
						<c:if test="${vo.type eq '0' }">
							<option value="0" selected="selected">������</option>
							<option value="1">����</option>
							<option value="2">�󿵿���</option>
						</c:if>
						<c:if test="${vo.type eq '1' }">
							<option value="0">������</option>
							<option value="1" selected="selected">����</option>
							<option value="2">�󿵿���</option>
						</c:if>
						<c:if test="${vo.type eq '2' }">
							<option value="0">������</option>
							<option value="1">����</option>
							<option value="2" selected="selected">�󿵿���</option>
						</c:if>
					</select>					
				</td>
			</tr>
			
			<tr>
				<th align="right">
					�󿵽ð�
				</th>
				<td align="left">
					<input type="text" value="${vo.runtime }" size="1">��
				</td>
			</tr>
			<tr>
				<th>
					�ٰŸ�
				</th>
				<td colspan="3">
					<textarea style="width: 100%" cols="50" rows="10">
${vo.content }
					</textarea>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<input type="button" value="����" onclick="send()">
				</td>
				<td align="center" colspan="2">
					<input type="button" value="���" onclick="javascript:history.back()">
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>