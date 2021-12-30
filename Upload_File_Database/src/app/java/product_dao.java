package app.java;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;



public class product_dao {

	    String databaseURL = "jdbc:mysql://localhost:3306/kiit";
	    String user = "root";
	    String password = "pritha1071";
	     
	    public List<product> get() throws SQLException, IOException {
	    	List<product> list=new ArrayList<product>();
	        product p1 = null; 
	        String sql = "SELECT * FROM info3";
	        DriverManager.registerDriver(new com.mysql.jdbc.Driver());
	        try (
	        	Connection connection = DriverManager.getConnection(databaseURL, user, password)) {
	            PreparedStatement statement = connection.prepareStatement(sql);
	            
	            ResultSet result = statement.executeQuery();
	             
	            while (result.next()) {
	                 p1= new product();
	                String pname = result.getString("pname");
	                String pprice = result.getString("pprice");
	                String about= result.getString("about");
	                Blob blob = result.getBlob("photo");
	                 
	                InputStream inputStream = blob.getBinaryStream();
	                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
	                byte[] buffer = new byte[4096];
	                int bytesRead = -1;
	                 
	                while ((bytesRead = inputStream.read(buffer)) != -1) {
	                    outputStream.write(buffer, 0, bytesRead);                  
	                }
	                 
	                byte[] imageBytes = outputStream.toByteArray();
	                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
	                 
	                 
	                inputStream.close();
	                outputStream.close();
	                 
	                p1.setProduct_name(pname);
	                p1.setProduct_price(pprice);
	                p1.setProduct_about(about);
	                p1.setBase64Image(base64Image);
	                list.add(p1);
	            }          
	             
	        } catch (SQLException | IOException ex) {
	            ex.printStackTrace();
	            throw ex;
	        }      
	         
	       
			return list;
	    }
	
	
	
	
}
