<%@page import="com.study.game.dto.MemberDTO"%>
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
   href="<%=request.getContextPath()%>/resources/css/JoinTest.css"
   type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/main_style.css" type="text/css">

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
   src="https://cdn.jsdelivr.net/npm/emailjs-com@2.4.1/dist/email.min.js"> </script>
<script type="text/javascript"> (function(){ emailjs.init("user_CZUyNQVhhips0xLr00lBc"); })(); </script>
<!-- 합쳐지고 최소화된 최신 CSS -->



</head>
<body>
   <%List<MemberDTO> memberList = (List<MemberDTO>)request.getAttribute("memberList");%>
   <div class="container">
      <div class="joinBox">


         <img
            src="<%=request.getContextPath()%>/resources/img/mypage_img/join_img.jpg"
            alt="" style="width: 600px; height: 20%">


         <hr />
         <h2>G-1300k에 오신 것을 환영합니다!</h2>
         <form action="<%=request.getContextPath()%>/join" method="post"
            onSubmit="return onSubmit()" class="Join_form1">
            <input type="text" placeholder="이메일 주소" id="email" name="m_email"></input>
            <input type="button" value="전송" onclick="emailSend()" /> <br /> <span
               style="font-size: 10px"> 이메일 확인 후 인증번호를 입력해주세요 </span> <br /> <input
               type="text" id="emailCode" placeholder="이메일 인증번호"
               onblur="emailCodeCheck()"></input>
            <p id="emailCheck"></p>
            <input type="text" name="m_nickname" id="nickname" placeholder="닉네임"
               onblur="nicknameCheck()"></input> <br />
            <p id="nicknameCheck"></p>
            <input type="password" name="m_pw" id="password" placeholder="비밀번호"
               onblur="passwordCheck()"></input> <br />
            <p id="passwordCheck"></p>
            <input type="password" name="rePassword" placeholder="비밀번호 확인"
               id="check" onblur="passwordReCheck()"></input> <br />
            <p id="passwordReCheck"></p>
            <input type="text" name="m_name" placeholder="성명" id="name"
               onblur="nameCheck()"></input> <br />
            <p id="nameCheck"></p>
            <input type="text" name="m_tel" id="phonNo" placeholder="휴대전화번호"
               onblur="phonNoCheck()" />
            <p id="phonNoCheck"></p>
            <input type="submit" value="회원가입" />
            
         </form>

         <div class="joinlast">
              <div class="horizontal"></div>
            이미 회원이세요? <span> <a
               href="<%=request.getContextPath()%>/login">로그인</a>
            </span>
         </div>
      </div>
   </div>

   <br />
   <br />
   <br />
   <br />
   <br />
   <br />
   <script>
let codeCheck;
let check = [false,false,false,false,false,false,false];

function emailSend(){
   let number = Math.floor(Math.random() * 1000000) + 100000;
   if (number > 1000000) {
     number = number - 100000;
   }
   codeCheck = String(number);
   let inputEmail = $("#email").val();
   let Overlab = false;
   <%for(int i = 0; i < memberList.size(); i++){%>
      if(inputEmail === "<%=memberList.get(i).getM_email()%>"){
         Overlab = true;
      }
   <%}%>
   if(!Overlab){
      var templateParams = {
            email:inputEmail,
            code:codeCheck
      };
   
   
      emailjs.send('service_zp5wixb', 'template_wj0meve',templateParams)
      .then(function(response) { 
         alert('전송성공', response.status, response.text); 
         check[0] = true;
      }
      ,function(error) 
      { alert('전송실패', error); 
        check[0] = false;
      });
   }else{
      alert("이미 가입된 이메일입니다.");
   }
}

function emailCodeCheck(){
   let eCheckInput = document.getElementById('emailCheck');
   let codeInput = $("#emailCode").val();
   
   if(check[0]){
      if(codeCheck === codeInput){
         eCheckInput.innerHTML = "<span style='font-size: 5px; color:#3CB371'>인증코드가 일치합니다.</span>";
         check[1] = true;
      }else{
         eCheckInput.innerHTML = "<span style='font-size: 5px; color:red'>인증코드가 일치하지 않습니다..</span>";
         check[1] = false;
      }
   }else{
      eCheckInput.innerHTML = "<span style='font-size: 5px; color:red'>인증코드 전송을 완료해주세요.</span>";
      check[1] = false;
   }
   
}

