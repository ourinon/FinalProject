<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/inc/Header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/Particular.css"
   type="text/css">
</head>
<body>
   <div class="container">
      <div class="top">
         <div id="chat">
           <%--  <%@ include file="/socket.jsp" %> --%>
         </div>
      </div>

      <div class="bottom">
         <button onclick="location.href = 'list.do'">
            <a>게시판 목록</a>
         </button>

         <button
            onclick="location.href = 'modify.do?bbs_number=${board.bbs_number}'">수정하기</button>

         <form
            action="<%=request.getContextPath() %>/delete2.do?bbs_number=${board.bbs_number }"
            method="post">
            <!--    input type="hidden" name="${board.bbs_number }"  -->
            <input type="submit" value="삭제" />
         </form>

         <table width="70%" border="1">
            <tr>
               <th>글 번호</th>
               <td>board.bbs_number </td>
               <th>작성자</th>
               <td>board.m_nickname </td>
               <th>날짜</th>
               <td>board.bbs_date</td>
            </tr>
            <tr>
               <th>제목</th>
               <td colspan="5">(${board.hh_head })${board.bbs_title }</td>
            </tr>
            <tr>
               <th>내용</th>
               <td colspan="5" height="100px">${board.bbs_content }</td>
            </tr>
            <tr>
               <th>조회수</th>
               <td colspan="5">${board.bbs_views }</td>
            </tr>
         </table>
      </div>
   </div>
</body>
</html>


<br />
<br />
<%@ include file="/inc/Foother.jsp"%>" %>