<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
   Nội dung  <%=request.getParameter("trang") %>
   <hr>
   <%for(int i=1;i<=20;i++){ %>
      <a href="t3.jsp?trang=<%=i%>"> <%=i %></a>
      <%} %>

</body>
</html>