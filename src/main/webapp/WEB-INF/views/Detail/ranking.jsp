<%@page import="com.study.game.dto.GameDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/inc/Header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/Ranking.css"
   type="text/css">
</head>
<body>
<%List<GameDto> viewsList = (List<GameDto>)request.getAttribute("viewsRankingList");
  List<GameDto> recoList = (List<GameDto>)request.getAttribute("recoRankingList");
%>
						
				
   <div class="container ver_set">

      <table class="table table-hover table-dark " style="background-color:  #0B0C2A">
         <thead>
         
            <tr>
               <th colspan="2"><div class="section-title" >
                        <h4>핫 리뷰</h4>
                     </div></th>
            </tr>
         </thead>
         <tbody>
           <%for(int i = 0; i < viewsList.size(); i++){%>
            <tr>
            <td><%=(i+1)%></td>
               <td>
                  <div class="img"><img alt="" style="height: 100%; "   src="<%=viewsList.get(i).getTitleImg()%>"></div>
               </td>
               <td><a href="<%=request.getContextPath()%>/gameInfo?GameId=<%=viewsList.get(i).getGameId()%>" style="color: white; line-height: 70px"><%=viewsList.get(i).getProjectName()%></a></td>
               <td>평점<br /> <br />
               <h3><%=recoList.get(i).getRate()%></h3></td>
            </tr>
          <%}%>
         </tbody>
      </table>

      <table class="table table-hover table-dark  table_thrid" style="background-color:  #0B0C2A">
         <thead>
            <tr>
               <th colspan="1"><div class="section-title" >
                        <h4>추천 순</h4>
                     </div></th>
            </tr>
         </thead>

            <tbody>
            <%for(int i = 0; i < recoList.size(); i++){%>
             <tr>
               <td>
                  <div class="img"><img alt="" style="height: 100%; "   src="<%=recoList.get(i).getTitleImg()%>"></div>
               </td>
            <td><a href="<%=request.getContextPath()%>/gameInfo?GameId=<%=recoList.get(i).getGameId()%>" style="color: white; line-height: 70px"><%=recoList.get(i).getProjectName()%></td>
               <td>평점<br /> <br />
               <h3><%=recoList.get(i).getRate()%></h3></td>
            </tr>
            
          	<%}%>
         </tbody>
      </table>
   </div>


<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
</body>
</html>

<br />
<br />
<%@ include file="/inc/Foother.jsp"%>