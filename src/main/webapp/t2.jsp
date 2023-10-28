<%@page import="java.util.Random"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
Noi dung cua session:
<%=session.getAttribute("ss") %>
<%Calendar c=Calendar.getInstance();//Lay ngay gio 
int ngay= c.get(Calendar.DAY_OF_MONTH);
int thang= c.get(Calendar.MONTH)+1;
int nam= c.get(Calendar.YEAR);
%>
<div align="right"> <b>
Hôm nay ngày <%=ngay %> tháng <%=thang %> năm <%=nam %>
</b> <hr>
</div>
<form method="post" action="t2.jsp">
Chọn ngày
<select name="sn">
 <%for(int i=1;i<=31;i++){ %>
  <option <%=((i==ngay)?"selected":"")%>> <%=i %> </option>
  <%} %>
</select>
tháng
<select name="st">
<%for(int i=1;i<=12;i++){ %>
  <option <%=((i==thang)?"selected":"")%>> <%=i %> </option>
  <%} %>
   
</select>
năm
<select name="snam">
  <%for(int i=nam-10;i<=nam;i++){ %>
  <option <%=((i==nam)?"selected":"")%>> <%=i %> </option>
  <%} %>
</select>
<input type="submit" value="Xem ket qua" name="but1">
</form>
<%//Lay ve ngay, thang nam vua cho
String ngay1=request.getParameter("sn");
String thang1=request.getParameter("st");
String nam1=request.getParameter("snam");
if (ngay1!=null&& thang1!=null && nam1!=null){
%>
Kết quả xổ số ngày <%=ngay1 %> tháng <%=thang1 %> năm <%=nam1 %> 
<%
  Random r= new Random();
  out.print("<hr><b>" + r.nextInt(100)+"</b>");
}%>
</body>
</html>