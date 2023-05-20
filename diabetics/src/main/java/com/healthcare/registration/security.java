package com.healthcare.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/security")
public class security extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	   
	    
		String uemail = request.getParameter("email");
		String question1 = request.getParameter("mylist");
		String question2 = request.getParameter("mylist_2");
		String question3 = request.getParameter("mylist_3");
		
		String q1 = request.getParameter("q1"); // answers
		String q2 = request.getParameter("q2");
		String q3 = request.getParameter("q3");
		
		String customQuestion = request.getParameter("customQuestion");
		String customAnswer = request.getParameter("customAnswer");
		
		System.out.println("question1:"+question1);
		
		RequestDispatcher dispatcher = null;
		Connection con = null;
		if(uemail == null || uemail.equals("")) {
			request.setAttribute("status", "invalidEmail");
			dispatcher = request.getRequestDispatcher("processAnswers.jsp");
			dispatcher.forward(request, response);
		} else if(q1 == null || q1.equals("") || q2 == null || q2.equals("") || q3 == null || q3.equals("")) {
			request.setAttribute("status", "notEnoughQuestions");
			dispatcher = request.getRequestDispatcher("processAnswers.jsp");
			dispatcher.forward(request, response);
		} else {
			try {
				System.out.println(q1);
				Class.forName("com.mysql.cj.jdbc.Driver");
				//con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vineeth?useSSL=false","root","Vineeth@0502");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false&serverTimezone=UTC&useLegacyDatetimeCode=false","root","Saikiran@1");
				
				String sql = "INSERT INTO users_security_question(username,question,answer) VALUES (?, ?, ?)";
				
				//String sql = "INSERT INTO security_questions (q1, q2, q3, q4, q5, q6, custom_question, custom_answer,uemail) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
				
				PreparedStatement stmt = con.prepareStatement(sql);
				if (q1 != null) {
					  stmt.setString(1, uemail);
					  stmt.setString(2, question1);
					  stmt.setString(3, q1);
					  stmt.addBatch();
					}
				if (q2 != null) {
					  stmt.setString(1, uemail);
					  stmt.setString(2, question2);
					  stmt.setString(3, q2);
					  stmt.addBatch();
					}
				if (q3 != null) {
					       stmt.setString(1, uemail);
					       stmt.setString(2, question3);
					       stmt.setString(3, q3);
					       stmt.addBatch();
					}
				if(customQuestion != null && customAnswer!= null)
				{
					 stmt.setString(1, uemail);
				       stmt.setString(2, customQuestion);
				       stmt.setString(3, customAnswer);
				       stmt.addBatch();
				}
				/*if (q4 != null) {
					       stmt.setString(1, uemail);
					       stmt.setString(2, "What was your maths teachers surname in your 8th year of school");
					       stmt.setString(3, q4);
					       stmt.addBatch();
					}
				if (q5 != null) {
					       stmt.setString(1, uemail);
					       stmt.setString(2, "What was the name of your first stuffed toy");
					       stmt.setString(3, q5);
					       stmt.addBatch();
					}
				if (q6 != null) {
					       stmt.setString(1, uemail);
					       stmt.setString(2, "What was your driving instructors first name");
					       stmt.setString(3, q6);
					       stmt.addBatch();
					}*/

				int [] rowcount = stmt.executeBatch();
//				stmt.setString(1, uemail);
//				stmt.setString(2, q1);
//				stmt.setString(3, q3);
//				stmt.setString(4, q4);
//				stmt.setString(5, q5);
//				stmt.setString(6, q6);
//				stmt.setString(7, customQuestion);
//				stmt.setString(8, customAnswer);
//				stmt.setString(9, uemail);
//				
				// Execute the SQL statement
				//int rowcount = stmt.executeUpdate();
				dispatcher = request.getRequestDispatcher("processAnswers.jsp");
				if(rowcount.length >= 1) {
					request.setAttribute("status", "success");
				} else {
					request.setAttribute("status", "failed");
				}
				
				dispatcher.forward(request, response);	
				
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if(con != null) {
						con.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
