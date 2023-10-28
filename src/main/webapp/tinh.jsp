<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% String tama= request.getParameter("txta");
String tamb= request.getParameter("txtb");
String butc= request.getParameter("butc");
String butt= request.getParameter("butt");
String butn= request.getParameter("butn");
String butchia= request.getParameter("butchia");
int kq=0,a=0,b=0;
if(tama!=null&&tamb!=null){
	a= Integer.parseInt(tama);
	b= Integer.parseInt(tamb);
}
if(butc!=null){
	kq=a+b;
}else
if(butt!=null){
	kq=a-b;
}
response.sendRedirect("maytinh.jsp?kq="+kq+"&a="+a+"&b="+b);
%>

</body>
</html>