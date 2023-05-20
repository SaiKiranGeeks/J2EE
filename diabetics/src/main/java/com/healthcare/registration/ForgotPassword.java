package com.healthcare.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ForgotPassword
 */
@WebServlet("/forgotPassword")
public class ForgotPassword extends HttpServlet {
	/**
	 * 
	 */
	
	  private static final long serialVersionUID = 1L;
	  private static final String UPPER_CASE = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	  private static final String LOWER_CASE = "abcdefghijklmnopqrstuvwxyz";
	  private static final String NUMBERS = "0123456789";
	  private static final String SYMBOLS = "!@#$%^&*_=+-/";
	  

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		
	//	HttpSession session4 = request.getSession();
		RequestDispatcher dispatcher = null;
		
		int otpvalue = 0;
		HttpSession mySession = request.getSession();
		
		
		
		if(email == null || email.equals("")) {
			request.setAttribute("status", "invalidEmail");
			dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
	
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			
		//	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vineeth?useSSL=false","root","Vineeth@0502");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false&serverTimezone=UTC&useLegacyDatetimeCode=false","root","Saikiran@1");
				
			PreparedStatement pst = con.prepareStatement("select * from userslist where email = ?");
			pst.setString(1,  email);
			
			ResultSet rs = pst.executeQuery();
			
			System.out.println("Forgot user email :"+email);
			
			if(rs.next()) {
				// sending 
				Random rand = new Random();
				 int length = 8; // password length
				 String password = generatePassword(length);
				    
				otpvalue = rand.nextInt(1255650);

				String to = email;// change accordingly
				// Get the session object
				Properties props = new Properties();
				
				/*
				props.put("mail.smtp.host", "smtp.gmail.com");
				props.put("mail.smtp.socketFactory.port", "465");
				props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.port", "465");*/
				
				props.setProperty("mail.smtp.host", "smtp.gmail.com");
				props.setProperty("mail.smtp.port", "465");
				props.setProperty("mail.smtp.auth", "true");
				props.setProperty("mail.smtp.ssl.enable", "true");

			        
				
				Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication("saikiranworkspace@gmail.com", "dspgnmyatykhwmyc");
					}
				});
				// compose message
				try {
					MimeMessage message = new MimeMessage(session);
					message.setFrom(new InternetAddress(email));// change accordingly
					message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
					message.setSubject("Temporary Password Genereated");
					message.setText("Hello, This is your Temporary Password is: " + password);
					// send message
					Transport.send(message);
					System.out.println("message sent successfully");
				}

				catch (MessagingException e) {
					throw new RuntimeException(e);
				}
				dispatcher = request.getRequestDispatcher("EnterOtp.jsp");
				request.setAttribute("message","Password is sent to your email id");
				//request.setAttribute("connection", con);
				mySession.setAttribute("password",password); 
				mySession.setAttribute("email",email); 
				dispatcher.forward(request, response);
				//request.setAttribute("status", "success");
				
			//	session.setAttribute("name", rs.getString("uname"));
				
				
				dispatcher = request.getRequestDispatcher("index.jsp");
			} else {
				System.out.println("Inavlid user email :"+email);
				request.setAttribute("status", "invalidEmail");
				dispatcher = request.getRequestDispatcher("login.jsp");
				dispatcher.forward(request, response);
			}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}
		private static String generatePassword(int length) {
		    StringBuilder password = new StringBuilder();
		    Random random = new Random();

		    // Add at least one upper case letter
		    password.append(UPPER_CASE.charAt(random.nextInt(UPPER_CASE.length())));

		    // Add at least one lower case letter
		    password.append(LOWER_CASE.charAt(random.nextInt(LOWER_CASE.length())));

		    // Add at least one number
		    password.append(NUMBERS.charAt(random.nextInt(NUMBERS.length())));

		    // Add at least one symbol
		    password.append(SYMBOLS.charAt(random.nextInt(SYMBOLS.length())));

		    // Fill up the rest of the password with random characters
		    for (int i = 0; i < length - 4; i++) {
		      String characters = UPPER_CASE + LOWER_CASE + NUMBERS + SYMBOLS;
		      password.append(characters.charAt(random.nextInt(characters.length())));
		    }

		    // Shuffle the password characters
		    String shuffledPassword = shuffle(password.toString());

		    return shuffledPassword;
		  }

		  private static String shuffle(String str) {
		    char[] array = str.toCharArray();
		    Random random = new Random();
		    for (int i = array.length - 1; i > 0; i--) {
		      int j = random.nextInt(i + 1);
		      char temp = array[i];
		      array[i] = array[j];
		      array[j] = temp;
		    }
		    return new String(array);
		  }


}
	