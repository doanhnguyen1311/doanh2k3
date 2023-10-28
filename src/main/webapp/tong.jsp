<%@page import="tam.test"%>
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
if(session.getAttribute("ss")==null){//Chua tao bien session
  session.setAttribute("ss", (int)0);//Tao bien session
}
String tamn=request.getParameter("txtn");
if(tamn!=null){
	int n=Integer.parseInt(tamn);
	//lay session gan vao bien
	int s=(int)session.getAttribute("ss");
	//Thay doi dien
	s=s+n;
	//Gan bien vao session
	session.setAttribute("ss", s);
}
%><form action="tong.jsp" method="post">
 n=<input type="text" name="txtn">  
 <input type='submit' name='th' value='Tong'>
</form><%=session.getAttribute("ss") %>
<a href="t2.jsp"> Mo trang t1 </a>
</body>
</html>