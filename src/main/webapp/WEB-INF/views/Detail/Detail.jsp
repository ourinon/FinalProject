<%@page import="java.util.List"%>
<%@page import="com.study.game.dto.ReviewDTO"%>
<%@page import="com.study.game.dto.GameDto"%>
<%@page import="com.study.game.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/inc/Header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
   src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
   
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/Detail.css"
   type="text/css">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</head>
<body>


	
   <%
   String[] tag = {"PC", "모바일", "콘솔", "액션", "어드벤쳐 및 캐주얼", "롤플레잉", "시뮬레이션", "전략",
   "스포츠 및 레이싱"};
   %>
   <%
   GameDto game = (GameDto) request.getAttribute("game");
   MemberDTO member = (MemberDTO)session.getAttribute("member");
   List<ReviewDTO> list = (List<ReviewDTO>)request.getAttribute("list");
   List<Integer> ratess = (List<Integer>)request.getAttribute("ratess");
   %>
   <%
   String platform = null;
   String tagStr = null;
   if (game.getPc() == 1) {
      if (platform != null) {
         platform += " / " + tag[0];
      } else {
         platform = tag[0];
      }
   }
   if (game.getMobile() == 1) {
      if (platform != null) {
         platform += " / " + tag[1];
      } else {
         platform = tag[1];
      }
   }
   if (game.getConsole() == 1) {
      if (platform != null) {
         platform += " / " + tag[2];
      } else {
         platform = tag[2];
      }
   }

   if (game.getAction() == 1) {
      if (tagStr != null) {
         tagStr += " / " + tag[3];
      } else {
         tagStr = tag[3];
      }
   }
   if (game.getAdventureAndCasual() == 1) {
      if (tagStr != null) {
         tagStr += " / " + tag[4];
      } else {
         tagStr = tag[4];
      }
   }
   if (game.getRolePlaying() == 1) {
      if (tagStr != null) {
         tagStr += " / " + tag[5];
      } else {
         tagStr = tag[5];
      }
   }
   if (game.getSimulation() == 1) {
      if (tagStr != null) {
         tagStr += " / " + tag[6];
      } else {
         tagStr = tag[6];
      }
   }
   if (game.getStrategy() == 1) {
      if (tagStr != null) {
         tagStr += " / " + tag[7];
      } else {
         tagStr = tag[7];
      }
   }
   if (game.getSportsAndracing() == 1) {
      if (tagStr != null) {
         tagStr += " / " + tag[8];
      } else {
         tagStr = tag[8];
      }
   }
   %>
   <!-- Breadcrumb Begin -->
   <div class="breadcrumb-option">
      <div class="container"></div>
   </div>
   <!-- Breadcrumb End -->

   <!-- Anime Section Begin -->
   <section class="anime-details spad">
      <div class="container">
         <div class="anime__details__content">
            <div class="row">
               <div class="col-lg-3">
                  <img src="<%=game.getTitleImg()%>" height="291.5" style="border: 1px solid white;
    border-radius: 20px;"></img>
               </div>
               <div class="col-lg-9">
                  <div class="anime__details__text">
                     <div class="anime__details__title">
                        <h3><%=game.getProjectName()%></h3>
                     </div>
                     <div class="anime__details__widget">
                        <div class="row">
                           <div class="col-lg-6 col-md-6">
                              <ul>
                                 <%
                                 if (platform != null) {
                                 %>
                                 <li><span>플랫폼:</span><%=platform%></li>
                                 <%
                                 } else {
                                 %>
                                 <li><span>플랫폼:</span></li>
                                 <%
                                 }
                                 %>

                                 <%
                                 if (tagStr != null) {
                                 %>
                                 <li><span>장르:</span><%=tagStr%></li>
                                 <%
                                 } else {
                                 %>
                                 <li><span>장르:</span></li>
                                 <%
                                 }
                                 %>
                                 <li><span>제작사:</span><%=game.getDeveloper()%></li>
                                 <li><span>출시년도:</span><%=game.getReleaseDate()%></li>
                                 <li><span>별점:</span><%=game.getRate() %> 점</li>
                              </ul>
                           </div>
                           <div class="col-lg-6 col-md-6">
                              <ul>
                                 <p><%=game.getIntroduce()%></p>
                              </ul>
                           </div>

                        </div>
                     </div>
                     <div class="anime__details__btn">
                        <a
                           href="<%=request.getContextPath()%>/gameInfo/community?GameId=<%=game.getGameId()%>"
                           class="follow-btn" style="">
                           <h5 style="color: white;">
                              커뮤니티&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
                                 fill="currentColor" class="bi bi-arrow-right-square"
                                 viewBox="0 0 16 16">
  <path fill-rule="evenodd"
                                    d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm4.5 5.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z" />
