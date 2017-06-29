<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ page import = "myproject.community.dao.Pdao" %>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String boardno = request.getParameter("postboard_no");
System.out.println(boardno+"<--write pro 에서 받아준 boardno");
%>

<jsp:useBean id="p" class="myproject.community.dto.Post"/>
<jsp:setProperty name="p" property="*"/>
<%
Pdao dao = new Pdao();
dao.insertPost(p);
//원래 있었던 게시판으로 돌아감
response.sendRedirect(request.getContextPath() + "/gallery/gallery_board.jsp?boardno="+p.getPostboard_no()+"&page_num=1");
%>

</body>
</html>