<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%//Lay ve ngay, thang nam vua cho
String ngay=request.getParameter("sn");
String thang=request.getParameter("st");
String nam=request.getParameter("snam");
%>
Kết quả xổ số ngày <%=ngay %> tháng <%=thang %> năm <%=nam %> 
<%
  Random r= new Random();
  out.print("<hr><b>" + r.nextInt(100)+"</b>");
%>
</body>
</html>