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

/**
 * Servlet implementation class TeacherLogin
 */
public class TeacherLogin extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("uname");
		 String pass = request.getParameter("pass");
		 String courseName;
		 String teacherEmail;
		 ArrayList<String> courseCodes;
		 ArrayList<String> courseNames = new ArrayList<String>();
		
		 LoginDao dao = new LoginDao();
		    if(dao.check(uname, pass,"teacher")) {
		    	
		     	teacherEmail = dao.getEmailOfUser(uname, "teacher");
		    	courseCodes = dao.getRegisteredCourses(teacherEmail, "teacher_registered");
		    	System.out.println("hello");
		    	for(int i = 0;i<courseCodes.size();i++) {
		    		courseName = dao.getCourseName(courseCodes.get(i));
		    		System.out.print(courseName);
		    		courseNames.add(courseName);
		    	}
		    	HttpSession session =  request.getSession();
		    	session.setAttribute("username", uname);
		    	request.setAttribute("courseCodes", courseCodes);
		    	request.setAttribute("courseNames", courseNames);
		    	//response.sendRedirect("student.jsp");
		    	RequestDispatcher rd = request.getRequestDispatcher("teacher.jsp");
				rd.forward(request, response);
		    } else {
		    	response.sendRedirect("login.jsp");
		    }
	}

}
