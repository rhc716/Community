<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/default.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<head>
</head>
<body class="container">
	<div class="row pro_bar">
		<img src = "">
	</div>
<div class="row">
	<div class="col-xs-3"></div>
		<div class="col-xs-6 form_page">
			부모님 아이핀 인증
			<form action="<%= request.getContextPath() %>/user/user_insert_form.jsp?insert_type=child" method="post">
			<input type="submit" value="다음단계">
			</form>
		</div>
	<div class="col-xs-3"></div>
</div>
</body>
</html>