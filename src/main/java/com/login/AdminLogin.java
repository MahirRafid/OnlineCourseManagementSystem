package com.login;
import com.login.dao.*;
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
import com.login.dao.*;
/**
 * Servlet implementation class AdminLogin
 */
public class AdminLogin extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String uname = request.getParameter("uname");
		 String pass = request.getParameter("pass");
		 LoginDao dao = new LoginDao();
		    if(dao.check(uname, pass,"admin")) {
		       ArrayList<Course> coursesInfo = dao.coursesInfo();
		    	HttpSession session =  request.getSession();
		    	session.setAttribute("username", uname);
		    	session.setAttribute("coursesInfo", coursesInfo);
		    	RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
		    	
				rd.forward(request, response);
		    } else {
		    	response.sendRedirect("login.jsp");
		    }
	}

}
