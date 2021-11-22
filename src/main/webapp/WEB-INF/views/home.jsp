<%@page import="java.util.List"%>
<%@page import="com.study.game.dto.GameDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/search_table.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/main_style.css" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
    	let check = [false,false,false,false,false,false,false,false,false];
    	let realCheck = ["0","0","0","0","0","0","0","0","0"];
    </script>
    <!-- 헤더 시작! -->
<%@ include file="/inc/Header.jsp" %>
    <!-- 헤더 끗! -->
    <!-- 사진 나오는 곳-->
    <% List<GameDto> gameList = (List<GameDto>)request.getAttribute("gameList");%>
    <section class="hero">
    <%MemberDTO member = null;
    if(session.getAttribute("member") != null){
    	member = (MemberDTO)session.getAttribute("member");
    }%>
     <div class="container">
            <div class="hero__slider owl-carousel">
                <div class="hero__items set-bg" data-setbg="<%=request.getContextPath() %>/resources/img/hero/game_4.jpg">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <h2>Back 4 Blood</h2>
                                <p>좀비의 위협에서 동료와 함께 나아가라.</p>
                                <a href="#"><span>상세페이지로</span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hero__items set-bg" data-setbg="<%=request.getContextPath() %>/resources/img/hero/game_5.jpg">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                           
                                <h2>철권 7</h2>
                                <p>원조 액션 게임의 귀환</p>
                                <a href="#"><span>상세페이지로</span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
             <div class="hero__items set-bg" data-setbg="<%=request.getContextPath() %>/resources/img/hero/game_1.jpg">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <h2>Need for Speed</h2>
                                <p >극한의 스피드를 즐겨라~</p>
                                <a href="#"><span>상세페이지로</span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hero__items set-bg" data-setbg="<%=request.getContextPath() %>/resources/img/hero/game_2.jpg">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                            
                                <h2>Poppy Playtime</h2>
                                <p> 광기의 공장에서 탈출하라.</p>
                                <a href="#"><span>상세페이지로</span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hero__items set-bg" data-setbg="<%=request.getContextPath() %>/resources/img/hero/game_3.jpg">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                       
                                <h2>마인크래프트 던전스</h2>
                                <p>우민왕의 폭정을 막아라!</p>
                                <a href="#"><span>상세페이지로</span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            
        		</div>
        	</div>
    </section>
