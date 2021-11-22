<%@page import="com.study.game.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>web_socket_client.jsp</title>

<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/Chat.css"
   type="text/css">
</head>
<body>
   <!-- <p>사용자 아이디를 입력 하고 로그인 하면 체팅이 시작 됩니다!</p> -->

   <br />
   <!-- UI여기서부터 시작!! -->

      <!-- 디테일페이지에서
   게시판이동시 회원가입에 사용한
    user에대한 value를 가져옴 -->
      <!-- <h5 style = color:red>사용자 :</h5> -->
      <%
      MemberDTO member = (MemberDTO) session.getAttribute("member");
      %>
      <!-- 로그인시 닉네임 가져오자 -->
      <%
      if (member != null) {
      %>
      <input id="sendUser" type="hidden" value="<%=member.getM_nickname()%>">
      <%
      } else {
      %>
      <input id="sendUser" type="hidden" value="">
      <%
      }
      %>

      <!-- <input id="closeBtn" value="Disconnect" type="button"> -->

      <br>

      <!--  <span>받는이 : </span> -->


       <select id="fromUser" style="display:none">
         <option value="<%=member.getM_nickname()%>">All</option>
      </select><br>

      <textarea id="msgTxtArea" rows="8" cols="90"></textarea>
      <br>

      <!-- <h5 style = color:red>메세지 :</h5> -->

      <input id="loginBtn" value="접속하기" type="button" /> 
      <input
         id="content" type="text" onkeyup="enterkey()"  value=""
         style="width: 742px; padding: 5px 10px;"/>

      <!-- <input id="sendBtn" value="전송" type="button"> -->



   <!-- UI여기서부터 끝!! -->









   <script src="http://code.jquery.com/jquery.js"></script>
   <script>
      // 소켓 객체를 생성하면 URL의 소켓 서버와 즉시 연결 되고 서버쪽의 onOpen 메소드가 실행 된다.
      var socket = null;
      function connection() {
         // socket 클라이언트 리스너 함수들 (onopen, onclose, onmessage, onerror)
         socket.onopen = function(event) {
            $("#msgTxtArea").append(">>> open ...\n");
            //$("#msgTxtArea").append($("#sender").val()+"님이 입장하셨습니다!\n");
            //console.dir(event);
         }
         socket.onclose = function(event) {
            $("#msgTxtArea").append(">>> close ...\n");
         }
         socket.onmessage = function(event) {
            //$("#msgTxtArea").append(">>> message ...\n");
            console.log("온메세지 들어오나");
            try {
               var userList = JSON.parse(event.data);
               $("#fromUser").html('<option value="All">All</option>');
               for ( var i in userList) {
                  var user = userList[i];
                  $("#fromUser").append(
                        '<option value="'+user+'">' + user
                              + '</option>');

               }

            } catch (e) {
               $("#msgTxtArea").append("<<< " + event.data + "\n");
            }
         }
         socket.onerror = function(event) {
            $("#msgTxtArea").append(">>> error ...\n");
         }
      }

      $("#loginBtn").click(
            function(event) {

               // 로그인 버튼 누를시 해당 소켓 컨트롤러에 + user Value값과 함께 전달하여 소켓 연결한다.
               socket = new WebSocket("ws://localhost:8080/broadSocket/"
                     + $("#sendUser").val());
               //socket = new WebSocket("ws://localhost:8090/900WebSocketExample/broadSocket?user="+$("#sender").val());
               connection();
            });

      /* $("#SendBtn").click(function(event) {
       event.preventDefault();
       $("#msgTxtArea").append($("#sendUser").val() + " : " + $("#content").val() +"\n");
       socket.send($("#fromUser").val() + "|\|" + $("#content").val());

       }); */

      $("#closeBtn").click(function(event) {
         socket.close();
      });

      // 엔터 눌렀을때 메시지 출력할거야

      function enterkey() {
         console.log("여기는 들어오나");
         event.preventDefault();
         if (window.event.keyCode == 13) {
            console.log("실행");
            $("#msgTxtArea").append($("#sendUser").val() + " : " + $("#content").val() + "\n");
            socket.send($("#fromUser").val() + "|\|" + $("#content").val());
            $("#content").val(null);
            const top = $('#msgTxtArea').prop('scrollHeight');
            $('#msgTxtArea').scrollTop(top);
         }
      }
   </script>

</body>
</html>