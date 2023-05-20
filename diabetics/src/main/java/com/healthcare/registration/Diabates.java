package com.healthcare.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Diabates
 */
@WebServlet("/Diabetes")
public class Diabates extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	    String date = request.getParameter("date");
	    String am_test_time = request.getParameter("morningtime");
	    String am_blood_sugar_level = request.getParameter("morning");
	    String breakfast_menu = request.getParameter("breakfastfood");
	    String lunch_menu = request.getParameter("lunchfood");
	    String dinner_menu = request.getParameter("dinnerfood");
	    String pm_test_time = request.getParameter("nighttime");
	    String pm_blood_sugar_level = request.getParameter("night");
	    String username = request.getParameter("name");
	    RequestDispatcher dispatcher = null;
	    System.out.println("DIABETES username?"+username);
	    Connection con = null;

	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	      //  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vineeth?useSSL=false","root","Vineeth@0502");
	        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false&serverTimezone=UTC&useLegacyDatetimeCode=false","root","Saikiran@1");
			
	        PreparedStatement pst = con.prepareStatement("insert into diabetes_data(date,am_test_time,am_blood_sugar_level,breakfast_menu,lunch_menu,dinner_menu,pm_test_time,pm_blood_sugar_level,username) values(?,?,?,?,?,?,?,?,?) ");
	        pst.setString(1,  date);
	        pst.setString(2,  am_test_time);
	        if (am_blood_sugar_level != null && !am_blood_sugar_level.isEmpty()) {
	            try {
	                int am_blood_sugar_level_int = Integer.parseInt(am_blood_sugar_level);
	                pst.setInt(3, am_blood_sugar_level_int);
	            } catch (NumberFormatException e) {
	                pst.setNull(3, Types.INTEGER);
	            }
	        } else {
	            pst.setNull(3, Types.INTEGER);
	        }
	        pst.setString(4,  breakfast_menu);
	        pst.setString(5,  lunch_menu);
	        pst.setString(6,  dinner_menu);
	        pst.setString(7,  pm_test_time);
	        pst.setString(8,  pm_blood_sugar_level);
	        if (username != null )
	        pst.setString(9,  username);

	        int rowCount = pst.executeUpdate();

	        if(rowCount > 0) {
	            request.setAttribute("status", "success");
	        }else{
	            request.setAttribute("status", "failed");
	        }
	        dispatcher = request.getRequestDispatcher("index.jsp");
	        dispatcher.forward(request, response); 
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}

	

}
