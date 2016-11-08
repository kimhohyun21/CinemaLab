<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="sliderengine/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="movie/style.css">
</head>
<body>
	<div id="reply">
		<h3 align="left">평점 및 영화 리뷰</h3>
		<form action="reply_ok.do?no=${vo.mNo }" method="post" name="frm">
			<table id="reply_table" width="1000">
				<tr>
					<td width="20%" align="center">
						평점<br>
						<!-- <span class="star-input">
						   <span class="input">
						      <input type="radio" name="star-input" id="p1" value="1"><label for="p1">1</label>
						      <input type="radio" name="star-input" id="p2" value="2"><label for="p2">2</label>
						      <input type="radio" name="star-input" id="p3" value="3"><label for="p3">3</label>
						      <input type="radio" name="star-input" id="p4" value="4"><label for="p4">4</label>
						      <input type="radio" name="star-input" id="p5" value="5"><label for="p5">5</label>
						      <input type="radio" name="star-input" id="p6" value="6"><label for="p6">6</label>
						      <input type="radio" name="star-input" id="p7" value="7"><label for="p7">7</label>
						      <input type="radio" name="star-input" id="p8" value="8"><label for="p8">8</label>
						      <input type="radio" name="star-input" id="p9" value="9"><label for="p9">9</label>
						      <input type="radio" name="star-input" id="p10" value="10"><label for="p10">10</label>
						   </span><br>
						   <output for="star-input"><b name="score">0</b>점</output>
					  </span>	 -->
					  <input type="text" size="10" name="score">
					</td>
					<td width="69%">
						<textarea id="content" name="content" rows="6" cols="100" placeholder="영화 리뷰는 로그인 후에 작성하실 수 있습니다" wrap="hard" required></textarea>
					</td>
					<td width="11%">
						<input type="submit" value="입력" id="send" onclick="send()">
					</td>
				</tr>
			</table>
		</form>
		<ul id="ul">
			<c:forEach var="vo" items="${replyList }">
				<li>
					<div align="left" id="score">
						평점 : ${vo.score }
					</div>
					<div align="left" id="reContent">
						${vo.reContent }
					</div>
					<div align="left">
						<fmt:formatDate value="${vo.regDATE }" pattern="yyyy-MM-dd"/> &nbsp;|&nbsp;&nbsp;<span>${vo.id }</span>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
<script type="text/javascript">
	
	var starRating = function() {
		var $star = $(".star-input"), $result = $star.find("output>b");
		$(document).on("focusin", ".star-input>.input", function() {
			$(this).addClass("focus");
		}).on("focusout", ".star-input>.input", function() {
			var $this = $(this);
			setTimeout(function() {
				if ($this.find(":focus").length === 0) {
					$this.removeClass("focus");
				}
			}, 100);
		}).on("change", ".star-input :radio", function() {
			$result.text($(this).next().text());
		}).on("mouseover", ".star-input label", function() {
			$result.text($(this).text());
		}).on("mouseleave", ".star-input>.input", function() {
			var $checked = $star.find(":checked");
			if ($checked.length === 0) {
				$result.text("0");
			} else {
				$result.text($checked.next().text());
			}
		});
	};
	starRating();
</script>
</body>
</html>
						





















