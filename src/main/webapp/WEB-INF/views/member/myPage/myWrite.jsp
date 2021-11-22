<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="com.study.game.dto.BoardDTO"%>
<%@page import="com.study.game.dto.MemberDTO "%>
<%@page import="com.study.game.dto.ReviewDTO"%>
<%@ include file="/inc/Header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%MemberDTO member = (MemberDTO)session.getAttribute("member"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/Notice.css"
   type="text/css">
</head>
<body>

   <div class="container">
      <div class="noti_top">
         <div class = "commercial">
         </div>
      </div>

      <div class="noti_btm">
         <div class="noti_list">
            <div class="section-title">
               <br />
               <h4>내 글 보기</h4>
            </div>
            <!-- <p>
                  <strong style="color: white;">전체글보기</strong>
               </p> -->
            <table class="section_board ">
               <tr>
                  <td>번호</td>
                  <td>제목</td>
                  <td>닉네임</td>
                  <td>작성일</td>
                  <td>조회수</td>
               </tr>

               <c:forEach var="board" items="${boardList }">
                  <tr>
                     <td>
                     <a href="<%=request.getContextPath() %>/board/noticeDetail?seq=${board.seq}">${board.seq}</a>    
                     </td> <!--게시글 번호, 제목(장르+제목), 닉네임, 작성자, 조회수 -->
                     <td><a href="<%=request.getContextPath() %>/board/noticeDetail?seq=${board.seq}">${board.title }</a>
                     </td>
                     <td>${board.wnick }</td>
                     <td>${board.wdate }</td>
                     <td>${board.views }</td>
                  </tr>
               </c:forEach>
            </table>
         </div>
         <br><br><br><br>
         <br><br><br><br><br><br><br>


</body>
</html>

<%@ include file="/inc/Foother.jsp"%>
