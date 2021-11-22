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
               <h4>공지사항</h4>
               <%if(member != null){%>
               	<%if(member.getM_admin() == 1){%>
               		<button onclick="location.href = '/board/noticeInput'" class="write_btn">글쓰기</button>
               	<%}%>
               <%}%>
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

<%--          <div class="page" style="margin: 20px auto 10px auto;">
            <ul>
               <c:if test="${pageMaker.prev}">
                  <li><a
                     href="<%=request.getContextPath() %>/list.do${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a>
                  </li>
               </c:if>

               <c:forEach begin="${pageMaker.startPage}"
                  end="${pageMaker.endPage}" var="idx">
                  <li><a
                     href="<%=request.getContextPath() %>/list.do${pageMaker.makeQuery(idx)}">${idx}</a>
                  </li>
               </c:forEach>

               <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                  <li><a
                     href="<%=request.getContextPath() %>/list.do${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a>
                  </li>
               </c:if>
            </ul>
         </div>

         <div class="search_part">
            <form action="<%=request.getContextPath()%>/search.do" method="post"
               class="box">
               <table>
                  <!--  <select name="searchCondition" class="searchbar_option">
                                    <option value="title">제목
                                    <option value="content">내용
                                </select> -->
                  <input name="searchKeyword" type="text" class="searchbar_input" />
                  <input type="submit" value="검색" class="searchbar_button"></input>
               </table>
            </form>
         </div> --%>
      </div>
   </div>


<%-- <%@ include file="../Star/Game information.jsp" %> --%> <!-- 별점 -->
<script>
function logingogo() {
	alert("로그인 후 이용해주세요");
	location.href = "/login";
}

</script>
</body>
</html>

<%@ include file="/inc/Foother.jsp"%>