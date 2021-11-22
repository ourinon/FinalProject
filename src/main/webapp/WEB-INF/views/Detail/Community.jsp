<%@page import="java.util.List"%>
<%@page import="com.study.game.dto.BoardDTO"%>
<%@page import="com.study.game.dto.GameDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/inc/Header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/Community.css"
	type="text/css">
<style type="text/css">
/* body {
   background-image : url('https://cdn.akamai.steamstatic.com/steam/apps/1517290/header.jpg?t=1636732326');
   background-repeat: 
   background-size: cover;
} */
</style>
</head>
<body>
	<%
	List<BoardDTO> boardList = (List<BoardDTO>) request.getAttribute("boardList");
	%>
	<%
	GameDto game = (GameDto) request.getAttribute("game");
	%>
	<div class="container" style="background-color: #0b0c2a;">


		<div class="commu_top" style="margin-bottom: 10px;">

			<div class="blog__details__title" style="margin-bottom: 0px">
				<h2 style="margin-top: 10px;"><%=game.getProjectName()%></h2>

			</div>



			<div class="commu_logo">

				<!--    [리그오브 레전트] 커뮤니티 광고  -->
				<img src="<%=game.getTitleImg()%>" alt=""
					style="width: 1026px; height: 100%; border: 1px solid white;
    border-radius: 20px; ">



			</div>

			<%@ include file="/socket.jsp"%>

		</div>


		<div class="commu_btm">
			<div class="btm_con">
				<div class="top_part">
					<div class="section-title">
						<br /> <strong style="color: white;">전체글보기</strong>
						<%if(session.getAttribute("member") != null){%>
						<form action="<%=request.getContextPath()%>/gameInfo/create"
						method="get">
						<input type="hidden" name="GameId" value="<%=game.getGameId()%>" />
						
						<input type="submit" class="write_btn" value="글쓰기" />
						<%}else{ %>
						<button onclick="logingogo()" class="write_btn">글쓰기</button>
						<%} %>
						</form>
					</div>
					<table class="section_board ">
						<tr>
							<td>번호</td>
							<td>제목</td>
							<td>닉네임</td>
							<td>작성일</td>
							<td>조회수</td>
						</tr>

						<%
						for (int i = 0; i < boardList.size(); i++) {
						%>
						<tr>
							<td><a
								href="<%=request.getContextPath()%>/board/noticeDetail?seq=<%=boardList.get(i).getSeq()%>&GameId=<%=game.getGameId()%>"><%=boardList.get(i).getSeq()%></a>
							</td>
							<!--게시글 번호, 제목(장르+제목), 닉네임, 작성자, 조회수 -->
							<td><a
								href="<%=request.getContextPath()%>/board/noticeDetail?seq=<%=boardList.get(i).getSeq()%>&GameId=<%=game.getGameId()%>"> ( <%=boardList.get(i).gethhead()%> ) <%=boardList.get(i).getTitle()%></a>
							</td>
							<td><%=boardList.get(i).getwnick()%></td>
							<td><%=boardList.get(i).getWdate()%></td>
							<td><%=boardList.get(i).getViews()%></td>
						</tr>

						<%
						}
						%>
					</table>
				</div>
			</div>
		</div>
	</div>

<script>
function logingogo() {
	alert("로그인 후 이용해주세요");
	location.href = "/login";
}

</script>
</body>
</html>

<%@ include file="/inc/Foother.jsp"%>