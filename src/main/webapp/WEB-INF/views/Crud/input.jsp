<%@ include file="/inc/Header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="<%=request.getContextPath()%> /resources/css/Insert.css"
   type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
      <div class="container">
        
        <form action="<%=request.getContextPath()%>/crud/input" method="post"
            enctype="multipart/form-data" class="insert_form">
             
               <<br/><br/><div class="section-title">
             
                                    <h4>게임 생성</h4>
                                </div>
            
            <table class="table table-bordered insert_act">
                <tr>
                    <th><span>게임제목</span></th>
                    <td><input type="text" name="projectName" /></td>
                </tr>
                <tr>
                    <th><span>제작사</span></th>
                    <td><input type="text" name="developer" /></td>
                </tr>
                <tr>
                    <th><span>배급사</span></th>
                    <td><input type="text" name="provider" /></td>
                </tr>
                <tr>
                    <th><span>타이틀 이미지</span></th>
                    <td><input type="file" class="file" id="imageSelector" 
                        name="img" accept="image/jpeg, image/jpg, image/png" multiple name="uploadFile" />
                        <div id="preview-image"></div>
                    </td>
                </tr>
                <tr>
                    <th><span>출시날짜</span></th>
                    <td><input type='date' name="releaseDate" id='currentDate'/></td>
                </tr>
                <tr>
                    <th><span>플랫폼</span></th>
                    <td>
                        <span>PC&nbsp;&nbsp;</span><input type="checkBox" value=1 name="check0" /> 
                        <span>모바일&nbsp;&nbsp;</span><input type="checkbox" value=1 name="check1" /> 
                        <span>콘솔&nbsp;&nbsp;</span><input type="checkbox" value=1 name="check2" />
                    </td>
                </tr>
                <tr>
                    <th><span>장르</span></th>
                    <td>
                        <span>액션&nbsp;&nbsp;</span><input type="checkbox" value=1 name="check3" /> 
                        <span>어드벤처 및 캐쥬얼&nbsp;&nbsp;</span><input type="checkbox" value=1 name="check4" /> 
                        <span>롤 플레잉&nbsp;&nbsp;</span><input type="checkbox" value=1 name="check5" /> 
                        <span>시뮬레이션&nbsp;&nbsp;</span><input type="checkbox" value=1 name="check6" /> 
                        <span>전략&nbsp;&nbsp;</span><input type="checkbox" value=1 name="check7" />
                        <span>스포츠 및 레이싱&nbsp;&nbsp;</span><input type="checkbox" value=1 name="check8" />
                    </td>
                </tr>
                <tr>
                    <th><span>게임 소개</span></th>
                    <td><textarea rows="11" cols="85" name="Introduce"></textarea></td>
                </tr>
                <tr>
                    <th colspan="2">
                        <input type="submit" value="저장" /> 
                        <input type="reset" value="취소" /></th>
                </tr>
            </table>
        </form>
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
<br/>
<br/>
<br/>
</body>

<script>
   document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);;

   //URL.createObjectURL을 이용하는 방식
   function readImagePreview(elem) {
      $("#preview-image").html("");
      for(var i=0; i<elem.files.length; i++) {
           let readFileURL = URL.createObjectURL(elem.files[i]); //파일 객체에서 이미지 데이터 가져옴.
           console.log(readFileURL);
   
           const previewImageDiv = document.getElementById("preview-image");
           
           $(previewImageDiv).append('<img width="200" height="200" src="' + readFileURL + '"/>');
   
           //이미지 로딩 후 객체를 메모리에서 해제
           $('img', previewImageDiv).on('load', function () {
               URL.revokeObjectURL($(this).attr('src'));
           });
       }
   }

   $('input.file').change((event) => {
       //readImage(event.target);
       readImagePreview(event.target);
   });
</script>
</html>

 <%@ include file="/inc/Foother.jsp" %>