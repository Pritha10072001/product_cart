package app.java;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class FileUpload
 */
@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize=16177215)
public class FileUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	String dbUrl="jdbc:mysql://localhost:3306/kiit";
	String dbuser="root";
	String dbPass="pritha1071";
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Id=request.getParameter("Product_Id");
		String pname=request.getParameter("Product_name");
		String pprice=request.getParameter("Product_price");
		String about=request.getParameter("About_product");
		System.out.print(pname);
		InputStream inputstream=null;
		
		Part filePart=request.getPart("img");
		
		if(filePart!=null)
		{
			System.out.print(filePart.getName());
			System.out.print(filePart.getSize());
			inputstream=filePart.getInputStream();
			
		}
		
		Connection con = null;
		String message=null;
		
		try {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			con=DriverManager.getConnection(dbUrl,dbuser,dbPass);
			
			String s="insert into info3 (Id,pname,pprice,about,photo)values(?,?,?,?,?)";
			PreparedStatement st=con.prepareStatement(s);
			st.setString(1, Id);
			st.setString(2, pname);
			st.setString(3, pprice);
			st.setString(4, about);
			if(inputstream !=null)
			{
			st.setBlob(5, inputstream);
			}
			
			
			int i=st.executeUpdate();
			if(i>0)
			{
				
				message="File uploaded successfully in database";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			message = "ERROR: " + e.getMessage();
			e.printStackTrace();
		}
		finally
		{
			if(con!=null)
			{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		}
		
		
		
		
		
		
		
		
		
		
		
	}

}
