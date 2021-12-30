<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
    <head>
        <title>View Image</title>
    </head>
    
    <body>
    
        <b><a href="index1.jsp">Upload</a></b><br/><br/>
        <b><a href="PhotoServlet">View All Products</a></b><br/><br/>
        
        <form action="viewImage.jsp" method="post">
            <input type="text" name="Id" required="required" placeholder="enter product Id.."/><br/><br/>
            <input type="submit"/>
        </form>
    </body>
</html>