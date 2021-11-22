<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="com.study.game.dto.BoardDTO"%>
<%@page import="com.study.game.dto.GameDto"%>
<%@page import="com.study.game.dto.MemberDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/inc/Header.jsp"%>

   <%
   List<BoardDTO> boardList = (List<BoardDTO>) request.getAttribute("boardList");
   %>
   <%
   GameDto game = (GameDto) request.getAttribute("game");
   MemberDTO member = (MemberDTO)session.getAttribute("member");
   %>
   
   <%System.out.println("여기는 create : " +game); %>

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
      <div class="commercial">
      </div>
      <form action="/board/noticeInput" method="post">
         <table>
            <tr>
               <th colspan="4">
                  <h3>글 작성</h3> <input type="submit" value="저장" />
            <!--       <button type="button" onclick="redirectComm()">취소</button> -->
               </th>
            </tr>
            <tr>
               <th>글제목</th>
               <!-- 장르 + 제목 -->
               <td><input type="hidden" name="target" value="<%=game.getGameId()%>">
               <input  class="input_colr"  type="text" name="title" value="" /></td>  
               <%System.out.println(member.getM_nickname());%>
               <input type="hidden" name="writer_id123" value="<%=member.getM_id()%>" />
                  <td>
                     <select class="category input_colr" name="hhead" >
                        <option value="말머리">말머리</option>
                        <option value="업데이트">업데이트</option>
                     </select>
                  </td>   


            </tr>
            <tr>
               <th>내용</th>
               <td colspan="3"><textarea class="input_colr"  rows="10" cols="50" name="content"></textarea></td>
            </tr>
         </table>
      </form>
   </div>
<script>

function redirectComm(){
   location.href = '/gameInfo/community?GameId='+<%=game.getGameId()%>;
}
</script>
<br />
<br />

</body>
</html>

<%@ include file="/inc/Foother.jsp"%>