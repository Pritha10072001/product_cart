<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.* ,java.util.*,java.sql.*" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>

<html>
<head>
<style>
.container
{
display:flex;
  background-color:#33FFE3;
  flex-direction: row;
  justify-content:space-between;
   flex-wrap: wrap;
padding:10px;
}
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 300px;
  margin: auto;
  text-align: center;
  font-family: arial;
  margin:20px;
  background-color:#FFCF33  ;
 
}

.price {
  color: grey;
  font-size: 22px;
 
}

.card button {
  border: none;
  outline: 0;
  padding: 12px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}

.card button:hover {
  opacity: 0.7;
}
</style>
</head>
<div class="container">
<c:forEach var="row" items="${product}">


<div class="card">
  <img src="data:image/jpg;base64,${row.getBase64Image()}" alt="Denim Jeans" style=" width:250px; hight:300px">
  <h1>${row. getProduct_name()}</h1>
  <p class="price">${row.getProduct_price()}</p>
  <p>${row.getProduct_about()}</p>
  <p><button>Add to Cart</button></p>
</div>

</c:forEach>
</div>
</body>
</html>