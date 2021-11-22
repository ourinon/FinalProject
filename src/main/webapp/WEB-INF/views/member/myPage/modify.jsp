<%@page import="java.util.List"%>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/modify.css"
   type="text/css">
</head>
<body>
      
<%MemberDTO member = (MemberDTO)session.getAttribute("member"); %>
<%List<MemberDTO> memberList = (List<MemberDTO>)request.getAttribute("memberList");%>
 <div class="ModifyChange">
 <br/>
            <h2> 개인정보 변경</h2>

            <p>고객님의 개인정보를 위해 최선을 다하겠습니다.</p>
            <form action="<%=request.getContextPath() %>/myPage/modify?m_id=<%=member.getM_id()%>" method="post" onSubmit="return onSubmit()">
              <table>
                 <input type="hidden" name="m_email" value=<%=member.getM_email()%>>
                <tr>
                  <th>&nbsp;&nbsp;G-1300k ID</th>
                  <td><%=member.getM_email()%></td>
               
                </tr>
                <tr>
                  <th>&nbsp;&nbsp;이름</th>
                  <td><%=member.getM_name()%></td>
       
                </tr>
                <tr>
                  <th>&nbsp;&nbsp;닉네임</th>
                  <td>
                    <input
                      type="text"
                      value=<%=member.getM_nickname() %>
                      name="m_nickname"
                      id="nickname"
                      onblur="nicknameCheck()"
                    />
                  </td>
           
                </tr>
                <tr>
                  <th>&nbsp;&nbsp;휴대폰</th>
                  <td>
                    <input
                      type="text"
                      value=<%=member.getM_tel()%>
                      name="m_tel"
                      id="phonNo"
                      onblur="phonNoCheck()"
                    />
                  </td>
                 
                </tr>
              </table>
              <div  class="ModifyChange1">
                <input type="submit" value="수정완료"/>
                <a href="<%=request.getContextPath()%>/myPage">
                </a>
              </div>
             <%--   <a href="<%=request.getContextPath()%>/myPage"><input type="button" value="취소"/></a> --%>
            </form>
          </div>
<script>
let check = [true,true];

function nicknameCheck(){
   let nicknameInput = $("#nickname").val();
   let Overlab = false;
   <%for(int i = 0; i < memberList.size(); i++){%>
   if(nicknameInput === "<%=memberList.get(i).getM_nickname()%>"){
      if(nicknameInput != "<%=member.getM_nickname()%>"){
         Overlab = true;
      }
   }
   <%}%>
   if(!Overlab){
      var engCheck = /[a-z]/; 
      var numCheck = /[0-9]/; 
      var specialCheck = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
      var nickLength = 0;
      
      //한글, 영문 길이 2,1로 바꾸기 
      for(var i=0; i<nicknameInput.length; i++){ 
         //한글은 2, 영문은 1로 치환 
         nick = nicknameInput.charAt(i); 
         if(escape(nick).length >4){ 
            nickLength += 2; 
         }else{ 
            nickLength += 1; 
         } 
      }
      
      if (nicknameInput == null || nicknameInput == "") { 
         alert("닉네임 입력은 필수입니다.");
         check[0] = false;
      } else if (nicknameInput.search(/\s/) != -1) { 
         alert("닉네임은 빈 칸을 포함 할 수 없습니다.");
         check[0] = false;
      }else if (nicknameInput.length<2 || nicknameInput.length>20) { 
         alert("닉네임은 한글 1~10자, 영문 및 숫자 2~20자 입니다.");
         check[0] = false;
      }else if (specialCheck.test(nicknameInput)) { 
         alert("닉네임은 특수문자를 포함 할 수 없습니다.");
         check[0] = false;
      }else{
         check[0] = true;
      }
   }else{
      alert("이미 존재하는 닉네임입니다.");
      check[0] = false;
   }
}

function phonNoCheck(){
   let phonNoInput = $("#phonNo").val();
   
   let Overlab = false;
   <%for(int i = 0; i < memberList.size(); i++){%>
      if(phonNoInput === "<%=memberList.get(i).getM_tel()%>"){
         if(phonNoInput != "<%=member.getM_tel()%>"){
            Overlab = true;
         }
      }
   <%}%>
   if(!Overlab){
      var patternPhone = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
      if(!patternPhone.test(phonNoInput)){
         alert("잘못된 핸드폰 번호 형식입니다.");
         check[1] = false;
      }else if(phonNoInput.search(/\s/) != -1){
         alert("잘못된 핸드폰 번호 형식입니다.");
         check[1] = false;
      }else{
         check[1] = true;
      }
   }else{
      alert("이미 가입된 전화번호입니다.");
      check[1] = false;
   }
}

function onSubmit(){
   if(!check[0] || !check[1]){
      alert("회원정보 수정 실패");
      return false;
   }
}
</script>
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
</body>
</html>
<!-- 푸터 시작! -->
<%@ include file="/inc/Foother.jsp" %>
  <!-- 푸터 끝! -->