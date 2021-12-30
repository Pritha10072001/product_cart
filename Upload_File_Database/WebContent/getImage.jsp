<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String Id = request.getParameter("Id");
 
String connectionURL = "jdbc:mysql://localhost:3306/kiit";
String user = "root";
String pass = "pritha1071";
 
Connection con = null;
 
try{
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection(connectionURL, user, pass);
    
    PreparedStatement ps = con.prepareStatement("select * from info3 where Id=?");
    ps.setString(1, Id);
    ResultSet rs = ps.executeQuery();
 
    if(rs.next()){
        Blob blob = rs.getBlob("photo");
        byte byteArray[] = blob.getBytes(1, (int)blob.length());
        response.setContentType("image/gif");
       
      
    }
}
catch(Exception e){
    e.printStackTrace();
}  
finally{
    if(con != null){
        try{
            con.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
}
%>