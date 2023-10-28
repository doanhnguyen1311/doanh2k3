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
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
   
    <ul class="nav navbar-nav">
      <li class="active"><a href="sachController">Trang chủ</a></li>
      <li><a href="htGioController">Giỏ hàng</a></li>
      <li><a href="thanhtoan.jsp">Thanh toán</a></li>
      <li><a href="giohangController">Lịch sử mua hàng</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Đăng ký</a></li>
      <%if(session.getAttribute("dangnhap")!=null){ %>
       <li><a href="#"> 
          Xin chào: <%=session.getAttribute("ten")%>
       </a></li>
        <li><a href="dangxuatController">
         <span class="glyphicon glyphicon-log-out"></span> Đăng xuất</a></li>
     <%}else{ %> 
      <li><a href="dangnhapController"><span class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
     <%} %>
    </ul>
  </div>
</nav>

<table class="table">
   <tr>
   		<td width="200" valign="top">
   		    <table class="table table-hover">
   		      <%
   		      ArrayList<loaibean> dsloai =(ArrayList<loaibean>)session.getAttribute("loai");
   		      for(loaibean l: dsloai){ %>
   		         <tr>
   		         	<td>
   		         	<a href="phantrangController?ml=<%=l.getMaloai()%>"><%=l.getTenloai()%></a>	
   		         	</td>
   		         </tr>
   		         <%} %>
   		    </table>
   		</td>
   		<td td width="600" valign="top">
   		   <table class="table"> 
	   		   <%
	   		 ArrayList<sachbean> ds =(ArrayList<sachbean>)session.getAttribute("dspage");
	   		    int n=ds.size();
	   		    for(int i=0;i<n;i++){
	   		    	sachbean s= ds.get(i);%>
	   		  		<tr>
	   		  		   <td>
	   		  		     <img src="<%=s.getAnh() %>"> <br>
	   		  		       <%=s.getTensach() %><br><%=s.getGia()%> <br>
<a href="giohangController?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>">		  		   
	   		  		     <img src="buynow.jpg">
	   		  		     </a>
	   		  		      <br>
	   		  		   </td>
	   		  		   <%i++;if(i<n){s= ds.get(i);%>
	   		  		   <td>
	   		  		     <img src="<%=s.getAnh()%>"> <br>
	   		  		       <%=s.getTensach() %> <br>
	   		  		        <%=s.getGia() %> <br>
<a href="giohangController?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>">
	   		  		     <img src="buynow.jpg">
	   		  		     </a> 
	   		  		   </td>
	   		  		   <%} %>
	   		  		</tr>
	   		  <%} %>
   		   </table>
   		</td>
   		<td>

 <form action="phantrangController" method="post">
	<input type="text" name="txttk"><br>
	<input type='submit' name='th' value='Search' class="btn-primary">
</form>
   		</td>
   	</tr>
</table>
<div class="container">
  <ul class="pagination">
  <%
  for(int i=1;i<=17;i++){ %>
    <li>
        <a href="phantrangController?index=<%=i%>"><span><%=i %></span></a>
    </li>
    <%
    }
    %>
  </ul>
</div>


</body>
</html>