<br/>
<br/>
<br/>
     <div class="container">
     
		         <div class="table_home"> 
		               <table border="0" class="table"  >
		               <tr>
		                 <th><p>플랫폼</p></th>
		              	 <td><p><a name="pc" onclick="listFilter(event)">PC</a></p></td>
		      			 <td><p><a name="mobile" onclick="listFilter(event)">모바일</a></p></td>
		                 <td><p><a name="console" onclick="listFilter(event)">콘솔</a></p></td>
		                 <td></td>
		                  <td></td>
		                  <td></td>
		               </tr>
		                <tr>
			               <th><p>장르<p></th> 
			               <td><p><a name="action" onclick="listFilter(event)">액션</a></p></td>
			               <td><p><a name="adventureAndCasual" onclick="listFilter(event)">어드벤처 및 캐주얼</a></p></td>
			               <td><p><a name="rolePlaying" onclick="listFilter(event)">롤 플레잉</a></p></td>
			               <td><p><a name="simulation" onclick="listFilter(event)">시뮬레이션</a></p></td>
			               <td><p><a name="strategy" onclick="listFilter(event)">전략</a></p></td>
			         		<td><p><a name="sportsAndRacing" onclick="listFilter(event)">스포츠 및 레이싱</a></p></td>
		               </tr>
			               <tr>
			             	  <th><p>검색</p></th>			             	 
			             	   <td colspan="6"><input type="text" id="searchKeyword" name="keyword" onkeypress="press(event)"/>    <input type="button" value="검색하기" id="searchBtn" name="btn" onclick="listFilter(event)"/>   </td>
			               </tr>     
		           	    </table>
		            </div>
		                 </div>
    <!-- 사진 나오는곳 끝 -->

    <!-- 게임 리스트 출력 시작! -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="trending__product">
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-8">
                                <div class="section-title">
                                    <h4>최신순</h4>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <div class="btn__all">
                                    <a href="#" class="primary-btn">View All <span class="arrow_right"></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="row" id="list">
                         <%String[] tag={"PC","모바일","콘솔","액션","어드벤쳐 및 캐주얼",
                                    		"롤플레잉","시뮬레이션","전략","스포츠 및 레이싱"};%>
                        <%for(int i=0; i<gameList.size(); i++) {%>
                        	<%String platform = null;
                        		if(gameList.get(i).getPc() == 1){
                        			if(platform != null){
                        				platform += " / "+ tag[0];
                        			}else{
                        				platform = tag[0];
                        			}
                        		}
                        		if(gameList.get(i).getMobile() == 1){
                        			if(platform != null){
                        				platform += " / "+ tag[1];
                        			}else{
                        				platform = tag[1];
                        			}
                        		}
                        		if(gameList.get(i).getConsole() == 1){
                        			if(platform != null){
                        				platform += " / "+ tag[2];
                        			}else{
                        				platform = tag[2];
                        			}
                        		}
                        	%>
                        	
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                	<a href="<%=request.getContextPath()%>/gameInfo?GameId=<%=gameList.get(i).getGameId()%>">
                                    <div class="product__item__pic set-bg" data-setbg="<%=gameList.get(i).getTitleImg()%>"><%-- <%=gameList.get(i).getTitleImg()%> --%>
                                    <%if(platform != null) {%>
                                        <div class="ep"><%=platform %></div>
                                    <%}%>
                                    </div>
                                    </a>
                                    <div class="product__item__text">
                                        <ul>
                                        		<%if(gameList.get(i).getAction() == 1){%>
                                            			<li><%=tag[3]%></li>
                                            	<%}%> 
                                            	<%if(gameList.get(i).getAdventureAndCasual() == 1){%>
                                            			<li><%=tag[4]%></li>
                                            	<%}%>
                                            	<%if(gameList.get(i).getRolePlaying() == 1){%>
                                            			<li><%=tag[5]%></li>
                                            	<%}%>
                                            	<%if(gameList.get(i).getSimulation() == 1){%>
                                            			<li><%=tag[6]%></li>
                                            	<%}%>
                                            	<%if(gameList.get(i).getStrategy() == 1){%>
                                            			<li><%=tag[7]%></li>
                                            	<%}%>
                                            	<%if(gameList.get(i).getSportsAndracing() == 1){%>
                                            			<li><%=tag[8]%></li>
                                            	<%}%>
                                        </ul>
                                        <table>
                                       <tr>
                                       <th colspan="3" class="asdf">  <h5><a href="<%=request.getContextPath()%>/gameInfo?GameId=<%=gameList.get(i).getGameId()%>"><%=gameList.get(i).getProjectName()%></a></h5></th>
                                       </tr>
                                       </table>
                                    </div>
                                </div>
                            </div>
                            
                        <%}%>
                        </div>
                    </div>
                </div>
                
                <!--광고판  -->
                
              <div class="col-lg-4 col-md-6 col-sm-8">
                    <div class="product__sidebar">
                        <div class="product__sidebar__view">
                            <div class="section-title">
                                <h5>광고판</h5>
                            </div>
                           
                            <div class="filter__gallery">
                                <div class="product__sidebar__view__item set-bg mix day years"
                                data-setbg="<%=request.getContextPath() %>/resources/img/sidebar/adv-1.jpg">
                              
                              
                                <h5><a href="#" >LG 가전  가전의 생활 필수품</a></h5>
                                </div>
                            </div>
                            
                            
                            
                            <div class="product__sidebar__view__item set-bg mix month week"
                            data-setbg="<%=request.getContextPath() %>/resources/img/sidebar/adv-2.jpg">
                           
                            <h5><a href="#">SAMSUNG  겔럭시 폴드 폰 10% 세일</a></h5>
                        </div>
                        <div class="product__sidebar__view__item set-bg mix week years"
                        data-setbg="<%=request.getContextPath() %>/resources/img/sidebar/adv-3.jpg">
                        <div class="ep">2021 / 11  /  11</div>
                      
                        <h5><a href="#"> BBQ  이것은 양념인가 후라이드 인가</a></h5>
                    </div>
                    <div class="product__sidebar__view__item set-bg mix years month"
                    data-setbg="<%=request.getContextPath() %>/resources/img/sidebar/adv-4.jpg">
                  
                 
                    <h5><a href="#">다나와   세상에서 가장 싼 제품</a></h5>
                </div>
                <div class="product__sidebar__view__item set-bg mix day"
                  data-setbg="<%=request.getContextPath() %>/resources/img/sidebar/adv-5.jpg">
                <div class="ep">2021  /  12  /  22</div>
           
                <h5><a href="#">샤오미 중국 대기업 제품 환영</a></h5>
            </div>
        </div>
    </div>
    <div class="product__sidebar__comment">
        <div class="section-title">
           <h5>책 판매</h5> 
        </div>
        <div class="product__sidebar__comment__item">
            <div class="product__sidebar__comment__item__pic">
                <img src="<%=request.getContextPath() %>/resources/img/sidebar/comment-1.jpg" alt="">
            </div>
            <div class="product__sidebar__comment__item__text">
                <ul>
                    <li>Active</li>
                    <li>Movie</li>
                </ul>
                <h5><a href="#">The Seven Deadly Sins: Wrath of the Gods</a></h5>
               
            </div>
        </div>
        <div class="product__sidebar__comment__item">
            <div class="product__sidebar__comment__item__pic">
                <img src="<%=request.getContextPath() %>/resources/img/sidebar/comment-2.jpg" alt="">
            </div>
            <div class="product__sidebar__comment__item__text">
                <ul>
                    <li>Active</li>
                    <li>Movie</li>
                </ul>
                <h5><a href="#">Shirogane Tamashii hen Kouhan sen</a></h5>
                <span><i class="fa fa-eye"></i> 19.141 Viewes</span>
            </div>
        </div>
        <div class="product__sidebar__comment__item">
            <div class="product__sidebar__comment__item__pic">
                <img src="<%=request.getContextPath() %>/resources/img/sidebar/comment-3.jpg" alt="">
            </div>
            <div class="product__sidebar__comment__item__text">
                <ul>
                    <li>Active</li>
                    <li>Movie</li>
                </ul>
                <h5><a href="#">Kizumonogatari III: Reiket su-hen</a></h5>
                <span><i class="fa fa-eye"></i> 19.141 Viewes</span>
            </div>
        </div>
        <div class="product__sidebar__comment__item">
            <div class="product__sidebar__comment__item__pic">
                <img src="<%=request.getContextPath() %>/resources/img/sidebar/comment-4.jpg" alt="">
            </div>
            <div class="product__sidebar__comment__item__text">
                <ul>
                    <li>Active</li>-
                    <li>Movie</li>
                </ul>
                <h5><a href="#">Monogatari Series: Second Season</a></h5>
                <span><i class="fa fa-eye"></i> 19.141 Viewes</span>
            </div>
        </div>
    </div>
