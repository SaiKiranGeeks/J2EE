package com.healthcare.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class NewPassword
 */
@WebServlet("/newPassword")
public class NewPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		System.out.println("email :" + session.getAttribute("email"));
		System.out.println("email String :" + (String) session.getAttribute("email"));
		
		String newPassword = request.getParameter("password");
		String confPassword = request.getParameter("confPassword");
		
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
		if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {

			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				// Connection con =
				// DriverManager.getConnection("jdbc:mysql://localhost:3306/vineeth?useSSL=false","root","Vineeth@0502");
				Connection con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/mydb?useSSL=false&serverTimezone=UTC&useLegacyDatetimeCode=false",
						"root", "Saikiran@1");

				PreparedStatement pst = con.prepareStatement(
					    "update userslist set password = ?, question1 = ?, question2 = ?, question3 = ?, answer1 = ?, answer2 = ?, answer3 = ?, customQuestion = ?, customAnswer = ?, image = ? where email = ?");
					                
					pst.setString(1, newPassword);
					pst.setString(2, question1);
					pst.setString(3, question2);
					pst.setString(4, question3);
					pst.setString(5, q1);
					pst.setString(6, q2);
					pst.setString(7, q3);
					pst.setString(8, customQuestion);
					pst.setString(9, customAnswer);
					pst.setString(10, selectedImage);
					pst.setString(11, (String) session.getAttribute("email"));
					

				int rowCount = pst.executeUpdate();
				if (rowCount > 0) {
					request.setAttribute("status", "resetSuccess");
					dispatcher = request.getRequestDispatcher("login.jsp");
				} else {
					request.setAttribute("status", "resetFailed");
					dispatcher = request.getRequestDispatcher("login.jsp");
				}
				dispatcher.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
