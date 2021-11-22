<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.6.0.slim.js"
   integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
   crossorigin="anonymous"></script>
   <%@ include file="/inc/Header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/LoginTest.css"
   type="text/css">

</head>
<body>
   <script type="text/javascript">
      <%if(request.getAttribute("result") != null){%>
         alert("로그인 실패");
      <%}%>
   </script>
   <div class=loginform>
            <h1>
               <a href="<%=request.getContextPath()%>/"><img
                     src="<%=request.getContextPath()%>/resources/img/logo_img/logo_font.jpg"
                     alt="" style="height: 60px; width: 140 px;">
               </a>
            </h1>

   
           <br />
         <!--    <h1>로그인 페이지</h1> -->
         <form action="login" method="post">
            <br />
               <br />
               
             <p>Email address</p>
            
            
               <input class="input_email" type="text" id="m_email" name="m_email" placeholder="이메일 주소"><br/>
                  <p>Password</p>
               <input type="password" id="m_pw" name="m_pw" placeholder="password"
                   class="input_password"> 
                <br />
               <input id="btn_login" type="submit"value="로그인" class="login_btn">
            
            
            <div class=horizontal>
               <span>or</span>
            </div>

      </form>
         <!-- <div id="naverIdLogin"></div> -->
      
         
         <br/>
            
            <!-- <div class=horizontal></div> -->
            <div class="loginlast">
              &nbsp;&nbsp;&nbsp;  아직 회원이 아니세요? &nbsp;&nbsp;&nbsp;<span>
               <span><a href="<%=request.getContextPath()%>/join">회원가입&nbsp;&nbsp;</a></span>
               <span><a href="<%=request.getContextPath()%>/findPassword">비밀번호찾기</a></span>
            </div>
      
      </div>
   </div>
</body>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<%@ include file="/inc/Foother.jsp"%>