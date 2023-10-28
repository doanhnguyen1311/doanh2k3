<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<%
int a=0,b=0,kq=0;
if(request.getAttribute("a")!=null){
 a = (int)request.getAttribute("a");
 b = (int)request.getAttribute("b");
 kq = (int)request.getAttribute("kq");
}
%>
<form action="maytinhController" method="post">
a= <input type="number" name="txta" value="<%=a%>"><br>
b= <input type="number" name="txtb" value="<%=b%>"><br>
kq= <input type="number" name="txtkq" 
value="<%=kq%>"><br>
<input type="submit" name="butc" value=" + " class="btn-primary">
<input type="submit" name="butt" value=" - " class="btn-success">
<input type="submit" name="butn" value=" * " class="btn-info">
<input type="submit" name="butchia" value=" / " class="btn-danger">
</form>
</body>
</html>