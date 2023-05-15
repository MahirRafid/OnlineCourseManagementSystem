 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ArrayList" %>
      <%@ page import="com.login.model.Course" %>
       <%@ page import="java.util.ArrayList" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student</title>
<link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
      crossorigin="anonymous"
    />
<link rel="stylesheet" href="studentStyle.css" />
</head>
<body>
  <%
     response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");  //http1.1
     response.setHeader("Pragma","no-cache"); //http1.0
     response.setHeader("Expires","0"); //proxies 
     if(session.getAttribute("username") == null){
        	response.sendRedirect("login.jsp");
        }
     
     %> 
 <div class="studentInfoDiv" style="display: flex; justify-content: space-between; height: 130px; align-items: center;">
    <p class="courseHeading" style="margin-bottom: 0px;">Student Dashboard</p>
    <form action="Logout" style="padding: 0px; margin: 0px; border: none; background-color: transparent; width: 130px; margin-right: 40px;" >
    <input action="Logout" type="submit" value="Logout" style="background-color: rgb(199, 50, 50);">
   </form>

  
  
    </div>
      <% ArrayList <String> courseCodes = (ArrayList<String>)request.getAttribute("courseCodes");
   ArrayList <String> courseNames = (ArrayList<String>)request.getAttribute("courseNames"); %>
   
    
    <% request.getAttribute("studentRegistration"); %> 
    <div class="flexDiv" style="gap : 70px">
      <div class="studentDiv" style="width : 640px">
        <p class="stuInfoHead">Student Information</p>
        <div class="student-info bg-white border rounded-2">
          <table class="table align-middle mb-0 bg-white table-hover">
            <tr>
              <th>Name</th>
               <td><%= request.getAttribute("studentUsername") %></td> 
              
            </tr>
            <tr>
              <th>Reg. no</th>
               <td><%= request.getAttribute("studentRegistration") %></td> 
            
            </tr>
            <tr>
              <th>Email</th>
               <td><%= request.getAttribute("studentEmail") %></td> 
             
            </tr>
          </table>
          <p class="stuInfoHead" style="padding-left: 0px; margin-bottom: 30px; font-size: 22px">Courses Enrolled</p>
         
    <table class="courseTable table align-middle mb-0 bg-white table-hover">
    <thead class="bg-light">
      <tr>
        <th>Course Code</th>
        <th>Course Name</th>
      </tr>
    </thead>
    <tbody>
       <% for (int i = 0; i < courseCodes.size(); i++) { %> 
        <tr>
           <td><%= courseCodes.get(i) %></td> 
          
           <td><%= courseNames.get(i) %></td> 
         
        </tr>
       
       <% } %> 
    </tbody>
  </table>
        </div>
      </div>
      <div class="courseDiv">
    
      <p class="stuInfoHead">Currently Available Courses</p>
         <% ArrayList<Course> coursesInfo = (ArrayList<Course>)request.getAttribute("coursesInfo");
    %> 
    <table class="courseTable table align-middle mb-0 bg-white table-hover" style="width: 640px">
    <thead class="bg-light">
      <tr>
        <th>Course Code</th>
        <th>Course Name</th>
      </tr>
    </thead>
    <tbody>
       <% for (int i = 0; i < coursesInfo.size(); i++) { %> 
        <tr>
             <td><%= coursesInfo.get(i).getCourseCode() %></td> 
            
             <td><%= coursesInfo.get(i).getCourseName() %></td> 
            
          </tr>
       <% } %> 
    </tbody>
  </table>
    
    
    
    
    
    
  
  
  
        <div class="add-course" id="toggleButton" >
           
              <button id="styleButton" style="font-size: 18px; font-weight: 500; background-color: #3aafa9;">Course Registration Form</button>
        </div>
      </div>
    </div>
    
    
    
    
    
    
    
    
    
    
 
    
    
   

   


   
       
	<form action="Student" method="post" id="toggleForm" style="display: none; width: 50%; text-align: left; margin-top: 120px;">
		<h3 style="padding-top: 20px; padding-bottom: 30px;">Register for a new course</h3>
        <label for="fullname">Full Name:</label>
		<input type="text" id="fullname" name="fullname" placeholder="Enter your name"><br><br>
		
		<label for="email">Email:</label>
		<input type="email" id="email" name="email" placeholder="Enter email address"><br><br>
		
		<label for="registration">Registration:</label>
		<input type="text" id="registration" name="registration" placeholder="Enter your reg. no. "><br><br>
		
		<label for="coursecode">Course Code:</label>
		<input type="text" id="coursecode" name="coursecode" placeholder="Enter course code"><br><br>
		
		<input type="submit" value="Submit">
	</form>
    

   
 
   
   
   
  
   
   
   
   
   
   
   
  
  
  
   <script>
  var toggleButton = document.getElementById("toggleButton");
  var addCourseForm = document.getElementById("toggleForm");
  toggleButton.addEventListener("click", function() {
    if (addCourseForm.style.display === "none") {
      addCourseForm.style.display = "block";
    } else {
      addCourseForm.style.display = "none";
    }
    addCourseForm.scrollIntoView({ behavior: 'smooth' });
   // addCourseForm.scrollIntoView({ behavior: 'smooth', block: 'start', inline: 'nearest' });
  });
  
  
  
  function toggleDiv() {
		var div = document.getElementById("availablecourses");
		
		if (div.style.display === "none") {
			div.style.display = "block";
		} else {
			div.style.display = "none";
		}
	}
  
  
  
</script>
  
</body>
</html>