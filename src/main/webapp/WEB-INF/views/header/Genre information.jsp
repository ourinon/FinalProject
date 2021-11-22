<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/inc/Header.jsp"%>
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
         <div id="chat">
      <%--       <%@ include file="/socket.jsp"%>  --%>
         </div>
      </div>

      <div class="noti_btm">
         <div class="noti_list">
            <div class="section-title">
               <br />
               <h4>전체글 보기</h4>
            </div>
            <!-- <p>
                  <strong style="color: white;">전체글보기</strong>
               </p> -->
            <table class="section_board ">
               <tr>
                  <td>번호</td>
                  <td>제목</td>
                  <td>작성자</td>
                  <td>작성일</td>
                  <td>조회</td>
               </tr>

               <c:forEach var="board" items="${boardList }">
                  <tr>
                     <td>1</td>
                     <td><a
                        href="<%=request.getContextPath() %>/detail.do?bbs_number=${board.bbs_number}">(${board.hh_head })${board.bbs_title }</a>
                     </td>
                     <td>${board.m_nickname }</td>
                     <td>${board.bbs_date }</td>
                     <td>${board.bbs_views }</td>
                  </tr>
               </c:forEach>
            </table>
         </div>

         <div class="page" style="margin: 20px auto 10px auto;">
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
         </div>
      </div>
   </div>
   </div>

</body>
</html>


<br />
<br />
<%@ include file="/inc/Foother.jsp"%>" %>