<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//lay ve bien a, bien ds tu servlet gui ve
long a = (long)request.getAttribute("a");
String[] t = (String[])request.getAttribute("ds");
out.print("a="+a+"<br>");
for(String ten:t){
	out.print(ten+":");
}
%>
</body>
</html>