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
import com.login.model.StudentInfo;

/**
 * Servlet implementation class StudentList
 */
public class StudentList extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =  request.getSession();
    	String uname = (String) session.getAttribute("username");
	//	 String uname = request.getParameter("uname");
		 String courseCode = request.getParameter("coursecode");
		 String courseName;
		 String teacherEmail;
		 ArrayList<String> courseCodes;
		 ArrayList<String> courseNames = new ArrayList<String>();
		 LoginDao dao = new LoginDao();
		 ArrayList<StudentInfo> studentInfos = dao.registeredStudentOfCourse(courseCode);
		 teacherEmail = dao.getEmailOfUser(uname, "teacher");
	    	courseCodes = dao.getRegisteredCourses(teacherEmail, "teacher_registered");
	    	System.out.println("hello");
	    	for(int i = 0;i<courseCodes.size();i++) {
	    		courseName = dao.getCourseName(courseCodes.get(i));
	    		System.out.print(courseName);
	    		courseNames.add(courseName);
	    	}
		 request.setAttribute("studentInfos", studentInfos);
		 request.setAttribute("courseCodes", courseCodes);
	    	request.setAttribute("courseNames", courseNames);
	    	//response.sendRedirect("student.jsp");
	    	RequestDispatcher rd = request.getRequestDispatcher("teacher.jsp");
			rd.forward(request, response);
		
	}

}
