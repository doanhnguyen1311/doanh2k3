<%@page import="bean.sachbean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.loaibean"%>
<%@page import="bo.sachbo"%>
<%@page import="bo.loaibo"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Đăng ký</title>
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
      <li><a href="sachController">Giỏ hàng</a></li>
      <li><a href="thanhtoan.jsp">Thanh toán</a></li>
      <li><a href="giohang.jsp">Lịch sử mua hàng</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Đăng ký</a></li>
      <%if(session.getAttribute("dn")!=null){ %>
       <li><a href="#"> 
          Xin chào: <%=session.getAttribute("dn") %>
       </a></li>
        <li><a href="dangxuat.jsp">
         <span class="glyphicon glyphicon-log-out"></span> Đăng xuất</a></li>
     <%}else{ %> 
      <li><a href="dangnhapController"><span class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
     <%} %>
    </ul>
  </div>
</nav>
<form action="dangkiController" method = "post">
	Tên đăng nhập <input type = "text" name = "user-dk"> <br>
	Mật khẩu <input type = "password" name = "pass-dk"> <br>
	Nhập lại mật khẩu <input type = "password" name = "pass-nl"> <br>
	<div style = "display:flex;">
	Nhập họ và tên: 
	<input type = "text" name = "ho" placeholder = "Họ và họ đệm">
	<input type = "text" name = "ten" placeholder = "Tên">
	</div> 
	<input type = "submit" name = "th" value = "Đăng ký">
</form>
</body>
</html>