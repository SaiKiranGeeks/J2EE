package com.healthcare.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/report")
public class report extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		RequestDispatcher dispatcher = null;
		List<DiabetesData> dataList = new ArrayList<>();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
		//	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vineeth?useSSL=false", "root","Vineeth@0502");
			
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false&serverTimezone=UTC&useLegacyDatetimeCode=false","root","Saikiran@1");
			
			pst = con.prepareStatement("select * from diabetes_data where username = ?");
			
			pst.setString(1,  request.getParameter("name"));
			
			rs = pst.executeQuery();
			
//			pst = con.prepareStatement("select * from diabetes_data(username) VALUES (?)");
//			pst.setString(1, request.getParameter("username"));
			
			System.out.println("Executing SQL query: " + pst.toString());
			
			

			while (rs.next()) {
				DiabetesData data = new DiabetesData();
				data.setDate(rs.getString("date"));
				data.setAmTestTime(rs.getString("am_test_time"));
				data.setFastingBloodSugarLevel(rs.getString("am_blood_sugar_level"));
				data.setBreakfastFood(rs.getString("breakfast_menu"));
				data.setLunchFood(rs.getString("lunch_menu"));
				data.setDinnerFood(rs.getString("dinner_menu"));
				data.setNightTestTime(rs.getString("pm_test_time"));
				data.setSugarLevelAfterTwoHours(rs.getString("pm_blood_sugar_level"));
				dataList.add(data);
			}
			
			System.out.println("Data retrieved successfully :"+dataList);
			
			request.setAttribute("dataList", dataList);
			
			dispatcher = request.getRequestDispatcher("report.jsp");
			dispatcher.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pst != null)
					pst.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
