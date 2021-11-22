<%@page import="com.study.game.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content=s"ie=edge">
    
    <title>Anime | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/plyr.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style.css" type="text/css">
     <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/header1.css" type="text/css">
    <style>
   border: 1px solid yellow;
   </style>
</head>
<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
    <header class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="header__logo">
                         <a href="/"> <img
                     src="<%=request.getContextPath()%>/resources/img/logo_img/logo_font.jpg"
                     alt="" style="height: 26px; width: 140 px;">

                  </a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li class="header_list" ><a href="/" style="text-decoration: none">홈으로</a></li><!--  -class="active"-->
                                <li  class="header_list"><a href="<%=request.getContextPath() %>/gameInfo/ranking" style="text-decoration: none">랭킹</a>
                               <!--  <span class="arrow_carrot-down"></span> -->
<!--                                     <ul class="dropdown">
                                        <li><a href="/categories.html">Categories</a></li>
                                        <li><a href="./anime-details.html">Anime Details</a></li>
                                        <li><a href="./anime-watching.html">Anime Watching</a></li>
                                        <li><a href="./blog-details.html">Blog Details</a></li>
                                        <li><a href="./signup.html">Sign Up</a></li>
                                        <li><a href="./login.html">Login</a></li>
                                    </ul> -->
                                </li>
                                <li class="header_list"><a href="/board/notice" style="text-decoration: none">공지사항</a></li>
                                <li class="header_list"><a href="<%=request.getContextPath()%>/memo" style="text-decoration: none">메모</a></li>
                               
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-lg-4">
<!--                     <div class="header__right" > --> <div class="header__nav">
                     <nav class="header__menu mobile-menu">
                    <ul style="float: right;">
                       <li> <a href="#" style="text-decoration: none"><span ></span></a></li>
                        <%if(session.getAttribute("member") != null){%>
                              <%MemberDTO member = (MemberDTO)session.getAttribute("member");%>
                            <li>   <a href="<%=request.getContextPath()%>/myPage" style="text-decoration: none"><%=member.getM_nickname()%><span class="arrow_carrot-down"></span></a>
                            
                            <ul class="dropdown"  style="border: 1px solid red; border-radius: 5px">
                                        <li><a href="<%=request.getContextPath()%>/myPage/profile" style="text-decoration: none">G-1300K 프로필</a></li>
                                        <li><a href="<%=request.getContextPath()%>/myPage/modify" style="text-decoration: none">개인정보 변경</a></li>
                                        <li><a href="<%=request.getContextPath()%>/myPage/remove" style="text-decoration: none">회원 탈퇴</a></li>
                                        <li><a href="<%=request.getContextPath()%>/myPage/passwordModify" style="text-decoration: none">비밀번호 변경</a></li>
                                        <li><a href="<%=request.getContextPath()%>/myPage/myWrite" style="text-decoration: none">내 글보기</a></li>
                                        <%if(member != null){%>
                                          <%if(member.getM_admin() == 1){%>
                                             <li><a href="<%=request.getContextPath()%>/crud/input" style="text-decoration: none">글 생성</a></li>
                                               <li><a href="<%=request.getContextPath()%>/myPage/read" style="text-decoration: none">회원조회</a></li>
                                             
                                          <%} %>
                                         <%} %>
                                    </ul></li>
                             <li>   <a href="<%=request.getContextPath()%>/logout" style="text-decoration: none ">로그아웃</a></li>
                        <%}else{%>
                             <li>   <a href="<%=request.getContextPath()%>/login" style="text-decoration: none">회원가입</span></a></li>
                         <li>   <a href="<%=request.getContextPath()%>/login" style="text-decoration: none;  border-radius: 40%; background-color: #1d1e39;     padding: 10px 20px;  " >로그인</span></a></li>
                      </ul>
                      </nav>
                        <%}%>
                    </div>
                </div>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </header>
    
<script src="<%=request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/player.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery.nice-select.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/mixitup.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery.slicknav.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/owl.carousel.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/main.js"></script>