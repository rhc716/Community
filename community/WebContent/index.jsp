<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1"> <!-- 모바일환경 동작 -->
<title>Insert title here</title>
<link href="<%= request.getContextPath() %>/css/default.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body class="body_main">
<!-- 탑시작 -->
<div class="top_main">
<!-- 상단로고 -->
			<h1 class="top_logo">
				<a href=""><img src=""></a>
			</h1>
<!-- 탑헤드 -->
		<div class="top_head">
			<div class=wrap_search>
				<form id="searchform" name="search_process" class="sch_smit" method="get" accept-charset="utf-8" action="" role="search" onSubmit="return globalSearch(this);" >
					<legend class="screen_out">통합 검색</legend>
					<div class="sch_inr top_search">
						<div id="main_keyword" name="main_keyword" class="box_search">
							<input type="text" id="preSWord" name="search" class="tf_keyword" placeholder="게시판 통합검색" title="게시판 통합검색" accesskey="f" type="search" autocomplete="off" style='ime-mode:active;'>
						</div>
						<button type="submit" id="searchSubmit" class="btn_search btn_globalSearch"><span>검색</span></button>
					</div>
				</form>
			</div>
		</div>
<!-- 상단 메뉴 -->	
	<div class="top_menu">
		<ul class="top_menu_ul">
			<li class="top_li dropdown"><span class="top_span dropbtn"><a href="./gallery/gallery_main.jsp">게시판 +</a></span>
				<p class="dropdown-content">
					<a href="#">Link 1</a>
    				<a href="#">Link 2</a>
    				<a href="#">Link 3</a>
				</p>
			</li>
			<li class="top_li"><span class="top_span">m.게시판</span></li>
			<li class="top_li"><span class="top_span">블로그</span></li>
			<li class="top_li"><span class="top_span">미정</span></li>
			<li class="top_li"><span class="top_span">미정</span></li>
			<li class="top_li"><span class="top_span">미정</span></li>
			<li class="top_li"><span class="top_span">미정</span></li>
		</ul>
	</div>
</div>	
<!-- 탑끝 -->
<!-- 메인시작 --> 
<div class="Content_main">
<!-- 왼쪽메인시작 -->
	<div class="column_left">
		<div class="gallery_main_left_box">
			<div class="gallery_main_left_sub1">
				추천 게시판
			</div>
			<div class="gallery_main_left_content1">
				<ul>
					<li> 1 </li>
					<li> 2 </li>
					<li> 3 </li>
					<li> 4 </li>
					<li> 5 </li>
					<li> 6 </li>
				</ul>
			</div>
		</div>
		<div class="main_left_box">
			<div class="main_left_sub1">
				
			</div>
			<div class="main_left_content1">
				
			</div>
		</div>
	</div>	
<!-- 왼쪽메인끝 -->
<!-- 오른쪽메인시작 -->
	<div class="column_right">
<!-- 로그인부분 -->
		<%@ include file ="./module/login.jsp" %>
		<div class="column_right_gall">
		<div class="gallery_main_right_adv">
			<br><br><br><br><br><br><br><br><br>광고영역 A01 250px * 500px 
		</div>
		<div class="gallery_main_right_adv2">
			<br><br><br><br><br><br>광고영역 A03 250px * 300px
		</div>
	</div>
	</div>
<!-- 오른쪽메인끝 -->
	<div class="column_middle">
		<div class="main_middle_sub">
			게시글		
		</div>
		<div class="main_middle_con">
			<ul>
				<li></li>
				<li></li>
				<li></li>
			</ul>
			<ul>
				<li></li>
				<li></li>
				<li></li>
			</ul>
		</div>
	</div>
</div>	
<!-- 서비스(풋터 위쪽 	광고영역) -->
<div class="content_service">
	광고영역 A02 1000px * 220px
</div>
<!-- 메인끝 -->
<!-- 풋터 -->
<div class="Foot_main">
</div>
</body>
</html>