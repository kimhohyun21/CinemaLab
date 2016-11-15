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
	function num(){
		if( (event.keyCode<48)||(event.keyCode>57) ){
			event.returnValue=false;
		}
	}
	function re(){
		top.document.location.reload();
	}
</script>
</head>
<body>
	<div align="center">
	<form action="Amodify_Ok.do" name="frm" method="post">
		<table width="700" height="300" class="TT">
			<tr>
				<th align="right">
					<input type="hidden" value="${no }"	name="no">
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
							<option value="12">12</opticon>
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
					<input type=text value="${year }" name="year" size="1" placeholder="�⵵" onkeypress="num()">
					<b>- </b><input type="text" value="${month }" name="month" size="1" placeholder="��" onkeypress="num()">
					<b>- </b><input type="text" value="${day }" name="day" width="10"  size="1" placeholder="��" onkeypress="num()">
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
					����
				</th>
				<td align="left">
					<input type="text" value="${vo.director }" name="director">
				</td>
				<th align="right">
					�󿵽ð�
				</th>
				<td align="left">
					<input type="text" value="${vo.runtime }" size="1" name="runtime" onkeypress="num()">��
				</td>
			</tr>
			<tr>
				<th align="right">
					�帣
				</th>
				<td colspan="2">
					<input type="text" value="${vo.genre }" name="genre" style="width: 90%">
				</td>
			</tr>
			<tr>
				<th align="right">
					������
				</th>
				<td align="left" colspan="3">
					<input type="text" value="${vo.trailer }" name="trailer" style="width:90%">
				</td>
			</tr>
			<tr>
				<th align="right">
					�⿬�ι�
				</th>
				<td align="left">
					<pre><textarea style="width: 100%" cols="50" rows="10" name="cast">${vo.content }</textarea></pre>
				</td>
			</tr>
			<tr>
				<th>
					�ٰŸ�
				</th>
				<td colspan="3">
					<pre><textarea style="width: 95%" cols="50" rows="10" name="content">${vo.content }</textarea></pre>
				</td>
			</tr>
			<tr>
				<td align="right">
					<input type="button" value="�ʱ�ȭ" onclick="re()">
				</td>
				<td align="center">
					<input type="button" value="����" onclick="send()">
				</td>
				<td align="left" colspan="2">
					<input type="button" value="���" onclick="javascript:history.back()">
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>