</div>
</div>
</div>
</section>
<!-- 게임 리스트 출력 끝! -->

<!-- 푸터 시작! -->
<%@ include file="/inc/Foother.jsp" %>
  <!-- 푸터 끝! -->

  <!-- Search model Begin -->
  <div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch"><i class="icon_close"></i></div>
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Search here.....">
        </form>
    </div>
</div>
<!-- Search model end -->

<!-- Js Plugins -->
<script>
let prevKeyword = "";
let keywordCheck = false;

function press(event){ 
	if(event.keyCode == 13){ 
		$("#searchBtn").trigger("click");
	} 
}

function listFilter(event){
	let getList;
	let gameListView = $("#list");
	let tag=["PC","모바일","콘솔","액션","어드벤쳐 및 캐주얼",
    		"롤플레잉","시뮬레이션","전략","스포츠 및 레이싱"];
	
	let name = event.target.name;
	
	let keyword = $("#searchKeyword").val();
	
	if(name === "btn" && prevKeyword === keyword){
		keywordCheck = false;
	}else{
		keywordCheck = true;
	}
	
	if(name === "pc"){
		check[0] = !check[0];
		if(check[0]){
			realCheck[0] = "1";
			console.log(name+"선택");
			$('a[name="pc"]').addClass("active");
		}else{
			realCheck[0] = "0";
			console.log(name+"선택해제");
			$('a[name="pc"]').removeClass("active");
		}
	}
	if(name === "mobile"){
		check[1] = !check[1];
		if(check[1]){
			realCheck[1] = "1";
			console.log(name+"선택");
			$('a[name="mobile"]').addClass("active");
		}else{
			realCheck[1] = "0";
			console.log(name+"선택해제");
			$('a[name="mobile"]').removeClass("active");
		}
	}
	if(name === "console"){
		check[2] = !check[2];
		if(check[2]){
			realCheck[2] = "1";
			console.log(name+"선택");
			$('a[name="console"]').addClass("active");
		}else{
			realCheck[2] = "0";
			console.log(name+"선택해제");
			$('a[name="console"]').removeClass("active");
		}
	}
	if(name === "action"){
		check[3] = !check[3];
		if(check[3]){
			realCheck[3] = "1";
			console.log(name+"선택");
			$('a[name="action"]').addClass("active");
		}else{
			realCheck[3] = "0";
			console.log(name+"선택해제");
			$('a[name="action"]').removeClass("active");
		}
	}
	if(name === "adventureAndCasual"){
		check[4] = !check[4];
		if(check[4]){
			realCheck[4] = "1";
			console.log(name+"선택");
			$('a[name="adventureAndCasual"]').addClass("active");
		}else{
			realCheck[4] = "0";
			console.log(name+"선택해제");
			$('a[name="adventureAndCasual"]').removeClass("active");
		}
	}
	if(name === "rolePlaying"){
		check[5] = !check[5];
		if(check[5]){
			realCheck[5] = "1";
			console.log(name+"선택");
			$('a[name="rolePlaying"]').addClass("active");
		}else{
			realCheck[5] = "0";
			console.log(name+"선택해제");
			$('a[name="rolePlaying"]').removeClass("active");
		}
	}
	if(name === "simulation"){
		check[6] = !check[6];
		if(check[6]){
			realCheck[6] = "1";
			console.log(name+"선택");
			$('a[name="simulation"]').addClass("active");
		}else{
			realCheck[6] = "0";
			console.log(name+"선택해제");
			$('a[name="simulation"]').removeClass("active");
		}
	}
	if(name === "strategy"){
		check[7] = !check[7];
		if(check[7]){
			realCheck[7] = "1";
			console.log(name+"선택");
			$('a[name="strategy"]').addClass("active");
		}else{
			realCheck[7] = "0";
			console.log(name+"선택해제");
			$('a[name="strategy"]').removeClass("active");
		}
	}
	if(name === "sportsAndRacing"){
		check[8] = !check[8];
		if(check[8]){
			realCheck[8] = "1";
			console.log(name+"선택");
			$('a[name="sportsAndRacing"]').addClass("active");
		}else{
			realCheck[8] = "0";
			console.log(name+"선택해제");
			$('a[name="sportsAndRacing"]').removeClass("active");
		}
	}
  if(keywordCheck){
	gameListView.empty();
	$.ajax({
		type: "POST",
		url: "<%=request.getContextPath()%>/test",
		data:{
			"pc":`${'${realCheck[0]}'}`,
			"mobile":`${'${realCheck[1]}'}`,
			"console":`${'${realCheck[2]}'}`,
			"action":`${'${realCheck[3]}'}`,
			"adventureAndCasual":`${'${realCheck[4]}'}`,
			"rolePlaying":`${'${realCheck[5]}'}`,
			"simulation":`${'${realCheck[6]}'}`,
			"strategy":`${'${realCheck[7]}'}`,
			"sportsAndracing":`${'${realCheck[8]}'}`,
			"keyword": keyword
		},
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success:function(data){
			getList = JSON.parse(data);
			for(var i = 0; i < getList.length; i++){
				let platformStr = null;
				let tagHtml = null;
				if(getList[i].pc === 1){
					if(platformStr != null){
        				platformStr += "/"+ tag[0];
        			}else{
        				platformStr = tag[0];
        			}
				}
				if(getList[i].mobile === 1){
					if(platformStr != null){
        				platformStr += "/"+ tag[1];
        			}else{
        				platformStr = tag[1];
        			}
				}
				if(getList[i].console == 1){
					if(platformStr != null){
        				platformStr += "/"+ tag[2];
        			}else{
        				platformStr = tag[2];
        			}
				}
				if(getList[i].action === 1){
					if(tagHtml != null){
						tagHtml += `<li>${'${tag[3]}'}</li>`;
        			}else{
						tagHtml = `<li>${'${tag[3]}'}</li>`;
        			}
				}
				if(getList[i].adventureAndCasual === 1){
					if(tagHtml != null){
						tagHtml += `<li>${'${tag[4]}'}</li>`;
        			}else{
						tagHtml = `<li>${'${tag[4]}'}</li>`;
        			}
				}
				if(getList[i].rolePlaying === 1){
					if(tagHtml != null){
						tagHtml += `<li>${'${tag[5]}'}</li>`;
        			}else{
						tagHtml = `<li>${'${tag[5]}'}</li>`;
        			}
				}
				if(getList[i].simulation === 1){
					if(tagHtml != null){
						tagHtml += `<li>${'${tag[6]}'}</li>`;
        			}else{
						tagHtml = `<li>${'${tag[6]}'}</li>`;
        			}
				}
				if(getList[i].strategy === 1){
					if(tagHtml != null){
						tagHtml += `<li>${'${tag[7]}'}</li>`;
        			}else{
						tagHtml = `<li>${'${tag[7]}'}</li>`;
        			}
				}
				if(getList[i].sportsAndracing === 1){
					if(tagHtml != null){
						tagHtml += `<li>${'${tag[8]}'}</li>`;
        			}else{
						tagHtml = `<li>${'${tag[8]}'}</li>`;
        			}
				}			
				
				gameListView.append(`<div class="col-lg-4 col-md-6 col-sm-6">
			 	<div class="product__item">
		 			<a href="./gameInfo?GameId=${'${getList[i].gameId}'}">
		 		 		<div class="product__item__pic set-bg" data-setbg="${'${getList[i].titleImg}'}">
                     		<div class="ep"style="z-index: 2" >${'${platformStr}'}</div>
                     		
                     		             	<div class="img1">	
                     		 <div class="scale1"><img src="${'${getList[i].titleImg}'}" height="325" style="border-radius:5px" > </img></div>
                     		 </div>
                 		</div>
		 			</a>
		 			<div class="product__item__text">
	 					<ul>
	 						${'${tagHtml}'}
	 					</ul>
	 					<table>
	 						<tbody>
	 							<tr>
	 								<th colspan="3" class="asdf"> <h5><a href="./gameInfo?GameId=${'${getList[i].gameId}'}">${'${getList[i].projectName}'}</a></h5></th>
	 	 						</tr>
	 	 					</tbody>
     					</table>
       				</div>
        		</div>`);
		}
		//console.log("검색단어:"+keyword);
		console.log("검색갯수:"+getList.length);
		if(getList.length === 0){
			gameListView.append(`<span style="color:white; font-weight:bold; font-size:1.5em;">검색결과가 존재하지 않습니다.</span>`);
		}
		prevKeyword = keyword;
			//location.reload();
			//location.href="/";
		},error:function(err){
			console.log(err);
		}
	});
  }
}
</script>
<script src="<%=request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/player.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery.nice-select.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/mixitup.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery.slicknav.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/owl.carousel.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/main.js"></script>


</body>
</html>