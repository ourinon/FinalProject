<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/resources/css/motiva_sans.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="content">
		<div class="logo">
			<span id="logo_holder">
									<a href="https://store.steampowered.com/?snr=1_4_4__global-header">
						<img src="./Steam에 오신 것을 환영합니다_files/logo_steam.svg" width="176" height="44">
					</a>
							</span>
		</div>

			<div class="supernav_container">
	<a class="menuitem supernav" href="https://store.steampowered.com/?snr=1_4_4__global-header" data-tooltip-type="selector" data-tooltip-content=".submenu_store">
		상점	</a>
	


			<a class="menuitem supernav" style="display: block" href="https://steamcommunity.com/" data-tooltip-type="selector" data-tooltip-content=".submenu_community">
			커뮤니티		</a>
		
		

	
						<a class="menuitem" href="https://store.steampowered.com/about/?snr=1_4_4__global-header">
				정보			</a>
			
	<a class="menuitem" href="https://help.steampowered.com/ko/">
		지원	</a>
	<div class="supernav_content" style="position: absolute; z-index: 1500; opacity: 0; left: 43px; top: 64px; pointer-events: none;"><div class="submenu_community" style="" data-submenuid="community">
			<a class="submenuitem" href="https://steamcommunity.com/">홈</a>
			<a class="submenuitem" href="https://steamcommunity.com/discussions/">토론</a>
			<a class="submenuitem" href="https://steamcommunity.com/workshop/">창작마당</a>
			<a class="submenuitem" href="https://steamcommunity.com/market/">장터</a>
			<a class="submenuitem" href="https://steamcommunity.com/?subsection=broadcasts">방송</a>
											</div></div><div class="supernav_content" style="position: absolute; z-index: 1500; opacity: 0; left: 1px; top: 64px; pointer-events: none;"><div class="submenu_store" style="" data-submenuid="store">
		<a class="submenuitem" href="https://store.steampowered.com/?snr=1_4_4__global-header">홈</a>
					<a class="submenuitem" href="https://store.steampowered.com/explore/?snr=1_4_4__global-header">탐색 대기열</a>
				<a class="submenuitem" href="https://steamcommunity.com/my/wishlist/">찜 목록</a>
		<a class="submenuitem" href="https://store.steampowered.com/points/shop/?snr=1_4_4__global-header">포인트 상점</a>	
       	<a class="submenuitem" href="https://store.steampowered.com/news/?snr=1_4_4__global-header">뉴스</a>
					<a class="submenuitem" href="https://store.steampowered.com/stats/?snr=1_4_4__global-header">통계</a>
					</div></div></div>
					</div>

헤더 : <br>

<a href = "/header/game">게임 정보</a><br>

<a href = "/header/genre">장르 정보</a><br>

<a href = "/header/ranking">랭킹</a><br>

<a href = "/header/notice">공지사항</a><br>

<p>내 정보</p><br>

<p>로그인, 로그아웃</p><br>
<hr>


플랫폼 : <br><br>

 <a href = "/platform/online">온라인</a> 

 <a href = "/platform/PC">PC</a>  
 
 <a href = "/platform/video">비디오</a>
 
 <hr>

장르 : <br>

<a href = "/genre/AOS">AOS</a><br>

<a href = "/genre/FPS">FPS</a><br>

<a href = "/genre/Racing">레이싱</a><br>

<a href = "/genre/RPG">RPG</a><br>

<a href = "/genre/Shooting">슈팅</a><br>

<a href = "/genre/Sports">스포츠</a><br>

<hr>

상태 : 

<a href = "/state/Developing">개발중</a> 

<a href = "/state/Free">무료</a> 

<a href = "/state/Membership">정약제</a>

<a href = "/state/Open Beta">오픈 베타</a> 

<a href = "/state/Over">서비스 종료</a> 

<a href = "/state/Partially paid">부분 유료화</a> <br>

<hr>

검색 : <input type = "text" /> <br><br>

<hr>


</body>
</html>