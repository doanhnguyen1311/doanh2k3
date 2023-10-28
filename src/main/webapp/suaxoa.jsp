<%@page import="bo.giohangbo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

//Lay gia tri cua cac checkbox vua chon
String[] gt= request.getParameterValues("c1");
	if(gt!=null){
		giohangbo gh = (giohangbo)session.getAttribute("gh");
	for(String c: gt){ //Hien thi cac ma sach vua chon
		gh.Xoa(c);
	}
//Lay ve gia tri cua but1 chinh la ma sach vua chon
//Lay ve so luong can sua
	session.setAttribute("gh", gh);
	response.sendRedirect("htgio.jsp");
	}
/* /*
 String m=request.getParameter("ms");
 String so=request.getParameter("txtsl");
 giohangbo gh=(giohangbo)session.getAttribute("gh");
 if(so==null)
	 gh.Xoa(m);
 else
	 gh.Them(m, "", Long.parseLong(so), (long)0);
 session.setAttribute("gh", gh);
 
 response.sendRedirect("htgio.jsp"); 
 */

%>
</body>
</html>