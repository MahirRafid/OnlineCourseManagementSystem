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
 * Servlet implementation class Admin
 */
public class Admin extends HttpServlet {

	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String fullName = request.getParameter("fullname");
		 String email = request.getParameter("email");
		 String courseCode = request.getParameter("coursecode");
		 LoginDao dao = new LoginDao();
		 dao.insertRegisteredCourseOfTeacher(fullName, email, courseCode);
		 RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
		 rd.forward(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String courseCode = request.getParameter("coursecode");
		 String courseName = request.getParameter("coursename");
		 LoginDao dao = new LoginDao();
		 dao.insertNewCourse(courseCode, courseName);
		// HttpSession session =  request.getSession();
		 ArrayList<Course> coursesInfo = dao.coursesInfo();
		 HttpSession session =  request.getSession();
		 session.setAttribute("coursesInfo", coursesInfo);
		 response.sendRedirect("admin.jsp");
	}

	
}
