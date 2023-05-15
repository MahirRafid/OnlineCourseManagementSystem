package com.login.dao;
import com.login.model.*;
import java.sql.*;
import java.util.ArrayList;
public class LoginDao {
	
	   String dburl = "jdbc:mysql://localhost:3306/course_management_system";
	   String dbusername="root";
	   String dbpassword="35821";
	   
	   //Checking whether a particular type user (admin , student or teacher ) is an authenticated user or not
	   public boolean check(String username,String password,String tableName) {
		 
		   try {
			   Class.forName("com.mysql.jdbc.Driver");
			  
			   Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			   String query = "select * from "+tableName+" where username=? and password=?";
		       PreparedStatement st = con.prepareStatement(query);
		       st.setString(1, username);
		       st.setString(2, password);
		       ResultSet rs = st.executeQuery();
		       if(rs.next()) {
		    	
		    	   return true;
		       }
		       st.close();
		        con.close();
		   } catch(Exception e) {		
			   e.printStackTrace();
		   }
		   
		   return false;
	   }
	   
	   public String getEmailOfUser(String username,String tableName) {
		  
		   String email="";
		   try {
			   
		   Class.forName("com.mysql.jdbc.Driver");
		   Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
		   String query = "select email from "+tableName+" where username=?";
	       PreparedStatement st = con.prepareStatement(query);
	       st.setString(1, username);
	       ResultSet rs = st.executeQuery();
	       
	       
	       if(rs.next()) {
	    	   email = rs.getString("email");
	       }
	       st.close();
	        con.close();
		   } catch(Exception e) {
			   e.printStackTrace();
		   }
		   return email;
	   }
	   
	   public String getRegistrationOfStudent(String username) {
		   String registration="";
		   
		   try {
			   
			   Class.forName("com.mysql.jdbc.Driver");
			   Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			   String query = "select registration from student where username=?";
		       PreparedStatement st = con.prepareStatement(query);
		       st.setString(1, username);
		       ResultSet rs = st.executeQuery();
		       
		       
		       if(rs.next()) {
		    	   registration = rs.getString("registration");
		       }
		       st.close();
		        con.close();
			   } catch(Exception e) {
				   e.printStackTrace();
			   }
		   
		   
		   return registration;
	   }
	     
	   
	   
	   public ArrayList<String> getRegisteredCourses(String email,String tableName) {
		    ArrayList<String> courseCodes = new ArrayList<String>();
		    try {
				   
				   Class.forName("com.mysql.jdbc.Driver");
				   Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
				   String query = "select coursecode from "+tableName+" where email=?";
			       PreparedStatement st = con.prepareStatement(query);
			       st.setString(1, email);
			       ResultSet rs = st.executeQuery();
			       
			       while(rs.next()) {
			    	   courseCodes.add(rs.getString("coursecode"));
			       }
			       st.close();
			        con.close();
				   } catch(Exception e) {
					   e.printStackTrace();
				   }
		    

		    return courseCodes;
		}
	   
	   public ArrayList<StudentInfo> registeredStudentOfCourse(String coursecode) {
		   ArrayList<StudentInfo> studentInfos = new ArrayList<StudentInfo>();
		   try {
			   
			   Class.forName("com.mysql.jdbc.Driver");
			   Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			   String query = "select * from student_registered where coursecode=?";
		       PreparedStatement st = con.prepareStatement(query);
		       st.setString(1, coursecode);
		       ResultSet rs = st.executeQuery();
		       
		       while(rs.next()) {
		    	   StudentInfo si = new StudentInfo();
		    	   si.setFullname(rs.getString("fullname"));
		    	   si.setRegistration(rs.getString("registration"));
		    	   studentInfos.add(si);
		       }
		       
		        st.close();
		        con.close();
			   } catch(Exception e) {
				   e.printStackTrace();
			   }
	       
		   return studentInfos;
	   }
	   
	   
	   
	   
	   
	   public void insertRegisteredCourseOfStudent(String fullname,String email,String registration,String courseCode) {
		   
		   try {
		   
		   Class.forName("com.mysql.jdbc.Driver");
		   Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
		   String query = "insert into student_registered values (?,?,?,?)";
	       PreparedStatement st = con.prepareStatement(query);
	       st.setString(1, fullname);
	       st.setString(2, email);
	       st.setString(3, registration);
	       st.setString(4, courseCode);
	       int count = st.executeUpdate();
	       System.out.println(count + "rows affected");
	       
	        st.close();
	        con.close();
		   } catch(Exception e) {
			   e.printStackTrace();
		   }
		   
		   
	   }
	   
	   
	   
	   
 public void insertRegisteredCourseOfTeacher(String fullname,String email,String courseCode) {
		   
		   try {
		   
		   Class.forName("com.mysql.jdbc.Driver");
		   Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
		   String query = "insert into teacher_registered values (?,?,?)";
	       PreparedStatement st = con.prepareStatement(query);
	       st.setString(1, fullname);
	       st.setString(2, email);
	       st.setString(3, courseCode);
	       int count = st.executeUpdate();
	       System.out.println(count + "rows affected");
	       
	        st.close();
	        con.close();
		   } catch(Exception e) {
			   e.printStackTrace();
		   }
		   
		   
	   }
	   
 
 
 

 
 
 
 
 
 
 
 
 

 public ArrayList<Course> coursesInfo(){
	 
	 ArrayList<Course> courseList = new ArrayList<Course>();
	 try {
		   
		   Class.forName("com.mysql.jdbc.Driver");
		   Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
		   String query = "select * from courses";
	       PreparedStatement st = con.prepareStatement(query);
	       ResultSet rs = st.executeQuery();
	       
	       while(rs.next()) {
	    	   Course c = new Course();            
	    	   c.setCourseCode(rs.getString("coursecode"));
	    	   c.setCourseName(rs.getString("coursename"));
	    	   courseList.add(c);
	       }
	       
	        st.close();
	        con.close();
		   } catch(Exception e) {
			   e.printStackTrace();
		   }
     
	   return courseList;
	 
 }
 public String getCourseName(String courseCode) {
	 
	  String courseName = "";
	 
	 try {	   
		   Class.forName("com.mysql.jdbc.Driver");
		   Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
		   String query = "select coursename from courses where coursecode=?";
	       PreparedStatement st = con.prepareStatement(query);
	       st.setString(1, courseCode);
	       ResultSet rs = st.executeQuery();
	       
	       if(rs.next()) {
	    	   courseName = rs.getString("coursename");
	       }
	       st.close();
	        con.close();
		   } catch(Exception e) {
			   e.printStackTrace();
		   }
	 return courseName;
	   
 }
	   
	   
 public void insertNewCourse(String coursecode,String coursename) {
	   
	   try {
	   
	   Class.forName("com.mysql.jdbc.Driver");
	   Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
	   String query = "insert into courses values (?,?)";
     PreparedStatement st = con.prepareStatement(query);
     st.setString(1, coursecode);
     st.setString(2, coursename);
     int count = st.executeUpdate();
     System.out.println(count + "rows affected");
     
      st.close();
      con.close();
	   } catch(Exception e) {
		   e.printStackTrace();
	   }
	   
	   
 }
 
 
 
 
	   
	   
	   
}
