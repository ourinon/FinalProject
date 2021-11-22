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
 <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/ProfileModify.css" type="text/css">
</head>
<body>
<%MemberDTO member = (MemberDTO)session.getAttribute("member"); %>
<div class="ProfileModify">
<br/>
 <h2>프로필 수정 </h2>
   <p>프로필 수정 프로필을 수정 하실 수 있습니다.</p>
   <form enctype="multipart/form-data" action="<%=request.getContextPath()%>/myPage/profile" method="post" onSubmit="return changeCheck()">
      <table class="table table-bordered" border="1">
      
            <tr>
               <th>&nbsp;&nbsp;프로필 사진</th>
               <td>
                  <div id="preview-image">
                  <%if(member.getM_img() != null && member.getM_img().length() > 10){%>
                     <img src="<%=member.getM_img()%>"style="width: 200px; height: 200px; float: left; margin-left: 50px"/>
                  <%}else{%>
                     <img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png" style="width: 200px; height: 200px; float: left; margin-left: 50px"/>
                  <%} %>
                  </div>
               </td>
            </tr>
      
       <tr>
            <th> </th>
            <td>
            <input type="file" class="file" id="imageSelector" name="img" accept="image/jpeg, image/jpg, image/png" multiple
                  name="uploadFile" />   
                  <input type="button" value="삭제" onclick="deleteImg()"/>
            </td>
          </tr>
            
      </table>
      
      <div class="ProfileModify1">
      <input type="submit" value="업로드"/>
   <!--    <input type="button" value="취소" onclick="cancel()"/> -->
      
      </div>
   </form>
   </div>
   
</body>
<script src="http://code.jquery.com/jquery.js"></script>
<script>
   let check = false;

   function cancel(){
      location.href="/myPage";
   }

   //URL.createObjectURL을 이용하는 방식
   function readImagePreview(elem) {
      $("#preview-image").html("");
      for(var i=0; i<elem.files.length; i++) {
           let readFileURL = URL.createObjectURL(elem.files[i]); //파일 객체에서 이미지 데이터 가져옴.
           console.log(readFileURL);
   
           const previewImageDiv = document.getElementById("preview-image");
           
           $(previewImageDiv).append('<img style="width: 200px; height: 200px; float: left; margin-left: 50px" src="' + readFileURL + '"/>');
   
           //이미지 로딩 후 객체를 메모리에서 해제
           $('img', previewImageDiv).on('load', function () {
               URL.revokeObjectURL($(this).attr('src'));
           });
       }
   }
   
   function deleteImg(){
      $("#preview-image").html("");
      $(".file").val('');
      check = true;
      const previewImageDiv = document.getElementById("preview-image");
       $(previewImageDiv).append('<img style="width: 200px; height: 200px; float: left; margin-left: 50px" src="' + "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png" + '"/>');
   }

   $('input.file').change((event) => {
       //readImage(event.target);
       check = true;
       readImagePreview(event.target);
   });
   
   function changeCheck(){
      if(!check){
         alert("프로필이 변경되지 않았습니다.")
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
</html>
<!-- 푸터 시작! -->
<%@ include file="/inc/Foother.jsp" %>
  <!-- 푸터 끝! -->