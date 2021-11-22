<%@page import="com.study.game.dto.GameDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.study.game.dto.BoardDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/inc/Header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/Particular.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main_style.css"
	type="text/css">

<body>
	<div class="container">

		<div class="commercial"></div>
		<!-- <h1>게시판 상세 정보</h1> -->


		<%
		if (request.getAttribute("GameId") != null) {
		%>
		<div class="section-title">
			<br /> <br /> <br />

			<h4 style="font-size: 50px;">게임게시판</h4>
			<br /> <br />
		</div>
		<button
			onclick="location.href = '/gameInfo/community?GameId=<%=request.getAttribute("GameId")%>'">게시판
			목록</button>

		<%
		} else {
		%>
		<div class="section-title">
			<br /> <br /> <br />

			<h4 style="font-size: 50px;">공지사항</h4>
			<br /> <br />
		</div>
		<button onclick="location.href = '/board/notice'">게시판 목록</button>
		<%
		}
		%>

		<%
		if (request.getAttribute("GameId") != null) {
		%>
		<button class="rewrite"
			onclick="location.href = 'noticeUpdate?seq=${board.seq}&GameId=<%=request.getAttribute("GameId")%>'">수정하기</button>

		<%
		} else {
		%>

		<button class="rewrite"
			onclick="location.href = 'noticeUpdate?seq=${board.seq}'">수정하기</button>
		<%
		}
		%>




		<form action="/board/noticeDelete?seq=${board.seq }" method="post">

			<%
			if (request.getAttribute("GameId") != null) {
			%>
			<input type="hidden" name="GameId"
				value="<%=request.getAttribute("GameId")%>" />
			<%
			}
			%>
			<input type="submit" value="삭제" />
		</form>


		<table>
			<tr>
				<td rowspan="2"
					style="height: 100px; width: 150px; position: relative;">
					<div id="profile" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
					<img src="${board.wimg }" style="border-radius: 100px;" alt="alert">
					</div>
				</td>
				<th colspan="6"><p
						style="height: 40px; font-size: 48px; margin-bottom: 0px; margin-top: 25px; color: white;">${board.title }</p></th>
			</tr>
			<tr style="height: 60px; display: flex;">
				<td style="height: 24px;">작성자 :  ${board.wnick }</br>작성일 :  ${board.wdate }</br>조회수 :  ${board.views }</td>
			</tr>
			<tr>
				<th colspan="8" height="100px"
					style="border-top: 1px solid #1d1e39; padding-left: 20px">${board.content }</th>
			</tr>
		</table>
		<%
		if (request.getAttribute("GameId") != null) {
		%>
		<div class="reply">
			<form action="#">
				<textarea placeholder="Your Comment"></textarea>
				<button type="submit">
					<i class="fa fa-location-arrow"></i> 리뷰
				</button>
			</form>

			<div class="reply_list">
				<div class="reply_box">
					<div class="user_pic">
						<img src="img/anime/review-1.jpg" alt="">
					</div>
					<div class="user_review">
						<h6>
							Chris Curry - <span>1 Hour ago</span>
						</h6>
						<p>whachikan Just noticed that someone categorized this as
							belonging to the genre "demons" LOL</p>
					</div>
				</div>
				<div class="reply_box">
					<div class="user_pic">
						<img src="img/anime/review-1.jpg" alt="">
					</div>
					<div class="user_review">
						<h6>
							Chris Curry - <span>1 Hour ago</span>
						</h6>
						<p>whachikan Just noticed that someone categorized this as
							belonging to the genre "demons" LOL</p>
					</div>
				</div>
				<div class="reply_box">
					<div class="user_pic">
						<img src="img/anime/review-1.jpg" alt="">
					</div>
					<div class="user_review">
						<h6>
							Chris Curry - <span>1 Hour ago</span>
						</h6>
						<p>whachikan Just noticed that someone categorized this as
							belonging to the genre "demons" LOL</p>
					</div>
				</div>
			</div>
		</div>
		<%
		}
		%>
	</div>
	<script type="text/javascript">
		window.onload = function() {
			document.getElementById("profile").style.backgroundImage = "url('asdasd')";
		}
	</script>
</body>
</html>

<br />
<br />
<%@ include file="/inc/Foother.jsp"%>