</svg>
                           </h5>
                        </a>

                     </div>
                  </div>
               </div>
            </div>
         </div>

         <div class="game_rev">
            <div class="rev_avg">
               <div class="details__rating">

                  <div class="rating">
                     <h1><%=game.getRate() %></h1>
                     <%int starstar = (int)game.getRate();%>
                     <%for(int i = 0; i < starstar; i++)%><a href="#"><i class="fa fa-star"> </i></a>
                     <%for(int i = 0; i < 5-starstar; i++)%><a href="#"><i class="fa fa-star" style="color: white"></i></a>
                  </div>

                  <div style="width: 55%; height: 100%; margin-left: 110px;">
                     <canvas id="canvas"></canvas>
                  </div>
               </div>



            </div>
            <div class="rev_box" onclick="loginCheck()">
               <div class="section-title">
                  <h5>리뷰</h5>
               </div>
               <%boolean YoN = false, YES = false;%>
	           <%String hehhe = String.valueOf(5); int recco = 0, rvid = 0, helpme = 0;%>
               <%for(int i = 0; i < list.size(); i++){%>
               		<%YoN = list.get(i).getTv_writer()==member.getM_id();%>
               <form class="rev_wri written" style="height: 70%; width: 90%; margin: auto; display: none;
					<%if(YoN){%>display: block;
						<%hehhe = String.valueOf(list.get(i).getRv_star());%>
						<%recco = list.get(i).getRv_reco();%>
						<%rvid = list.get(i).getRv_id();%>
						<%helpme = i;%>
						<%YES = true;%>
					<%}%>
               ">
				<div name="rv_content" style=" width: 99%; height: 200px; background: white; border-radius: 5px 20px 50px 20px; padding: 10px; overflow-y: auto;">
						<%=list.get(helpme).getRv_content() %>
				</div>
				<%if(YoN&&recco==1) {%><h5 style="color: aliceblue; margin-left: 10px; margin-top: 10px;">이 게임을 추천합니다</h5>
				<%}else %><h5 style="color: grey; margin-left: 10px; margin-top: 10px;">이 게임을 추천하지 않았습니다</h5>
				<input type="button" onclick="reviewEdit()" class="btn1" value="수정" style="margin-top: -20px; float: right; background-color: rgb(255, 255, 255); padding: 8px 30px; color: black; border: 2px solid steelblue; transition: 0.3s; border-radius: 5px" />
               </form>
			   <%}%>
              <form id="unwritten" method="post" class="rev_wri" onSubmit="return submitCheck()" style="display: none;
              <%if(!YES){%>
              display: block;" action="<%=request.getContextPath()%>/gameInfo/rvCreate
              <%}else{%>
              " action="<%=request.getContextPath()%>/gameInfo/rvUpdate
              <%} %>
              ">
              <div id="give_star" style="margin-left: 0px;">
					<select style="display: none" id="makeStar">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
					<div class="rating">
						<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star"></i>
					</div>
					<p style="color: white; margin-bottom: 0;">평점 : <span id="Score">0</span></p>
				</div>
              <%if(member != null){ %>
              	  <input type="hidden" name="tv_writer" value="<%=member.getM_id()%>" />
              	  <input type="hidden" name="tv_wnic" value="<%=member.getM_nickname() %>" />
              	  <input type="hidden" name="rv_target" value="<%=request.getParameter("GameId")%>" />
              	  <input type="hidden" name="tv_wimg" value="<%=member.getM_img()%>" />
              	  <input type="hidden" name="rv_star" id="rv_star" value="5"/>
              	  <input type="hidden" name="apply_id" value="<%=rvid%>">
              <%} %>
                  <textarea placeholder="리뷰 작성" name="rv_content" style="border-radius: 5px 20px 50px 20px; padding: 10px;"><%for(int i = 0; i < list.size(); i++)if(list.get(i).getTv_writer()==member.getM_id())%><%=list.get(i).getRv_content()%></textarea>		
                  <br />
                  <h4 style="color: white;">
                     <input name="rv_reco" type="checkbox" value=1 style="width: 20px; height: 20px;"
                     <%if(YoN&&recco==1)%>checked="checked"
                     ></input>이게임을 추천합니다
                  </h4>
                  <input type="submit" class="btn1" value="보내기" />
               </form>  
            </div>

            <div class="rev_list"></div>
         </div>


         <div class="row">
            <div class="col-lg-8 col-md-8">
               <div class="anime__details__review">
                  <div class="section-title">
                     <h5>Reviews</h5>
                  </div>
                  
                  <%for(int i = 0; i < list.size(); i++){%>
                  		<div class="anime__review__item">
                     <div class="anime__review__item__pic">
                     <%if(list.get(i).getTv_wimg() != null){%>
                        <img
                           src="<%=list.get(i).getTv_wimg()%>"
                           alt="">
                     <%}else{%>
                     	<img
                           src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"
                           alt="">
                     <%}%>
                     </div>
                     <div class="anime__review__item__text">
                        <table>
                           <tr>
                              <th><h6><%=list.get(i).getTv_wnic()%></h6></th>
                              <th>
                                 <h6>
                                    <span>
                                    <%for(int r = 0; r < list.get(i).getRv_star(); r++) {%>
                                    	<i class="fas fa-star" style="color: orange"></i>
                                    <%} %>
                                    </span>
                                 </h6>
                              </th>
                              <th>
                                 <h6>
                                    <span><%=list.get(i).getRv_date()%></span>
                                 </h6>
                              </th>
                           </tr>
                        </table>
                        <p><%=list.get(i).getRv_content()%></p>
                        <%if(session.getAttribute("member") != null){%>
                        	<%if(0 == member.getM_id()){%>
                        	 <form action="<%=request.getContextPath()%>/gameInfo/reviewDelete" method="post">
                        	 	<input type="hidden" name="rv_target" value="<%=request.getParameter("GameId")%>" />
                        	 	<input type="hidden" name="rv_id" value="<%=list.get(i).getRv_id()%>" />
                        		<input type="submit" value="삭제" />
                        	</form>
                        	
                        	<form action="<%=request.getContextPath()%>/gameInfo/reviewUpdate" method="post">
                        	 	<input type="hidden" name="rv_target" value="<%=request.getParameter("GameId")%>" />
                        	 	<input type="hidden" name="rv_id" value="<%=list.get(i).getRv_id()%>" />
                        		<input type="button" value="수정" onclick="reviewMod()"/>
                        	</form>
                        	<%}%>
                        <%}%>
                       </form>
                     </div>
                  </div>
                  <%}%>
                  
                  
               </div>

               <!--    리뷰 채팅 참고 -->
               <!--    <div class="anime__details__form">
                  <div class="section-title">
                     <h5>Your Comment</h5>
                  </div>
                  <form action="#">
                     <textarea placeholder="Your Comment"></textarea>
                     <button type="submit">
                        <i class="fa fa-location-arrow"></i> Review
                     </button>
                  </form>
               </div> -->
            </div>




            <div class="col-lg-4 col-md-4">
               <div class="anime__details__sidebar">
                  <div class="section-title">



                     <h5>광고판</h5>
                  </div>
                  <div class="product__sidebar__view__item set-bg">
                     <img
                        src="<%=request.getContextPath()%>/resources/img/sidebar/adv-1.jpg"
                        alt="" width="100%">
                     <h5>
                        <a href="#">LG 가전 가전의 생활 필수품</a>
                     </h5>
                  </div>
                  <div class="product__sidebar__view__item set-bg">
                     <img
                        src="<%=request.getContextPath()%>/resources/img/sidebar/tv-2.jpg"
                        alt="" width="100%" height="100%">
                     <h5>
                        <a href="#">The Seven Deadly Sins: Wrath of the Gods</a>
                     </h5>
                  </div>
                  <div class="product__sidebar__view__item set-bg">
                     <img
                        src="<%=request.getContextPath()%>/resources/img/sidebar/adv-3.jpg"
                        alt="" width="100%">
                     <h5>
                        <a href="#"> BBQ 이것은 양념인가 후라이드 인가</a>
                     </h5>
                  </div>
                  <div class="product__sidebar__view__item set-bg">
                     <img
                        src="<%=request.getContextPath()%>/resources/img/sidebar/tv-4.jpg"
                        alt="" width="100%">
                     <h5>
                        <a href="#">Fate/stay night: Heaven's Feel I. presage flower</a>
                     </h5>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- Anime Section End -->


   <script>
   	  function reviewClick(event){
   		  
   	  }
   	  
   	  function reviewMod() {
   		prompt('수정할 내용을 입력하세요', '');
   	  }
   	  
   	  function reviewEdit() {
   		var x = document.getElementsByClassName("written");
   		for (i = 0; i < x.length; i++) {
   		    x[i].style.display = 'none';
   		}
   		document.getElementById("unwritten").style.display = 'block';
	  }
   	  
   	  window.onload = function(){
   		var tnt = "<%=hehhe%>";
   		tnt = String(tnt);
		$('#give_star .fas').css({
			color : '#FFF'
		});
		$('#give_star .fas:nth-child(-n+' + tnt + ')').css({
			color : '#e89f12'
		});
		value.innerHTML = `<span>${'${tnt}'}</span>`;
   	  }
   
      new Chart(document.getElementById("canvas"),
            {
               type : 'horizontalBar',
               data : {
                  labels : [ '5', '4', '3', '2', '1' ],
                  datasets : [ {
                     label : '별점 분포도',
                     data : [<%=ratess.get(4)%> , <%=ratess.get(3)%>, <%=ratess.get(2)%>, <%=ratess.get(1)%>, <%=ratess.get(0)%> ],
                     borderColor : [ 'green', 'lime', 'yellow',
                           'orange', 'red' ],
                     backgroundColor : [ 'green', 'lime', 'yellow',
                           'orange', 'red' ],
                     fill : false,
                  } ]
               },
               options : {
                  responsive : true,
                  tooltips : {
                     mode : 'index',
                     intersect : false,
                  },
                  hover : {
                     mode : 'nearest',
                     intersect : true
                  }
               }
            });
      
      function loginCheck(){
    	  <%if(session.getAttribute("member") == null){%>
    	  	alert("로그인 후 이용할 수 있습니다.");
    	  	location.href = "<%=request.getContextPath()%>/login";
    	  <%}%>
      }
      
      function submitCheck(){
    	  <%if(session.getAttribute("member") != null){%>
    	  	return true
    	  <%}%>
    	  return false;
      }
      
      let value = document.getElementById('Score');

		console.log(value);

		$(function() {

			var rating = $('.review .rating');

			rating.each(function() {
				var targetScore = $(this).attr("data-rate");
				console.log(targetScore);
				$(this).find('.fas:nth-child(-n+' + targetScore + ')').css({
					color : '#FFFF00'
				});

			});

			var userScore = $('#makeStar'); // 별점 주기

			userScore.change(function() {
				var userScoreNum = $(this).val();
				console.log("여기는 결과 화면 : " + userScore);
				$('#give_star .fas').css({
					color : '#000'
				});
				$('#give_star .fas:nth-child(-n+' + userScoreNum + ')').css({
					color : '#FFFF00'
				});

			});

			$('#give_star .fas').click(function() {
				console.log("별누름");
				var targetNum = $(this).index() + 1;
				targetNum = String(targetNum);
				$('#give_star .fas').css({
					color : '#FFF'
				});
				$('#give_star .fas:nth-child(-n+' + targetNum + ')').css({
					color : '#e89f12'
				});
				value.innerHTML = `<span>${'${targetNum}'}</span>`;
				$('#rv_star').val(targetNum);
				console.log(targetNum); // 점수
			});

		});
   </script>

</body>
</html>
<hr />
<%@ include file="/inc/Foother.jsp"%>