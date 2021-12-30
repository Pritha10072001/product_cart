<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>

<h1>File upload to database</h1>
<form action="uploadServlet"  method="post" enctype="multipart/form-data">

<table>
<tr>
<td>Item photo</td>
<td><input type="file" name="img" size="50"/>
</tr>

<tr>
<td>Product Id</td>
<td><input type="text" name="Product_Id" size="50"/>
</tr>

<tr>
<td>Product Name</td>
<td><input type="text" name="Product_name" size="50"/>
</tr>

<tr>
<td>Product Price</td>
<td><input type="text" name="Product_price" size="50"/>
</tr>

<tr>
<td>About product</td>
<td><input type="text" name="About_product" size="100"/>
</tr>

<tr>
<td colspan="6">
<input type="submit"  value="save">
</td>

</tr>
</table>
</form>

</center>



</body>
</html>