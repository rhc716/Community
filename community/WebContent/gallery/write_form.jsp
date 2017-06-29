<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<%= request.getContextPath() %>/css/default.css" rel="stylesheet" type="text/css" media="all" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
<script>
	/* 게시글 유효성 검사를 한 후 submit 해준다. */
	$(document).ready(function(){
		$('#btnwrite').click(function(){
			$('#writeform').submit();
		});
	});
</script>
</head>
<body>
<div class="gallery_top">
	<!-- 탑 로고와 검색 -->
	<h1 class="gallery_logoandsearch">
		<div class="gallery_h1">
			<a href="<%= request.getContextPath() %>/index.jsp"><img src="">홈으로 가는 이미지 버튼 추가</a>
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
				<li><span class="">m.게시판</span></li>
				<li><span class="">블로그</span></li>
				<li><span class="">미정</span></li>
				<li><span class="">미정</span></li>
				<li><span class="">미정</span></li>
				<li><span class="">미정</span></li>
			</ul>
		</div>
	</div>
	</div>
<!-- 탑끝 -->
	<div class="write_main">
<!-- 글쓰는 페이지 제목 -->	
		<div class="write_main_sub">
		
		</div>
<!-- 글쓰는 페이지 내용 -->		
		<div class="write_main_con">
<!-- 닉네임,비밀번호,제목 영역// 폼에는 항상 boardno를 보내준다 -->
			<form id="writeform" action="./write_pro.jsp?postboard_no=${param.boardno}" method="post">
				<div class="write_s1">
					<ul class="write_s1_ul">
						<li>

<!--로그인한 상태일 경우 닉네임을 채워주고 아이디도 hidden 값으로 보내준다-->
						<c:if test="${S_NAME!=null}">				
							<span>닉네임</span>
							<input type="text" name="post_nickname" value="${S_NAME}" readonly>
							<input type="hidden" name="post_user_id" value="${S_ID}">
						</c:if>
						<c:if test="${S_NAME==null}">
							<span>닉네임</span>
							<input name="post_nickname" type="text" maxlength="15">
						</c:if>
						</li>
						<li>
							<span>비밀번호</span>
							<input name="post_password" type="password" maxlength="15">
						</li>
						<li>
							<span>제목</span>
							<input name="post_name" type="text" maxlength="30">
						</li>
					</ul>
					<div class="s_txt">
					<b>
						※&nbsp;1111, 1234 같은 쉬운 비밀번호를 입력하면 타인이 수정 또는 삭제를 하기 쉽습니다. 가능한 어려운 비밀번호를 입력하세요.
					</b>
					<b><br>
						※ 저작권에 위배되는 게시물 작성시 운영 원칙 및 관련 법령에 따라 처벌 될 수 있습니다.  [저작권법 내용 보기] [게시물 활용 안내]
					</b>
					</div>
					<div class="write_middle_ad">
						광고영역  W01 1000px * 150px
					</div>
					<div class="write_con">
						<div class="con_side_bar1">
							<div class="bar1_bound">
								<ul class="bar1_bound_left">
									<li>
										<a>사진</a>
									</li>
									<li>
										<a>파일</a>
									</li>
								</ul>
								<ul class="bar1_bound_right">
									<li>
										<a>HTML</a>
									</li>
								</ul>
							</div>
						</div>
						<div class="con_side_bar2">
							<div>
							</div>
						</div>
						<div class="con_txtbox">
							<textarea name="post_content" class="txtarea">
							</textarea>
						</div>
						<div class="txt_resizebar">
							<div class="txt_resizebar_on">
								<img src="../imgs/board/btn_drag01.gif" class="txt_resizebar_on" unselectable="on">
							</div>
						</div>
					</div>
				</div>
				<div class="txt_btn_box">
					<p>
						<a href="javascript:history.back(-1)"><img src="../imgs/board/btn_cancle.gif"></a>
						<button id="btnwrite"><img src="../imgs/board/btn_save.gif"></button>
					</p>
				</div>
			</form>
			
		</div>
	</div>	
</body>
</html>