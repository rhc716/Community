<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String pw1 = request.getParameter("pw1");
String pw2 = request.getParameter("pw2");
/* System.out.println(pw1+"<--pw1");
System.out.println(pw2+"<--pw2"); */
if(!pw1.equals("")){
	if(pw1.equals(pw2)){
%>
	<div style="color:green" class="usepw">
	 	비밀번호가 같습니다
	<input type="hidden" value="1" id="use_pw2" name="use_pw2"/>
<%
	} else {
%>
	<div style="color:red" class="use">
    	비밀번호가 다릅니다
    <input type="hidden" value="0" id="use_pw2" name="use_pw2"/>
    </div>
<%
	}
}else{
%>
	<div style="color:red" class="use">
	비밀번호를 양식에 맞게 입력해주세요
	<input type="hidden" value="0" id="use_pw2" name="use_pw2"/>
	</div>
<%
}
%>
</body>
</html>