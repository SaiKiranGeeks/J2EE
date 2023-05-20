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

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String fullname = request.getParameter("fullname");
		String uname = request.getParameter("name");
		String uemail = request.getParameter("email");
		String upwd = request.getParameter("pass");
		String Reupwd = request.getParameter("re_pass");
		String umobile = request.getParameter("contact");
		String Birthday = request.getParameter("birthday");

		String question1 = request.getParameter("mylist");
		String question2 = request.getParameter("mylist_2");
		String question3 = request.getParameter("mylist_3");

		String q1 = request.getParameter("q1"); // answers
		String q2 = request.getParameter("q2");
		String q3 = request.getParameter("q3");

		String customQuestion = request.getParameter("customQuestion");
		String customAnswer = request.getParameter("customAnswer");
		
		String selectedImage = request.getParameter("selected-image");
		System.out.println("selected-Image:" + selectedImage);

		System.out.println("question1:" + question1);
		System.out.println("q1 answer:" + q1);
		
		RequestDispatcher dispatcher = null;
		Connection con = null;

		if (uname == null || uname.equals("")) {
			request.setAttribute("status", "invalidName");
			dispatcher = request.getRequestDispatcher("register.jsp");
			dispatcher.forward(request, response);
		}
		if (uemail == null || uemail.equals("")) {
			request.setAttribute("status", "invalidEmail");
			dispatcher = request.getRequestDispatcher("register.jsp");
			dispatcher.forward(request, response);
		}
		if (upwd == null || upwd.equals("")) {
			request.setAttribute("status", "invalidpwd");
			dispatcher = request.getRequestDispatcher("register.jsp");
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
		else {
			// Check for password strength
			boolean hasUppercase = !upwd.equals(upwd.toLowerCase());
			boolean hasLowercase = !upwd.equals(upwd.toUpperCase());
			boolean hasNumber = upwd.matches(".*\\d.*");
			boolean hasSpecialChar = !upwd.matches("[A-Za-z0-9 ]*");

			int score = 0;
			if (hasUppercase) {
				score++;
			}
			if (hasLowercase) {
				score++;
			}
			if (hasNumber) {
				score++;
			}
			if (hasSpecialChar) {
				score++;
			}

			if (score < 2) {
				request.setAttribute("status", "weakpwd");
			} else if (score < 4) {
				request.setAttribute("status", "mediumpwd");
			} else {
				request.setAttribute("status", "strongpwd");
			}

			if (!upwd.equals(Reupwd)) {
				request.setAttribute("status", "invalidconfirmpwd");
			}

			dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}

		if (Birthday == null || Birthday.equals("")) {
			request.setAttribute("status", "invalidBirthday");
			dispatcher = request.getRequestDispatcher("register.jsp");
			dispatcher.forward(request, response);
		}
		if (umobile == null || umobile.equals("")) {
			request.setAttribute("status", "invalidmobile");
			dispatcher = request.getRequestDispatcher("register.jsp");
			dispatcher.forward(request, response);
		} else if (umobile.length() > 10) {
			request.setAttribute("status", "invalidmobileLength");
			dispatcher = request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);

		}

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			// con =
			// DriverManager.getConnection("jdbc:mysql://localhost:3306/vineeth?useSSL=false","root","Vineeth@0502");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/mydb?useSSL=false&serverTimezone=UTC&useLegacyDatetimeCode=false",
					"root", "Saikiran@1");

			PreparedStatement pst = con
					.prepareStatement("insert into userslist(username,email,password,mobile,birthday,question1,question2,question3,answer1,answer2,answer3,customQuestion,customAnswer,image,fullname) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ");
			pst.setString(1, uname);
			pst.setString(2, uemail);
			pst.setString(3, upwd);
			pst.setString(4, umobile);
			pst.setString(5, Birthday);
			
			pst.setString(6, question1);
			pst.setString(7, question2);
			pst.setString(8, question3);
			
			pst.setString(9, q1);
			pst.setString(10, q2);
			pst.setString(11, q3);
			
			pst.setString(12, customQuestion);
			pst.setString(13, customAnswer);
			
			pst.setString(14, selectedImage);
			
			pst.setString(15, fullname);
			
			
			int rowCount = pst.executeUpdate();

			if (rowCount > 0) {
			    request.setAttribute("status", "success");
			} else {
			    request.setAttribute("status", "failed");
			}

			dispatcher = request.getRequestDispatcher("login.jsp");

			if (!response.isCommitted()) {
			    dispatcher.forward(request, response);
			}
			
			
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
