<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ page import = "myproject.community.dao.*" %>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String in_nick = request.getParameter("nick");

Udao dao = new Udao();
String re = dao.nickDuplication(in_nick);

if(re.equals("사용가능")){
//히든값을 넘겨줘서 사용가능할때만 form을 submit처리 시키도록 함
%>
	<div style="color:green" class="use">
   	 	사용가능한 닉네임입니다
    <input type="hidden" value="1" id="use_nick" name="use_nick"/>
    </div>
<%
    }else{
%>
    <div style="color:red" class="use">
    	닉네임이 존재합니다
    <input type="hidden" value="0" id="use_nick" name="use_nick"/>
    </div>
<%
}
%>
</body>
</html>