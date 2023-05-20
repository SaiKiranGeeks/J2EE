package com.healthcare.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		String title = "login.java ?";
		
		String uname = request.getParameter("username");
		String upwd = request.getParameter("password");
		
		String question1 = request.getParameter("mylist");
		String question2 = request.getParameter("mylist_2");
		String question3 = request.getParameter("mylist_3");

		String q1 = request.getParameter("q1"); // answers
		String q2 = request.getParameter("q2");
		String q3 = request.getParameter("q3");

//		String customQuestion = request.getParameter("customQuestion");
//		String customAnswer = request.getParameter("customAnswer");
//		
		String selectedImage = request.getParameter("selected-image");
		System.out.println("selected-Image:" + selectedImage);

		System.out.println("question1:" + question1);
		System.out.println("q1 answer:" + q1);
		
		
		
		
		
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		
		if(uname == null || uname.equals("")) {
			request.setAttribute("status", "invalidEmail");
			dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
		if(upwd == null || upwd.equals("")) {
			request.setAttribute("status", "invalidUpwd");
			dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
		if (q1 == null || q1.equals("") || q2 == null || q2.equals("") || q3 == null || q3.equals("")) {
			request.setAttribute("status", "invalidsecurityquestions");
			dispatcher = request.getRequestDispatcher("register.jsp");
			dispatcher.forward(request, response);

		} 
		if (selectedImage == null || selectedImage.equals("")) {
			request.setAttribute("status", "invalidimage");
			dispatcher = request.getRequestDispatcher("register.jsp");
			dispatcher.forward(request, response);
		}
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		//	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vineeth?useSSL=false","root","Vineeth@0502");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false&serverTimezone=UTC&useLegacyDatetimeCode=false","root","Saikiran@1");
				
			PreparedStatement pst = con.prepareStatement("select * from userslist where username = ? and password = ? and question1 =? and question2 =? and question3 =? and answer1 =? and answer2 =? and answer3 =? and image = ?");
			// and customQuestion =? and customAnswer =? 
			
			pst.setString(1,  uname);
			pst.setString(2,  upwd);
			

			pst.setString(3, question1);
			pst.setString(4, question2);
			pst.setString(5, question3);
			
			pst.setString(6, q1);
			pst.setString(7, q2);
			pst.setString(8, q3);
			
//			pst.setString(9, customQuestion);
//			pst.setString(10, customAnswer);
			
			pst.setString(9, selectedImage);
			
			
			System.out.println("statement :" + pst);
			
			ResultSet rs = pst.executeQuery();
			
			//System.out.print(title+" username :"+username);
			
			if(rs.next()) {
				session.setAttribute("name", rs.getString("username"));
				session.setAttribute("status", "sucesslogin");
				dispatcher = request.getRequestDispatcher("index.jsp");
			} else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("login.jsp");
			}
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}

}