function nicknameCheck(){
   let nCheckInput = document.getElementById('nicknameCheck');
   let nicknameInput = $("#nickname").val();
   let Overlab = false;
   <%for(int i = 0; i < memberList.size(); i++){%>
   if(nicknameInput === "<%=memberList.get(i).getM_nickname()%>"){
      Overlab = true;
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
         nCheckInput.innerHTML = "<span style='font-size: 5px; color:red'>닉네임 입력은 필수입니다.</span>";
         check[2] = false;
      } else if (nicknameInput.search(/\s/) != -1) { 
         nCheckInput.innerHTML = "<span style='font-size: 5px; color:red'>닉네임은 빈 칸을 포함 할 수 없습니다.</span>"; 
         check[2] = false;
      }else if (nicknameInput.length<2 || nicknameInput.length>20) { 
         nCheckInput.innerHTML = "<span style='font-size: 5px; color:red'>닉네임은 한글 1~10자, 영문 및 숫자 2~20자 입니다.</span>"; 
         check[2] = false;
      }else if (specialCheck.test(nicknameInput)) { 
         nCheckInput.innerHTML = "<span style='font-size: 5px; color:red'>닉네임은 특수문자를 포함 할 수 없습니다.</span>";
         check[2] = false;
      }else{
         nCheckInput.innerHTML = "<span style='font-size: 5px; color:#3CB371'>사용가능한 닉네임입니다.</span>";
         check[2] = true;
      }
   }else{
      nCheckInput.innerHTML = "<span style='font-size: 5px; color:red'>이미 존재하는 닉네임입니다.</span>";
      check[2] = false;
   }
}
function passwordCheck(){
   let pw = $("#password").val();
   let pwInput = document.getElementById('passwordCheck');
   
    var num = pw.search(/[0-9]/g);
    var eng = pw.search(/[a-z]/ig);
    var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
    
    if(pw.length < 8 || pw.length > 20){
     pwInput.innerHTML = "<span style='font-size: 5px; color:red'>8자리 ~ 20자리 이내로 입력해주세요.</span>";
     check[3] = false;
    }else if(pw.search(/\s/) != -1){
     pwInput.innerHTML = "<span style='font-size: 5px; color:red'>비밀번호는 공백 없이 입력해주세요.</span>";
     check[3] = false;
    }else if(num < 0 || eng < 0 || spe < 0 ){
     pwInput.innerHTML = "<span style='font-size: 5px; color:red'>영문,숫자, 특수문자를 혼합하여 입력해주세요.</span>";
     check[3] = false;
    }else {
     pwInput.innerHTML = "<span style='font-size: 5px; color:#3CB371'>올바른 형식입니다.</span>";
     check[3] = true;
    }
}

function passwordReCheck(){
   let checkPw = $("#check").val();
   let pw = $("#password").val();
   
   let newPwInput = document.getElementById('passwordReCheck');
   
   if(check[3]){
      if(checkPw === pw){
         console.log(checkPw + " " + pw);
         newPwInput.innerHTML = "<span style='font-size: 5px; color:#3CB371'>비밀번호가 일치합니다.</span>";
         check[4] = true;
      }else{
         console.log(checkPw + " " + pw);
         newPwInput.innerHTML = "<span style='font-size: 5px; color:red'>비밀번호가 일치하지 않습니다.</span>";
         check[4] = false;
      }
   }else{
      newPwInput.innerHTML = "<span style='font-size: 5px; color:red'>잘못된 형식의 비밀번호입니다.</span>";
      check[4] = false;
   }
}

function nameCheck(){
   let nameInput = $("#name").val();
   let nCheckInput = document.getElementById('nameCheck');
   
   for (var i=0; i<nameInput.length; i++)  { 
      var chk = nameInput.substring(i,i+1); 
      console.log(nameInput);
       if(chk.match(/[0-9]|[a-z]|[A-Z]/)) { 
          nCheckInput.innerHTML = "<span style='font-size: 5px; color:red'>이름을 정확히 입력해주세요.</span>";
          check[5] = false;
           return;
       }else if(chk.match(/([^가-힣\x20])/i)){
          nCheckInput.innerHTML = "<span style='font-size: 5px; color:red'>이름을 정확히 입력해주세요.</span>";
          check[5] = false;
           return;
       }else if($("#name").val().search(/\s/) != -1){
          nCheckInput.innerHTML = "<span style='font-size: 5px; color:red'>이름을 정확히 입력해주세요.</span>";
          check[5] = false;
           return;
       }else if(nameInput == "" || nameInput === null || nameInput == undefined){
          nCheckInput.innerHTML = "<span style='font-size: 5px; color:red'>이름을 정확히 입력해주세요.</span>";
          check[5] = false;
           return;
       }else{
          nCheckInput.innerHTML = "<span style='font-size: 5px; color:#3CB371'>올바른 형식입니다.</span>";
          check[5] = true;
          return
       }
   }
   nCheckInput.innerHTML = "<span style='font-size: 5px; color:red'>이름 입력은 필수입니다.</span>";
   check[5] = false;
}
function phonNoCheck(){
   let phonNoInput = $("#phonNo").val();
   let pCheckInput = document.getElementById('phonNoCheck');
   
   let Overlab = false;
   <%for(int i = 0; i < memberList.size(); i++){%>
      if(phonNoInput === "<%=memberList.get(i).getM_tel()%>"){
         Overlab = true;
      }
   <%}%>
   if(!Overlab){
      var patternPhone = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
      if(!patternPhone.test(phonNoInput)){
         pCheckInput.innerHTML = "<span style='font-size: 5px; color:red'>잘못된 핸드폰 번호 형식입니다.</span>";
         check[6] = false;
      }else if(phonNoInput.search(/\s/) != -1){
         pCheckInput.innerHTML = "<span style='font-size: 5px; color:red'>잘못된 핸드폰 번호 형식입니다.</span>";
         check[6] = false;
      }else{
         pCheckInput.innerHTML = "<span style='font-size: 5px; color:#3CB371'>사용 가능한 번호입니다.</span>";
         check[6] = true;
      }
   }else{
      pCheckInput.innerHTML = "<span style='font-size: 5px; color:red'>이미 가입된 전화번호입니다.</span>";
      check[6] = false;
   }
}

function onSubmit(){
   let count = 0;
   for(var i=0; i < check.length; i++){
      if(check[i]){
         count++;
      }
   }
   console.log(count);
   if(count == check.length){
      alert("회원가입 성공");
      return true;
   }else{
      alert("회원가입 실패");
      return false;
   }
}
</script>
</body>
</html>
<%@ include file="/inc/Foother.jsp"%>