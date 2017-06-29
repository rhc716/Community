<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<%@ page import = "myproject.community.dao.Udao" %>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="u" class="myproject.community.dto.User"/>
<jsp:setProperty name="u" property="*"/>
<%
Udao dao = new Udao();
dao.uInsert(u);
String insert_type = request.getParameter("insert_type");
response.sendRedirect(request.getContextPath() + "/user/user_insert_confirm_email.jsp?insert_type="+insert_type);
%>
</body>
</html>