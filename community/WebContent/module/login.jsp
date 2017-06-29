<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%= request.getContextPath() %>/css/default.css" rel="stylesheet" type="text/css" media="all" />
<title>Insert title here</title>
<%
	String S_NAME = (String)session.getAttribute("S_NAME");
	String S_LEVEL = (String)session.getAttribute("S_LEVEL");
	String S_LEVELUP = (String)session.getAttribute("S_LEVELUP");
	String SID = (String)session.getAttribute("S_ID");
/* 	System.out.println(S_NAME + "<-- S_NAME");
	System.out.println(S_LEVEL + "<-- S_LEVEL"); */
%>
</head>
<body>
	<div class="login_main">	
<%
if(S_LEVEL == null){	
%>         

			<form action="<%= request.getContextPath() %>/login/login_pro.jsp" class="login_up login_form" method="post">
				<div class="login_insert">
					<input type="text" class="login_id" name="id">
					<input type="password" class="login_pw" name="pw">
				</div>
				<div class="login_btnsec">
				<div class="login_save">
					아이디 저장
				</div>
					<input type="submit" class="login_bt" value="로그인">
				</div>
			</form>
			<div class="login_down">
				<div class="login_down_one"><input type="checkbox">보안접속 |</div>
				<div class="login_down_two"><a href="<%= request.getContextPath() %>/user/user_insert_choice.jsp"><span>회원가입 |</span></a></div>
				<div class="login_down_three">아이디 비번 찾기</div>
			</div>
<%
}else{
	if(S_LEVEL.equals("일반회원")){
%>     
		<div id="lf_a">
			<%= S_NAME %>님 반갑습니다 <a href="<%= request.getContextPath() %>/login/logout.jsp" id="log_out_btn">로그아웃</a>
		</div>
		<dl id="lf_b">
			<dt>작성글: </dt><dd>dddd</dd>
			<dt>댓글: </dt><dd>dddd</dd>
			<dt>방명록: </dt><dd>dddd</dd>
		</dl>
		<dl id="lf_c">
			<dt>권한 :</dt><dd><%= S_LEVEL %></dd> 
			<dt>lv :</dt><dd><%= S_LEVEL %></dd>
		</dl>
		<div id="lf_d">
			<a href="" id="a_logbox"></a>
			<input type="button" onclick="location.href='<%= request.getContextPath() %>/index.jsp'" id="btn_userinfo" value="회원정보">
		</div>
<%
	}else if(S_LEVEL.equals("기업회원")){
%>
		<div id="lf_a">
			<%= S_NAME %>님 반갑습니다 <a href="<%= request.getContextPath() %>/login/logout.jsp" id="log_out_btn">로그아웃</a>
		</div>
		<dl id="lf_b">
			<dt>작성글: </dt><dd>dddd</dd>
			<dt>댓글: </dt><dd>dddd</dd>
			<dt>방명록: </dt><dd>dddd</dd>
		</dl>
		<dl id="lf_c">
			<dt>권한 :</dt><dd><%= S_LEVEL %></dd> 
			<dt>lv :</dt><dd><%= S_LEVEL %></dd>
		</dl>
		<div id="lf_d">
			<a href="" id="a_logbox"></a>
			<input type="button" onclick="location.href='<%= request.getContextPath() %>/index.jsp'" id="btn_userinfo" value="회원정보">
		</div>
<%
	}else if(S_LEVEL.equals("관리자")){
%>     
		<div id="lf_a">
			<%= S_NAME %>님 반갑습니다 <a href="<%= request.getContextPath() %>/login/logout.jsp" id="log_out_btn">로그아웃</a>
		</div>
		<dl id="lf_b">
			<dt>작성글: </dt><dd>d</dd>
			<dt>댓글: </dt><dd>d</dd>
			<dt>방명록: </dt><dd>d</dd>
		</dl>
		<dl id="lf_c">
			<dt>권한 :</dt><dd><%= S_LEVEL %></dd> 
			<dt>lv :</dt><dd><%= S_LEVEL %></dd>
		</dl>
		<div id="lf_d">
			<a href="" id="a_logbox"></a>
			<input type="button" onclick="location.href='<%= request.getContextPath() %>/index.jsp'" id="btn_userinfo" value="회원정보">
		</div>
<%
	}else {
%>
		<div id="lf_a">
			<%= S_NAME %>님 반갑습니다 <a href="<%= request.getContextPath() %>/login/logout.jsp" id="log_out_btn">로그아웃</a>
		</div>
		<dl id="lf_b">
			<dt>작성글: </dt><dd>d</dd>
			<dt>댓글: </dt><dd>d</dd>
			<dt>방명록: </dt><dd>d</dd>
		</dl>
		<dl id="lf_c">
			<dt>권한 :</dt><dd><%= S_LEVEL %></dd> 
			<dt>lv :</dt><dd><%= S_LEVEL %></dd>
		</dl>
		<div id="lf_d">
			<a href="" id="a_logbox"></a>
			<input type="button" onclick="location.href='<%= request.getContextPath() %>/index.jsp'" id="btn_userinfo" value="회원정보">
		</div>
<%
	}
} 
%>
	</div>
</body>
</html>