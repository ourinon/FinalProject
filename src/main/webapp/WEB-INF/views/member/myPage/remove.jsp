<%@page import="com.study.game.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
    <!-- 헤더 시작! -->
<%@ include file="/inc/Header.jsp" %>
    <!-- 헤더 끗! -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/Remove.css"
   type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
   <%MemberDTO member = (MemberDTO)session.getAttribute("member"); %>
   <div class="Remove_list">
   
      <h2>본인확인</h2>
      <br />
      <p>고객님의 소중한 개인정보보호를 위해서 본인확인을 진행합니다.</p>
      <div>
         <ul>
            <li style="font-size: 20px">비밀번호 입력</li>
            <li><input id="m_pw" type="password"/></li>
            <li>
               <button onclick="check()" class="btn">탈퇴</button>
            </li>
         </ul>
      </div>
   </div>
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
   <br/>
   <script>
      function check(){
         let text = $(m_pw).val();
         let password = "<%=member.getM_pw()%>";
         if(password !== text){
            alert("패스워드가 다릅니다.");
         }else{
            $.ajax({
               type: "POST",
               url: "<%=request.getContextPath()%>/myPage/remove",
               data:{
                  "m_email":"<%=member.getM_email()%>"
               },
               success:function(){
                  alert('회원탈퇴 성공');
                  //location.reload();
                  //location.href="/";
                  location.replace("/");
               },error:function(){
                  alert('회원탈퇴 실패');
                  location.reload();
               }
            });
         }
      }
   </script>
</body>
</html>
<!-- 푸터 시작! -->
<%@ include file="/inc/Foother.jsp" %>
  <!-- 푸터 끝! -->