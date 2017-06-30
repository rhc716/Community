<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1"> <!-- 모바일환경 동작 -->
<title>Insert title here</title>
<link href="<%= request.getContextPath() %>/css/default.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body class="body_main">
<!-- 탑시작 -->
<div class="gallery_top">
<!-- 탑 로고와 검색 -->
	<h1 class="gallery_logoandsearch">
		<div class="gallery_h1">
			<a href="<%= request.getContextPath() %>/index.jsp"><img src="<%=request.getContextPath()%>/imgs/board/home_btn_small.jpg"></a>
			<a><img src=""></a>
		
		<span class="gallery_search">
			<input type="text" class="search_input" placeholder="게시판 통합검색">
		</span>
			<input type="button" class="search_btn" value="검색">
		</div>
	</h1>
<!-- 우측상단 작은메뉴 -->
	<div class="gallery_topsmallmenu">
		<ul>
			<c:if test="${S_NAME!=null}">
				<li class="btn_loginsmall">
					<a href ="<%= request.getContextPath() %>/login/logout.jsp">
						<img src="<%= request.getContextPath() %>/imgs/gallery/btn_gall_logout.gif">
					</a>
				</li>
			</c:if>
			<c:if test="${S_NAME==null}">
				<li class="btn_loginsmall">
					<a href="<%= request.getContextPath() %>/login/login_form.jsp">
						<img src="<%= request.getContextPath() %>/imgs/gallery/btn_gall_login.gif">
					</a>
				</li>
			</c:if>
			<li class="line_smallmenu"></li>
			<li class="line_smallmenu"></li>
			<li class="line_smallmenu"></li>
			<li class="line_smallmenu"></li>
		</ul>
	</div>
<!-- 네비바 -->	
	<div class="gallery_navbar">
		<div class="nav_div">
			<ul>
				<li class="top_li dropdown"><span class="top_span dropbtn"><a href="<%= request.getContextPath() %>/gallery/gallery_main.jsp">게시판 +</a></span>
					<p class="dropdown-content">
						<a href="#">Link 1</a>
    					<a href="#">Link 2</a>
    					<a href="#">Link 3</a>
					</p>
				</li>
				<li><span class="">블로그</span></li>
				<li><span class="">미정</span></li>
				<li><span class="">미정</span></li>
				<li><span class="">미정</span></li>
				<li><span class="">미정</span></li>
				<li><span class="">미정</span></li>
			</ul>
		</div>
	</div>
</div>	
<!-- 탑끝 -->
<!-- 메인시작 --> 
<div class="Content_main">
<!-- 왼쪽메인시작 -->
	<div class="column_left1_gall">
		<div class="gallery_main_left_box">
			<div class="gallery_main_left_sub1">
				주간 추천 게시물
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
	</div>
<!-- 왼쪽메인끝 -->
<!-- 오른쪽광고영역 -->
	<div class="column_right_gall">
		<div class="gallery_main_right_adv">
			<br><br><br><br><br><br><br><br><br>광고영역 B01 250px * 500px 
		</div>
	</div>
<!-- 중앙메인 시작 -->
	<div class="column_middle_gall">
		<div class="gallery_main_middle_box">
			<div class="gallery_main_middle_sub">
				<ul>
					<li>소분류</li>
					<li>소분류</li>
					<li>소분류</li>
					<li>소분류</li>
				</ul>
			</div>
			<div class="gallery_main_middle_con">
				<ul>
				<!-- 보드넘버를 일단 일일이 적어서 겟방식으로 보내줄것임, 나중에 DB에서 불러와 갤러리 목록을 뿌려주기 전까지 -->
					<li><a href="./gallery_board.jsp?boardno=1&page_num=1">a 게시판</a></li>
					<li><a href="./gallery_board.jsp?boardno=2&page_num=1">b 게시판</a></li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
				</ul>
				<ul>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
				</ul>
				<ul>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
				</ul>
				<ul>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
				</ul>
			</div>
		</div>	
		<div class="gallery_main_middle_box">
			<div class="gallery_main_middle_sub">
				<ul>
					<li>소분류</li>
					<li>소분류</li>
					<li>소분류</li>
					<li>소분류</li>
				</ul>
			</div>
			<div class="gallery_main_middle_con">
				<ul>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
				</ul>
				<ul>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
				</ul>
				<ul>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
				</ul>
				<ul>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
					<li>게시판</li>
				</ul>
			</div>
		</div>	
	</div>
<!-- 중앙메인 끝 -->
</div>
<!-- 서비스(풋터 위쪽 	광고영역) -->
<div class="content_service">
	광고영역 B02 1000px * 220px
</div>
<!-- 메인끝 -->
<!-- 풋터 -->
<div class="Foot_main">
</div>
</body>
</html>
