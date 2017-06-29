<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<%= request.getContextPath() %>/css/default.css" rel="stylesheet" type="text/css" media="all" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="page_login_box">
		<h1><a href="<%= request.getContextPath() %>/index.jsp"><img src=""></a></h1>
		<div class="page_login_wrap">
			<div class="page_login_f1">
				<div class="div_logset">
					<div class="div_logset1">
						<img src="">
					</div>
					<div>
						<%@ include file ="../module/login.jsp" %>
					</div>
				</div>
			</div>
			<div class="page_login_adv">
				광고영역 L01 330px * 309px
			</div>
		</div>
		<div class="page_login_btn">
			<a href="../index.jsp"><img src=""></a>
		</div>
	</div>
</body>
</html>