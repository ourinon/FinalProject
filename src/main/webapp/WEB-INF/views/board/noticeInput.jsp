<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.study.game.dto.BoardDTO"%>
<%@page import="com.study.game.dto.MemberDTO"%>
<%@page import="com.study.game.dto.GameDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/inc/Header.jsp"%>
<%MemberDTO member = (MemberDTO)session.getAttribute("member"); %>
<%
GameDto game = (GameDto) request.getAttribute("game");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main_style.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/Write.css"
	type="text/css">
</head>
<body>
	<div class="container">
		<div class="commercial"></div>
		<%System.out.println("공지사항에 뭐가 들어오나" + member.getM_nickname());%>
		<form action="/board/noticeInput" method="post">
			<table>
				<tr>
					<th colspan="4">
						<h3>카페 글쓰기</h3> <input type="submit" value="저장" />
					<!-- 	<button type="button" onclick="David()">취소</button> -->
					</th>
				</tr>
				<tr>
					<th>글제목</th>
					<!-- 장르 + 제목 -->
					<td><input type="hidden" name="target" value="0" /> <input
						type="text" name="title" value="" />
						<!-- <input type="hidden" name="writer_id123" value="0" /> -->
						<%-- <input type="hidden" name="wnick" value="<%=member.getM_nickname() %>"/> --%>
						</td>
						
				</tr>

				<tr>
					<th>내용</th>
					<td colspan="3"><textarea rows="10" cols="50" name="content"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
<script>
function David() {
	location.href = "/board/notice";
}
function logingogo() {
	location.href = "/login";
}

</script>

</body>
</html>

<br />
<br />
<%@ include file="/inc/Foother.jsp"%>