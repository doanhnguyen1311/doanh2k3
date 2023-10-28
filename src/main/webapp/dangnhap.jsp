<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
 <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
   
    <ul class="nav navbar-nav">
      <li class="active"><a href="Menu.jsp">Trang chủ</a></li>
      
      <li><a href="giohang.jsp">Giỏ hàng</a></li>
      <li><a href="thanhtoan.jsp">Thanh toán</a></li>
      <li><a href="giohang.jsp">Lịch sử mua hàng</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="dangkiController"><span class="glyphicon glyphicon-user"></span> Đăng ký</a></li>
      <%if(session.getAttribute("dn")!=null){ %>
       <li><a href="#"> 
          Xin chào: <%=session.getAttribute("dn") %>
       </a></li>
        <li><a href="dangxuat.jsp">
         <span class="glyphicon glyphicon-log-out"></span> Đăng xuất</a></li>
     <%}else{ %> 
      <li><a href="dangnhap.jsp"><span class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
     <%} %>
    </ul>
  </div>
</nav>
<%
String a = (String)request.getAttribute("kt");
%>

<form action="dangnhapController" method="post">
 Username=<input type="text" name="txtun"><br>
 Password=<input type="password" name="txtpass"> <br> 
 <%if(session.getAttribute("dn")==null){ 
 if(a==null){
	 %>
	 <p style = "color: red"></p>
	 <%
 }else{
 %>
 <p style = "color:red;"><%=a %></p>
 <%}} %>
 <input type='submit' name='th' value='Đăng nhập'>
</form>
</body>
</html>