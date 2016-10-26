<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>��ȭ ��</title>
	<link rel="stylesheet" type="text/css" href="movie/style.css">
</head>
<body>
	<div align="center">
		<table border="0" id="cont">
						<tr>
							<td width="250" align="center" rowspan="5">
								<img src="${vo.poster}" width="200" height="270">
								<a href="reserve.do?">
									<button class="reserve_btn">
										<span class="list">�����ϱ�</span>
									</button>
								</a>
							</td>
							<td>
								<span class="title_2">${vo.title }</span><br>
							</td>
						</tr>
						<tr>
							<td>
								<span>������ :</span> ${vo.rank }%&nbsp;&nbsp;
							</td>
							<td>
								<span>��� :</span> ${vo.grade }���̻� ��������&nbsp;&nbsp;
							</td>
						</tr>
						<tr>
							<td>
								<span>���� ���� :</span> ${vo.movieLike }&nbsp;&nbsp;
								<span>������ :</span><fmt:formatDate value="${vo.opendate }" pattern="yyyy-MM-dd"/><br>
								<span>�帣 :</span> ${vo.genre }&nbsp;&nbsp;
								<span>�� �ð� :</span> ${vo.runtime }&nbsp;&nbsp;
								<span>���� :</span> ${vo.director }<br>
								<span>�⿬ :</span> ${vo.cast }<br>
								<span>�ٰŸ� : </span><pre>${vo.content }</pre>
							</td>
						</tr>
					</table>
		<iframe width="640" height="360" src="http://www.youtube.com/embed/${url }" frameborder="0" allowfullscreen/>
	</div>
</body>
</html>