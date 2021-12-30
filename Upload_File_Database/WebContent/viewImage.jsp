<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
    <head>
        <title>View Product</title>
    </head>
    
    <body>
    
        <b>View | <a href="index.jsp">Upload</a></b><br/><br/>
        
<%
String Id = request.getParameter("Id");
%>
<img src="getImage.jsp?Id=<%=Id%>" width="400px"/>
 
    </body>
</html>