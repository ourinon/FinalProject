<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/inc/Header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
   src="https://cdn.jsdelivr.net/npm/emailjs-com@2.4.1/dist/email.min.js">
   
</script>
<script type="text/javascript">
   (function() {
      emailjs.init("user_CZUyNQVhhips0xLr00lBc");
   })();
</script>

<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/findPassword.css"
   type="text/css">

</head>
<body>
<%List<MemberDTO> memberList = (List<MemberDTO>)request.getAttribute("memberList");%>
   <div class="container add">
      <div class="find_box">
         <h3>비밀번호찾기 페이지</h3>
         <form name="frm" onSubmit="return allCheck()"
            action="<%=request.getContextPath()%>/findPassword" method="post">
            <input type="text" placeholder="이메일 주소" id="email" name="m_email"></input>
            <input type="button" value="전송" onclick="emailSend()" /> <br /> <span>
               이메일 확인 후 인증번호를 입력해주세요(전송에 시간이 걸릴 수 있습니다.) </span> <br /> <input
               type="text" id="emailCode" placeholder="이메일 인증번호"
               onblur="emailCodeCheck()" />
            <p id="emailCheck"></p>
               <span class="reset_pw"> 새 비밀번호 입력 &nbsp;&nbsp; </span>
               <input
                class="input_password"
                  type="password"
                  id="password"
                  readonly
                />
                <br />
                  <p id="newPasswordCheck">
                   
                  </p>
                  
                  <span class="reset_pw_check"> 새 비밀번호 재확인 </span>
                  <input
                      class="input_password"
                    type="password"
                    id="check"
                    name="m_pw"
                    readonly
                  />     
                    <p id="newPasswordReCheck">
                      
                    </p>
                    <input class="shift_pw" type="submit" value="변경하기"/>
         </form>
      </div>
   </div>
   <script>
      let check = [ false, false, false ];
      let codeCheck;
      let flag = false;
      
      $("#password").on('click',onAlert);
      $("#check").on('click',onAlert);
      
      
      function onAlert(){
         alert("이메일 인증을 완료해주세요");
      }
      
      function newPasswordCheck(){
          var pw = $("#password").val();
          var num = pw.search(/[0-9]/g);
          var eng = pw.search(/[a-z]/ig);
          var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
          
          let newPwInput = document.getElementById('newPasswordCheck');

          if(pw.length < 8 || pw.length > 20){
           newPwInput.innerHTML = "<span style='color:red'>8자리 ~ 20자리 이내로 입력해주세요.</span>";
           check[1] = false;
          }else if(pw.search(/\s/) != -1){
           newPwInput.innerHTML = "<span style='color:red'>비밀번호는 공백 없이 입력해주세요.</span>";
           check[1] = false;
          }else if(num < 0 || eng < 0 || spe < 0 ){
           newPwInput.innerHTML = "<span style='color:red'>영문,숫자, 특수문자를 혼합하여 입력해주세요.</span>";
           check[1] = false;
          }else {
           newPwInput.innerHTML = "<span style='color:#3CB371'>올바른 형식입니다.</span>";
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
               newPwInput.innerHTML = "<span style='color:#3CB371'>비밀번호가 일치합니다.</span>";
               check[2] = true;
            }else{
               console.log(checkPw + " " + pw);
               newPwInput.innerHTML = "<span style='color:red'>비밀번호가 일치하지 않습니다.</span>";
               check[2] = false;
            }
         }else{
            newPwInput.innerHTML = "<span style='color:red'>잘못된 형식의 비밀번호입니다.</span>";
            check[2] = false;
         }
      }
      
      
      
      
      function emailSend() {
       let joinCheck = false;
       let emailInput = $("#email").val();
       
       <%for(int i = 0; i < memberList.size(); i++){%>
         if(emailInput === "<%=memberList.get(i).getM_email()%>"){
            joinCheck = true;
         }
       <%}%>
       if(joinCheck){
         let number = Math.floor(Math.random() * 1000000) + 100000;
         if (number > 1000000) {
            number = number - 100000;
         }
         codeCheck = String(number);
         let inputEmail = $("#email").val();
         var templateParams = {
            email : inputEmail,
            code : codeCheck
         };

         emailjs.send('service_zp5wixb', 'template_wj0meve', templateParams)
               .then(function(response) {
                  alert('전송성공', response.status, response.text);
                  check[0] = true;
               }, function(error) {
                  alert('전송실패', error);
                  check[0] = false;
               });
       }else{
          var emailCheck = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;

          if(emailCheck.test(emailInput)){
            alert("가입된 이메일이 아닙니다.");
          }else{
             alert("올바른 이메일 형식이 아닙니다.");
          }
       }
      }
      
      function emailCodeCheck(){
         let eCheckInput = document.getElementById('emailCheck');
         let codeInput = $("#emailCode").val();
         
         if(check[0]){
            if(codeCheck === codeInput){
               eCheckInput.innerHTML = "<span style='color:#3CB371'>인증코드가 일치합니다.</span>";
               check[1] = true;
            }else{
               eCheckInput.innerHTML = "<span style='color:red'>인증코드가 일치하지 않습니다..</span>";
               check[1] = false;
            }
         }else{
            eCheckInput.innerHTML = "<span style='color:red'>인증코드 전송을 완료해주세요.</span>";
            check[1] = false;
         }
         
         if(check[1]){
            if(!flag){
               $("#password").attr('readonly',false);
                 $("#check").attr('readonly',false);
                 $("#password").off('click');
                 $("#check").off('click');
                 $("#password").on('blur',newPasswordCheck);
                 $("#check").on('blur',newPasswordReCheck);
                 flag = !flag;
            }   
         }else{
            if(flag){
               $("#password").attr('readonly',true);
                $("#check").attr('readonly',true);
                $("#password").off('blur');
                $("#check").off('blur');
                $("#password").on('click',onAlert);
                $("#check").on('click',onAlert);
                flag = !flag;
            }   
         }
      }
         
         function allCheck(){
            if(check[0] && check[1] && check[2]){
               alert("변경성공");
               return true;
            }else{
               alert("잘못된 요청입니다.");
               return false;
            }
         }
   </script>
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
</body>
</html>
<%@ include file="/inc/Foother.jsp"%>" %>