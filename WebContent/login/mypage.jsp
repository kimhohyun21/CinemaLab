<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<input type="hidden" value="${mvo.birth }" name="birth">
	<div align="left">
		<table id="left_menubar" border="1" width="200">
			<tr>
				<td>
					<a href="#">
						���ų���
					</a>
				</td>
			</tr>
			<tr>
				<td>
					<a href="modify.do">
						ȸ������ ����
					</a>
				</td>
			</tr>
			<tr>
				<td>
					<a href="changepwd.do">
						��й�ȣ ����
					</a>
				</td>
			</tr>
			<tr>
				<td>
					<a href="delete.do">
						ȸ��Ż��
					</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>