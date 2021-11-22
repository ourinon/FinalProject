<%@page import="com.study.game.dto.GameDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.study.game.dto.BoardDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
GameDto game = (GameDto) request.getAttribute("game");
%>
<%@ include file="/inc/Header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/ReWrite.css"
	type="text/css">
</head>
<body>
	<div>
		<div class="container">
			<div class="commercial"></div>


			<form action="/board/noticeUpdate?seq=${board.seq}" method="post">
				<%
				System.out.println("GameId가 수정에 넘오오나? : " + request.getAttribute("GameId"));
				%>
				<%
				if (request.getAttribute("GameId") != null) {
				%>
				<input type="hidden" name="GameId"
					value="<%=request.getAttribute("GameId")%>" />
				<%
				}
				%>
				<table>
					<tr>
						<th colspan="4">
							<h3>글 수정</h3> <!--   <div class="section-title">
                                    <h4>글 수정</h4>
                                </div> --> <input type="submit"
							value="수정" /> <!-- <button type="button" onclick="redirectComm()">취소</button> -->
						</th>
					</tr>
					<tr>
						<th>제목</th>
						<td><input class="input_colr" type="text" name="title"
							value="${board.title }" /></td>

						<%
						if (request.getAttribute("GameId") != null) {
						%>
						<td><select class="category input_colr" name="hhead">
								<option value="말머리">말머리</option>
								<option value="업데이트">업데이트</option>
						</select></td>
						<%
						} else {
						%>

						<th>닉네임</th>
						<td><input class="input_colr" type="text" name="wnick"
							value="${board.wnick }" /></td>
						<%} %>

					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3"><textarea class="input_colr" rows="10"
								cols="50" name="content">${board.content }</textarea></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<!-- 	<div class="reply">
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
               </div> -->

	<script>
		function redirectComm() {
			if (
	<%=request.getAttribute("GameId")%>
		!= null) {
				location.href = '/gameInfo/community?GameId='
						+
	<%=request.getAttribute("GameId")%>
		} else {
				location.href = '/board/notice'
			}
		}
	</script>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
</body>
</html>
<%@ include file="/inc/Foother.jsp"%>