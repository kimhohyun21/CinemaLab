<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Marvel Cinema</title>
	<link rel="stylesheet" type="text/css" href="movie/style.css">
	<script type="text/javascript">

	</script>
</head>
<body>
	<div align="center">
		<table>
			<tr>
				<table>
					<tr>
						<td>
							<a href="movieList.do?type=0">
								<button class="past_btn">
									<img src="">
									<span class="past">���� ��ǥ ��ȭ</span>
								</button>
							</a>&nbsp;&nbsp;
							<a href="movieList.do?type=1">
								<button class="present_btn">
									<img src="">
									<span class="present">���� �� ��ȭ</span>
								</button>
							</a>&nbsp;&nbsp;
							<a href="movieList.do?type=2">
								<button class="future_btn">
									<img src="">
									<span class="future">�� ���� ��ȭ</span>
								</button>
							</a>
						</td>
					</tr>
				</table>
				<table>
					<td align="center" class="link">
						<table border="2">
							<tr>
								<td colspan="2">
									<a href="movie_detail.jsp">
										<img src="http://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/201610/10707_103_1.jpg" width="200" height="180" border="0">
									</a>
								</td>
							</tr>
							<tr>
								<td align="center" colspan="2">					
								<span class="grade">15</span>
									��Ű
								</td>
							</tr>
							<tr>
								<td align="center">
									������48.4
								</td>
								<td align="center">
									���� 8.4
								</td>
							</tr>
						</table>&nbsp;&nbsp;
					</td>
					<td align="center" class="link">
						<table border="2">
							<tr>
								<td colspan="2">
									<a href="movie_detail.jsp">
										<img src="http://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/201610/10707_103_1.jpg" width="200" height="180" border="0">
									</a>
								</td>
							</tr>
							<tr>
								<td align="center" colspan="2">					
								<span class="grade">15</span>
									��Ű
								</td>
							</tr>
							<tr>
								<td align="center">
									������48.4
								</td>
								<td align="center">
									���� 8.4
								</td>
							</tr>
						</table>&nbsp;&nbsp;
					</td>
				</table>
			</tr>
		</table>
	</div>
</body>
</html>