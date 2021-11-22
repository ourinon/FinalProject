<%@page import="com.study.game.dto.GameDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/inc/Header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/Detail.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/adv.css" type="text/css"> 
</head>
<body>
<%String[] tag={"PC","mobile","console","action","acventureAndCasual",
		"rolePlaying","simulation","strategy","sportsAndRacing"};%>
	<%GameDto game = (GameDto)request.getAttribute("game"); %>
	<%String platform = null;
	  String tagStr = null;
                        		if(game.getPc() == 1){
                        			if(platform != null){
                        				platform += "/"+ tag[0];
                        			}else{
                        				platform = tag[0];
                        			}
                        		}
                        		if(game.getMobile() == 1){
                        			if(platform != null){
                        				platform += "/"+ tag[1];
                        			}else{
                        				platform = tag[1];
                        			}
                        		}
                        		if(game.getConsole() == 1){
                        			if(platform != null){
                        				platform += "/"+ tag[2];
                        			}else{
                        				platform = tag[2];
                        			}
                        		}
                        		
                        		if(game.getAction() == 1){
                        			if(tagStr != null){
                        				tagStr += "/"+ tag[3];
                        			}else{
                        				tagStr = tag[3];
                        			}
                        		}
                        		if(game.getAdventureAndCasual() == 1){
                        			if(tagStr != null){
                        				tagStr += "/"+ tag[4];
                        			}else{
                        				tagStr = tag[4];
                        			}
                        		}
                        		if(game.getRolePlaying() == 1){
                        			if(tagStr != null){
                        				tagStr += "/"+ tag[5];
                        			}else{
                        				tagStr = tag[5];
                        			}
                        		}
                        		if(game.getSimulation() == 1){
                        			if(tagStr != null){
                        				tagStr += "/"+ tag[6];
                        			}else{
                        				tagStr = tag[6];
                        			}
                        		}
                        		if(game.getStrategy() == 1){
                        			if(tagStr != null){
                        				tagStr += "/"+ tag[7];
                        			}else{
                        				tagStr = tag[7];
                        			}
                        		}
                        		if(game.getSportsAndracing() == 1){
                        			if(tagStr != null){
                        				tagStr += "/"+ tag[8];
                        			}else{
                        				tagStr = tag[8];
                        			}
                        		}
                        		
 %>
	<div>
        <div class="container">    
  
            <div class="game_info">               
                <div class="info_box">
                    <div class="info_pic"><img src="<%=game.getTitleImg()%>"/></div>
                    
                    <table class="info_exp">
                        <tr>
                        	<th colspan="2">게임 타이틀</th>
                        </tr>
                        
                        <tr>
                        	<th>플랫폼</th>
                        	<%if(platform != null){%>
                        	<td><%=platform%></td>
                        	<%}else{%>
                        	<td></td>
                        	<%}%>
                        </tr>
                        <tr>
                        	<th>장르</th>
                        	<%if(tagStr != null){%>
                        		<td><%=tagStr%></td>
                        	<%}else{%>
                        		<td></td>
                        	<%}%>
                        </tr>
                        <tr>
                        	<th>제작사</th>
                        	<%if(game.getDeveloper() != null){%>
                        		<td><%=game.getDeveloper() %></td>
                        	<%}else{%>
                        		<td></td>
                        	<%}%>
                        </tr>
                        <tr>
                        	<th>이용등급</th>
                        	<td></td>
                        </tr>
                        <tr>
                        	<th>출시년도</th>
                        	<td><%=game.getReleaseDate()%></td>
                        </tr>
                        <tr>
                        	<th>별점</th>
                        	<td>평균 별점 가져와 나타냄</td>
                        </tr>
    
                    </table>
                </div>
                
                <div class="game_intro">
                    <h3><%=game.getProjectName() %></h3>

                    <p><%=game.getIntroduce()%></p>
                </div>
            </div>
    	</div>
    	
    	<section style="margin-top: 30px">
        <div class="container">
            <div>
                <div class="col-lg-18 game_opin">
                
                <div class="game_rev">
    
                        <div class="comu_link">관련 게임 커뮤니티 이동</div>
                        
                        <div class="rev_avg">
                            <div id="Star_Avg">평균 별점</div>
                            <div id="All_Star">점수별 분포</div>
                        </div>
            
                        <div class="rev_box">
                            <div id="give_star">
                                <div id="star_check">
                                    별점 기능
                                </div>
                                <div id="point_view">
                                    평점 3.0
                                </div>
                            </div>
            
                            <form class="rev_wri">
                                <textarea placeholder="리뷰 작성"></textarea>
                                
                                <br/>
                                <input type="checkbox">이 게임을 추천합니다</input>
                                <input type="button" value="제출"/>
                            </form>
                        </div>
            
                        <div class="rev_list">
                            <table class="rev_s">
                                <tr>
                                	<th rowspan="3">유저 얼굴</th>
                                	<td colspan="2">유저명</td>
                         	
                                </tr>
                                	
                                <tr>
                                  	<td>준 별점</td>
                                	<td>리뷰 날짜</td>
                                </tr>
                                	
                                <tr>
                                	<td colspan="2">댓글</td>
                                </tr>
                            </table>
                            
                                    
                        </div>
                    </div>
             
                    
                <div class="col-lg-4 col-md-6 col-sm-8">
                    <div class="product__sidebar ">
                        <div class="product__sidebar__view">
                            <div class="section-title">
                                <h5>광고판</h5>
                            </div>
                           
                            <div class="filter__gallery">
                                <div class="product__sidebar__view__item set-bg mix day years"
                                data-setbg="<%=request.getContextPath() %>/resources/img/sidebar/adv-1.jpg">
                              
                              
                                <h5><a href="#" >LG 가전  가전의 생활 필수품</a></h5>
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
                    <li>Active</li>
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
</div>
</div>
</section>
    </div>


</body>
</html>
<hr>
<%@ include file="/inc/Foother.jsp" %>