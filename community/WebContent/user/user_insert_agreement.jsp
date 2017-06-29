<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/default.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<body class="container">
<%
String insert_type = request.getParameter("insert_type");

//회원 종류마다 약관이 다르기 때문에 약관을 다르게 불러줌
if(insert_type.equals("child")){
%>
<div class="row pro_bar">
	<img src = "">
</div>
<div class="row">
	<div class="col-xs-3"></div>
		<div class="col-xs-6 form_page">
			<div>
				어린이 회원 약관 내용 들어갈 곳<br>
				<a href = "user_insert_child_parent.jsp"><img src = "">동의합니다</a>
				<a href = "../index.jsp"><img src = "">돌아가기</a>
			</div>
		</div>
	<div class="col-xs-3"></div>
</div>
<%	
}else if(insert_type.equals("general")){
%>
<div class="row pro_bar">
	<img src = "">
</div>
<div class="row">
	<div class="col-xs-3"></div>
		<div class="col-xs-6 form_page">
			<div>
				일반 회원 약관 내용 들어갈 곳<br>
				<a href = "user_insert_form.jsp?insert_type=<%=insert_type%>">동의합니다<img src = ""></a>
				<a href = "../index.jsp"><img src = "">돌아가기</a>
			</div>
		</div>
	<div class="col-xs-3"></div>
</div>
<%	
}else{
%>
<div class="row pro_bar">
	<img src = "">
</div>
<div class="row">
	<div class="col-xs-3"></div>
		<div class="col-xs-6 form_page">
			<div>
				제휴 기업 회원 약관 내용 들어갈 곳<br>
				<a href = "user_insert_form.jsp?insert_type=<%=insert_type%>">동의합니다<img src = ""></a>
				<a href = "../index.jsp"><img src = "">돌아가기</a>
			</div>
		</div>
	<div class="col-xs-3"></div>
</div>
<%	
}
%>
</body>
</html>