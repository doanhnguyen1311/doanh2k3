<%@page import="bean.giohangbean"%>
<%@page import="bo.giohangbo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
 <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 
</head>
<body>

<%
	String ms= request.getParameter("ms");
	String ts= request.getParameter("ts");
	String giatam= request.getParameter("gia");
	giohangbo gh=null;
	if(session.getAttribute("gh")==null){
		gh= new giohangbo();
		session.setAttribute("gh", gh);
	}
	gh=(giohangbo)session.getAttribute("gh");
	gh.Them(ms, ts, (long)1, Long.parseLong(giatam));
	session.setAttribute("gh", gh);
	response.sendRedirect("htgio.jsp");
%>


</body>
</html>