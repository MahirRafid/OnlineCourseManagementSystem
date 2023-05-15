package com.login;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.dao.LoginDao;
import com.login.model.Course;

/**
 * Servlet implementation class StudentLogin
 */
public class StudentLogin extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String uname = request.getParameter("uname");
		 String pass = request.getParameter("pass");
		 String studentEmail,courseName,studentRegistration;
		 ArrayList<String> courseCodes;
		 ArrayList<String> courseNames = new ArrayList<String>();
		 LoginDao dao = new LoginDao();
		    if(dao.check(uname, pass,"student")) {
		    	
		    	
		    	studentEmail = dao.getEmailOfUser(uname, "student");
		    	studentRegistration = dao.getRegistrationOfStudent(uname);
		    	courseCodes = dao.getRegisteredCourses(studentEmail, "student_registered");
		    	for(int i = 0;i<courseCodes.size();i++) {
		    		courseName = dao.getCourseName(courseCodes.get(i));
		    		System.out.print(courseName);
		    		courseNames.add(courseName);
		    	}
		    	
		   	    ArrayList<Course> coursesInfo = dao.coursesInfo();
		    	HttpSession session =  request.getSession();
		    	session.setAttribute("username", uname);
		    	request.setAttribute("courseCodes", courseCodes);
		    	request.setAttribute("courseNames", courseNames);
		    	request.setAttribute("coursesInfo", coursesInfo);
		    	request.setAttribute("studentUsername", uname);
		    	request.setAttribute("studentEmail", studentEmail);
		    	request.setAttribute("studentRegistration", studentRegistration);
		    	//System.out.println(studentEmail + "where are you");
		    	//response.sendRedirect("student.jsp");
		    	RequestDispatcher rd = request.getRequestDispatcher("student.jsp");
				rd.forward(request, response);
		    } else {
		    	response.sendRedirect("login.jsp");
		    }
	}

}
