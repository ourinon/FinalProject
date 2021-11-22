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
   href="<%=request.getContextPath()%>/resources/css/MypageList.css"
   type="text/css">
   
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
      <div class="MyPage_List">
        <table width="900px" height="700px">
          <tr>
            <td  class="bottom">
              <a href="<%=request.getContextPath()%>/myPage/profile">
                <div name="profile">
                   <li>
                 <%--  <img src="<%=request.getContextPath()%>/resources/img/mypage_img/pro_logo.jpg"
                   width="200" height="200"/> --%>
                  <svg xmlns="http://www.w3.org/2000/svg" width="150" height="150" fill="currentColor" class="bi bi-person-video" viewBox="0 0 16 16">
  <path d="M8 9.05a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5Z"/>
  <path d="M2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2Zm10.798 11c-.453-1.27-1.76-3-4.798-3-3.037 0-4.345 1.73-4.798 3H2a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1h-1.202Z"/>
</svg>
                   </li>
                  <li style="font-size: 30px">G-1300k 프로필</li>

                  <li>
                    고객님의 프로필을
                    <br /> 수정하실수 있습니다.
                  </li>
                </div>
              </a>
            </td>

            <td  class="bottom">
               <a href="<%=request.getContextPath()%>/myPage/modify">
                <div name="modify">
                 <li>
            <!--       <img   src="" width="200" height="200"/> -->
     <img src="https://img.icons8.com/ios-glyphs/150/000000/change-user-male.png"/>
                 </li>
                  <li style="font-size: 30px">개인정보 변경</li>
                  <li>
                    고객님의 개인정보를 <br />
                    수정하실 수 있습니다
                  </li>
                </div>
               </a>
            </td>
          </tr>
          
          <tr>
            <td  class="bottom">
              <a href="<%=request.getContextPath()%>/myPage/remove">
                <div name="remove">
                <li>
               <img src="https://img.icons8.com/ios-filled/150/000000/remove-administrator.png"/>
                </li>
                  <li style="font-size: 30px">회원 탈퇴</li>
                  <li>
                    사용하지 않는 국비위키ID를 <br />
                    탈퇴 할 수 있습니다.
                  </li>
                </div>
              </a>
            </td>
            <td  class="bottom">
               <a href="<%=request.getContextPath()%>/myPage/passwordModify">
                <div name="passwordModify">
                <li>
            <img src="https://img.icons8.com/ios/150/000000/1password.png"/>
                </li>
                  <li style="font-size: 30px">비밀번호 변경</li>
                  <li>
                    추가적인 비밀번호 변경으로 <br /> ID를 안전하게 관리할
                    <br />수 있습니다.
                  </li>
                </div>
               </a>
            </td>
         </tr>
        </table>
      </div>
      
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
<!-- 푸터 시작! -->
<%@ include file="/inc/Foother.jsp" %>
  <!-- 푸터 끝! -->