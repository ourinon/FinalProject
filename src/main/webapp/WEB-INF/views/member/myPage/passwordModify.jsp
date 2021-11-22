<%@page import="com.study.game.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 헤더 시작! -->
<%@ include file="/inc/Header.jsp" %>
    <!-- 헤더 끗! --> 
    
    
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/PasswordModify.css" type="text/css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div>
<%MemberDTO member = (MemberDTO)session.getAttribute("member");%>
<div class="PasswordModify">
            <h2>비밀번호 변경</h2>
            <br />
            <p>고객님의 소중한 개인정보보호를 위해서 본인확인을 진행합니다.</p>
            <br/>
            <div>
            <form action="<%=request.getContextPath()%>/myPage/passwordModify" method="POST" onSubmit="return allCheck()">
              <div class="PasswordModify1">
                <p>현재 비밀번호 입력</p>
                <input
                  type="password"
                  id="m_pw"
                  onblur="passwordCheck()"
                     class="input_email1" 
                />
                <br />
                  <p id="passwordCheck">
                      <br/>
                  </p>
                <p>새 비밀번호 입력</p>
                <input
                  type="password"
                  id="password"
                  onblur="newPasswordCheck()"
                     class="input_email2" 
                />
                <br />
                  <p id="newPasswordCheck" >
                       <br/>
                  </p>
                <p>새 비밀번호 재확인</p>
                <input
                  type="password"
                  id="check"
                  name="m_pw"
                  onblur="newPasswordReCheck()"
                     class="input_email3" 
                />     
                  <p id="newPasswordReCheck">
                        <br/>
                  </p>
              </div>
             <input type = "submit" value="변경" class="login_btn1"/>
          <br/>
              <a href="<%=request.getContextPath()%>/myPage"><input type="button" value="취소" class="login_btn1"/></a>
            </div>
           </form>
    
          
      </div>
          
 
<script>
let check = [false,false,false];

function passwordCheck(){
   let text = $(m_pw).val();
   let password = "<%=member.getM_pw()%>";
   let pwInput = document.getElementById('passwordCheck');
   if(text === password){
      pwInput.innerHTML = "<span style='color:#3CB371; margin-left: 175px '>패스워드가 일치합니다.</span>";
      check[0] = true;
   }else{
      pwInput.innerHTML = "<span style='color:red; margin-left: 140px '>패스워드가 일치하지 않습니다.</span>";
      check[0] = false;
   }
}

function newPasswordCheck(){
    var pw = $("#password").val();
    var num = pw.search(/[0-9]/g);
    var eng = pw.search(/[a-z]/ig);
    var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
    
    let newPwInput = document.getElementById('newPasswordCheck');

    if(pw.length < 8 || pw.length > 20){
     newPwInput.innerHTML = "<span style='color:red; margin-left: 122px   '>8자리 ~ 20자리 이내로 입력해주세요.</span>";
     check[1] = false;
    }else if(pw.search(/\s/) != -1){
     newPwInput.innerHTML = "<span style='color:red;  margin-left: 122px '>비밀번호는 공백 없이 입력해주세요.</span>";
     check[1] = false;
    }else if(num < 0 || eng < 0 || spe < 0 ){
     newPwInput.innerHTML = "<span style='color:red;  margin-left: 90px '>영문,숫자, 특수문자를 혼합하여 입력해주세요.</span>";
     check[1] = false;
    }else {
     newPwInput.innerHTML = "<span style='color:#3CB371; margin-left: 179px'>올바른 형식입니다.</span>";
     check[1] = true;
    }
   
} 

function newPasswordReCheck(){
   let checkPw = $("#check").val();
   let pw = $("#password").val();
   
   let newPwInput = document.getElementById('newPasswordReCheck');
   
   if(check[1]){
      if(checkPw === pw){
         console.log(checkPw + " " + pw);
         newPwInput.innerHTML = "<span style='color:#3CB371; margin-left: 172px'>비밀번호가 일치합니다.</span>";
         check[2] = true;
      }else{
         console.log(checkPw + " " + pw);
         newPwInput.innerHTML = "<span style='color:red; margin-left: 142px'>비밀번호가 일치하지 않습니다.</span>";
         check[2] = false;
      }
   }else{
      newPwInput.innerHTML = "<span style='color:red; margin-left: 147px'>잘못된 형식의 비밀번호입니다.</span>";
      check[2] = false;
   }
}

function allCheck(){
   if(check[0] && check[1] && check[2]){
      alert("변경성공");
      return true;
   }else{
      alert("변경실패");
      return false;
   }
}
</script>

</body>
         <br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
</html>

<!-- 푸터 시작! -->
<%@ include file="/inc/Foother.jsp" %>
  <!-- 푸터 끝! -->