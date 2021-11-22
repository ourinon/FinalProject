<%@page import="com.study.game.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원목록 조회 페이지</h1>
		<table border="1">
			<tr>
				<th>회원번호</th>
				<th>이메일</th>
				<th>비밀번호</th>
				<th>닉네임</th>
				<th>이름</th>
				<th>삭제</th>
			</tr>
			<c:forEach items="${memberList}" var="user">
				
					<tr>
						<td>${user.m_id }</td>
						<%
						MemberDTO member = (MemberDTO) session.getAttribute("member");
						MemberDTO user = (MemberDTO) pageContext.getAttribute("user");
						if (!(user.getM_nickname().equals(member.getM_nickname()))) {
						%>
						<td><span>${user.m_email }</span></td>
						<%
						} else {
						%>
						<td><span style="color:blue; font-weight:bold">${user.m_email }</span></td>
						<%
						}
						%>
						<td>${user.m_pw }</td>
						<td>${user.m_nickname }</td>
						<td>${user.m_name }</td>
						<%
						if (!(user.getM_nickname().equals(member.getM_nickname()))) {
						%>
						<form action="<%=request.getContextPath()%>/myPage/adminRemove" method="post">
							<td>
								<input type="hidden" name="m_id" value="${user.m_id }" /></input>
								<input type="submit" value="회원삭제" class="remove" /></input>
							</td>
						</form>
						<%
						} else {
						%>
						<td>관리자</td>
						<%
						}
						%>
					</tr>
			</c:forEach>
			<tr>
				<td colspan="6">
					<input type="button" value="돌아가기" onclick="location.href = '/'" /></input>
				</td>
			</tr>
		</table>
</body>
</html>