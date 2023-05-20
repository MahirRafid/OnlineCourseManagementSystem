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
 * Servlet implementation class Student
 */
public class Student extends HttpServlet {
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String studentEmail,courseName,studentRegistration;
		 ArrayList<String> courseCodes;
		 ArrayList<String> courseNames = new ArrayList<String>();
		 String fullName = request.getParameter("fullname");
		 String email = request.getParameter("email");
		 String registration = request.getParameter("registration");
		 String courseCode = request.getParameter("coursecode");
		 HttpSession session =  request.getSession();
		 String uname = (String) session.getAttribute("username");
		 
		 
		 LoginDao dao = new LoginDao();
		 dao.insertRegisteredCourseOfStudent(fullName, email, registration, courseCode);
			studentEmail = dao.getEmailOfUser(uname, "student");
			//studentEmail = dao.getEmailOfUser(uname, "student");
	    	studentRegistration = dao.getRegistrationOfStudent(uname);
	    	courseCodes = dao.getRegisteredCourses(studentEmail, "student_registered");
	    	
	    	for(int i = 0;i<courseCodes.size();i++) {
	    		courseName = dao.getCourseName(courseCodes.get(i));
	    		System.out.print(courseName);
	    		courseNames.add(courseName);
	    	}
	    	
	   	    ArrayList<Course> coursesInfo = dao.coursesInfo();
	    	
	     	request.setAttribute("courseCodes", courseCodes);
	     	request.setAttribute("courseNames", courseNames);
	     	request.setAttribute("coursesInfo", coursesInfo);
	     	request.setAttribute("studentUsername", uname);
	    	request.setAttribute("studentEmail", studentEmail);
	    	request.setAttribute("studentRegistration", studentRegistration);
	     	
		 RequestDispatcher rd = request.getRequestDispatcher("student.jsp");
		 
		 rd.forward(request, response);
	}

}
