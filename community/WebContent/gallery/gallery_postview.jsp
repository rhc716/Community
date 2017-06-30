<%@page import="myproject.community.dto.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myproject.community.dao.Pdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1"> <!-- 모바일환경 동작 -->
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="<%= request.getContextPath() %>/css/default.css" rel="stylesheet" type="text/css" media="all" />
<script>
$(document).ready(function(){
	
	// 현재 페이지의 게시글 리스트 불러와서 뿌려주기 ajax 
	var postlist = $.ajax({
		type: "post"
		,dataType : "json"
		,url : "<%= request.getContextPath() %>/paging.jj?boardno=${param.boardno}&page_num=${param.page_num}"
	});
	
	postlist.done(function( msg ) {
		console.log(msg);
		for(var i=0; i < msg.length; i++){
			$('#postlist').append(
				'<tr>'
					+'<td id="td1">'+msg[i].post_no+'</td>'
					+'<td id="td2"><a href="<%=request.getContextPath() %>'
					+'/postview.jj?boardno='+${param.boardno}+'&amp;page_num='
					+${param.page_num}+'&amp;postno='+msg[i].post_no+'">'
					+msg[i].post_name+'</a></td>'
					+'<td id="td3">'+msg[i].post_nickname+'</td>'
					+'<td id="td4">'+msg[i].post_date+'</td>'
					+'<td id="td5">'+msg[i].postrecom_count+'</td>'
					+'<td id="td6">'+msg[i].post_hits+'</td>'
					+'</tr>'
			);
		}
	});
	
	postlist.fail(function( jqXHR, textStatus ) {
		alert('ajax 연결실패');
	});
	
	// 현재에 맞는 페이지 리스트 가져와서 뿌려주기 ajax
	var pagelist = $.ajax({
		type: "post"
		,dataType : "json"
		,url : "<%= request.getContextPath() %>/getpagelist.jj?boardno=${param.boardno}&page_num=${param.page_num}"
		
	});
	
	pagelist.done(function( msg ) {
		console.log(msg);
		for(var i=0; i < msg.length; i++){
			$('#pagelist').append(
				'<a href="<%= request.getContextPath() %>'
				+'\/gallery/gallery_board.jsp?boardno='+${param.boardno}+'&page_num='+msg[i]+'">'
				+msg[i]+'</a>'
			);
		}
	});
	
	pagelist.fail(function( jqXHR, textStatus ) {
		alert('ajax 연결실패');
	});
	
	
	// 게시글 조회수를 올리기 위한 ajax
	var posthit = $.ajax({
		type : "post"
		,dataType : "json"
		,url : "<%= request.getContextPath() %>/posthit.jj?postno=${param.postno}"
	});
	
	posthit.done(function(){
		
	});
	
	posthit.fail(function(){
		
	});
	
	
});

</script>
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
<!-- 로그인상태를 판별하여 로그인 로그아웃버튼 표시  -->		
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
<!-- 게시글 뷰 시작 -->
<div class="post_view_box">
	<div class="post_view_inner">
		<!-- 게시글 정보 영역 -->
		<div class="post_view_top">
			<div class="post_view_top_left">
				<dl>
					<dt>제 목</dt>
					<dd><b>${post.post_name}</b></dd>
				</dl>
				<dl>
					<dt>글쓴이</dt>
					<dd>
						<span>
							${post.post_nickname}
						</span>
						<span>
							이미지들어갈곳
						</span>
					</dd>
					<dt class="dtline">조회</dt>
					<dd class="ddnum">${post.post_hits}</dd>
					<dt class="dtline">댓글</dt>
					<dd class="ddnum">${post.postreple_count}</dd>
				</dl>
			</div>
			<div class="post_view_top_right">
				<ul>
					<li>
						<b>${post.post_date}</b>
					</li>
				</ul>
			</div>
		</div>
		<!-- 게시글 내용 영역 -->
		<div class="post_view_con">
			${post.post_content}
		</div>
		<!-- 광고, 추천 버튼 영역 -->
		<div class="post_view_advandrecom">
			광고 및 추천버튼 들어갈 곳
		</div>
		<!-- 리플 다는 영역 -->
		<div class="post_view_replybox">
			리플다는 영역
		</div>
	</div>
</div>
<!-- 메인시작 --> 
<div class="Content_main">
<!-- 왼쪽메인시작 -->
	<div class="board_left">
		<div class="board_left_list">
			<table>
				<thead class="board_left_list_top">
					<tr>
						<th id="th1"><img src="<%= request.getContextPath() %>/imgs/board/title_no.gif"></th>
						<th id="th2"><img src="<%= request.getContextPath() %>/imgs/board/title_subject.gif"></th>
						<th id="th3"><img src="<%= request.getContextPath() %>/imgs/board/title_writer.gif"></th>
						<th id="th4"><img src="<%= request.getContextPath() %>/imgs/board/title_date.gif"></th>
						<th id="th5"><img src="<%= request.getContextPath() %>/imgs/board/title_hit.gif"></th>
						<th id="th6"><img src="<%= request.getContextPath() %>/imgs/board/title_recommend.gif"></th>
					</tr>
				</thead>
	<!-- 게시글 리스트 jquery ajax로 채워줌 -->
				<tbody class="board_left_list_con" id="postlist">
					
				</tbody>
			</table>
			<div class="board_left_botbar">
<!-- 게시판마다 보드넘버를 가져와서 글쓰기버튼을 클릭할때에 같이 보드넘버를 넘겨준다 -->
				<div class="btnbar">
					<a href="<%=request.getContextPath() %>/gallery/write_form.jsp?boardno=${param.boardno}"><img src="<%= request.getContextPath() %>/imgs/board/btn_write.gif"></a>
				</div>
				<!-- 페이징기법 넣을곳 -->
				<div class="pagenum">
				<!-- 이전버튼 추가 할것 -->
					<c:if test="${param.page_num>10}"><a href="<%=request.getContextPath() %>/gallery/gallery_board.jsp?boardno=${param.boardno}&page_num=${param.page_num-10}">이전</a></c:if>
					<span id="pagelist">
					
					</span>
					<a href="<%=request.getContextPath() %>/gallery/gallery_board.jsp?boardno=${param.boardno}&page_num=${param.page_num+10}">다음</a>
				</div>
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
