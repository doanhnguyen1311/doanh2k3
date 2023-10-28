<%@page import="dao.KetNoi"%>
<%@page import="bean.giohangbean"%>
<%@page import="bo.giohangbo"%>
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
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<script type="htgio.js"></script>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
   
    <ul class="nav navbar-nav">
      <li class="active"><a href="sachController">Trang chủ</a></li>
      
      <li><a href="htGioController">Giỏ hàng</a></li>
      <li><a href="thanhtoan.jsp">Thanh toán</a></li>
      <li><a href="giohang.jsp">Lịch sử mua hàng</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Đăng ký</a></li>
      <%if(session.getAttribute("dangnhap")!=null){ %>
       <li><a href=""> 
          Xin chào: <%=session.getAttribute("ten") %>
       </a></li>
        <li><a href="dangxuat.jsp">
         <span class="glyphicon glyphicon-log-out"></span> Đăng xuất</a></li>
     <%}else{ %> 
      <li><a href="dangnhap.jsp"><span class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
     <%} %>
    </ul>
  </div>
</nav>
<form action="sachController" method = "post">
<table class="table">
   <tr>
   		<td width="200" valign="top">
   		    <table class="table table-hover">
   		      <%
ArrayList<loaibean> loai = (ArrayList<loaibean>)session.getAttribute("dsloai");
if(loai!=null){
   		      for(loaibean l: loai){ %>
   		         <tr>
   		         	<td>
   		         	<a href="sachController?ml=<%=l.getMaloai()%>">
   		         		<%=l.getTenloai() %> 
   		         	</a>	
   		         	</td>
   		         </tr>
   		         <%}} %>
   		    </table>
   		</td>
   		<td td width="600" valign="top">
</form>
 <form action="giohangController" method="post">
   		  <table class="table table-hover"> 
<%
ArrayList<giohangbean> ds = (ArrayList<giohangbean>)session.getAttribute("ghds");
if (ds != null) {
    for (giohangbean h:ds) {%>
<tr>
<td>
<input type="checkbox" name="c1" value="<%=h.getMasach()%>">
</td>
	<td><%=h.getMasach()%></td>
	<td><%=h.getTensach()%> </td>
	<td><span id = "gia"><%=h.getGia()%></span></td>
	<td id = ""><%=h.getSoluongmua()%></td>
	<td>
<input type="number" name="<%=h.getMasach()%>" style="width:50px;" >
<button type='submit' name='but1' value='<%=h.getMasach()%>' onclick = "them()"> + </button>
 </td>
<td><a href="xoahang?ms=<%=h.getMasach() %>"> Xóa </a></td>
</tr>
<% }}
if(ds==null){
%>
<p>Không có mặt hàng nào trong giỏ</p>
<%}%>
<tr><td>
  <input name="xoachon" type="submit" value="Xoa chon">
</td>
</tr>
</table>
</form>
<%Long tong = (Long)session.getAttribute("tong");
if(tong!=null){
%>
<p>Tổng tiền: <%=(float)tong/1000%><span><sup>đ</sup></span></p>
<%} %>
   		</td>
   		<td>
 <form action="sachController" method="post">
	<input type="text" name="txttk"><br>
	<input type='submit' name='th' value='Search' class="btn-primary">
</form>
   		</td>
   	</tr>
</table>
</body>
</html>