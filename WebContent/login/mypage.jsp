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
						예매내역
					</a>
				</td>
			</tr>
			<tr>
				<td>
					<a href="modify.do">
						회원정보 수정
					</a>
				</td>
			</tr>
			<tr>
				<td>
					<a href="changepwd.do">
						비밀번호 수정
					</a>
				</td>
			</tr>
			<tr>
				<td>
					<a href="delete.do">
						회원탈퇴
					</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>