<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="adminpage/test.css">
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
</script>
</head>
<body>
	<div align="center">
	<form action="AmovieInsert_ok.do" name="frm" method="post">
		<table width="700" height="300" class="type02">
			<thead>
				<tr>
					<td align="center" colspan="4">
						��ȭ���
					</td>
				</tr>
			</thead>
			<tr>
				<th align="right">
					<input type="hidden" name="no">
					����
				</th>
				<td align="left">
					<input type="text" name="title" size="30">					
				</td>
				<th align="right">
					��û����
				</th>
				<td align="left">
					<select name="grade">
						<option>����</option>	
							<option value="12">12</option>
							<option value="15">15</option>
							<option value="18">18</option>						
					</select>
					��
				</td>
			</tr>
			
			<tr>
				<th align="right">
					������ URL
				</th>
				<td align="left" colspan="3">
					<input type="text" name="poster" style="width:95%" 
					placeholder="ex)http://movie.phinf.naver.net/20111223_44/1324635585945KDOJ5_JPEG/movie_image.jpg">
				</td>
			</tr>
			
			<tr>
				<th align="right">
					����
				</th>
				<td align="left">					
					<input type=text name="year" size="1" placeholder="�⵵" onkeypress="num()"><b>- </b>
					<input type="text" name="month" size="1" placeholder="��" onkeypress="num()"><b>- </b>
					<input type="text" name="day" width="10"  size="1" placeholder="��" onkeypress="num()">
				</td>
				<th align="right">
					������
				</th>
				<td align="left">
					<select name="type">
						<option>����</option>
						<option value="0">������</option>
						<option value="1">����</option>
						<option value="2">�󿵿���</option>						
					</select>					
				</td>
			</tr>
			
			<tr>
				<th align="right">
					����
				</th>
				<td align="left">
					<input type="text" name="director">
				</td>
				<th align="right">
					�󿵽ð�
				</th>
				<td align="left">
					<input type="text" size="1" name="runtime" onkeypress="num()">��
				</td>
			</tr>
			<tr>
				<th align="right">
					�帣
				</th>
				<td colspan="3">
					<input type="text" name="genre" style="width: 90%" placeholder="ex)�׼�,��Ÿ��,SF,����">
				</td>
			</tr>
			<tr>
				<th align="right">
					������
				</th>
				<td align="left" colspan="3">
					<input type="text" name="trailer" style="width:90%" placeholder="ex)https://youtu.be/awyG1-xvqFY">
				</td>
			</tr>
			<tr>
				<th align="right">
					�⿬�ι�
				</th>
				<td align="left" colspan="3">
					<input type="text" name="cast" style="width:90%"
					placeholder="ex)ũ���� �𽺿���(�丣), ��Ż�� ��Ʈ��(���� ������), �� ���齺��(��Ű) ��">
				</td>
			</tr>
			<tr>
				<th align="right">
					�ٰŸ�
				</th>
				<td colspan="3">
					<pre><textarea style="width: 95%" cols="50" rows="10" name="content"></textarea></pre>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="4">
					<input type="button" value="����" onclick="send()" class="table_btn">
					<input type="button" value="���" onclick="javascript:history.back()" class="table_btn">
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>