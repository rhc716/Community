<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "myproject.community.dao.Udao" %>
<%@ page import = "myproject.community.dto.User" %>

<%= request.getRequestURI() %>
<%

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
/* 	System.out.println(id + "<-- id");
	System.out.println(pw + "<-- pw"); */
	
Udao dao = new Udao();
String result = dao.uLoginCheck(id, pw);
if(result.equals("성공")){
	User u = dao.uGetForSession(id);
	session.setAttribute("S_NAME", u.getUser_nickname());
	session.setAttribute("S_LEVEL", u.getUser_level());
	session.setAttribute("S_LEVELUP", u.getUser_levelup());
	session.setAttribute("S_ID", id);
	/* System.out.println("로그인성공"); */
%>
	<script language="javascript">
		alert("로그인성공");
		location.href = "<%= request.getContextPath() %>/index.jsp";
	</script>
<%			
	}else if(result.equals("비번불")){
%>
	<script language="javascript">
		alert("비번불일치");
		location.href = "<%= request.getContextPath() %>/index.jsp";
	</script>
<%			
	}else{
%>
	<script language="javascript">
		alert("아이디불일치");
		location.href = "<%= request.getContextPath() %>/index.jsp";
	</script>
<%		
	}
	response.sendRedirect(request.getContextPath() + "/index.jsp");
%>	
