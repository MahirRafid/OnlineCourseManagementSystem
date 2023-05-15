 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="com.login.model.Course" %>
       <%@ page import="java.util.ArrayList" %> 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Admin Dashboard</title>
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
    <link rel="stylesheet" href="adminStyle.css" />
  </head>
  <body>
    <div
      class="studentInfoDiv"
      style="
        display: flex;
        justify-content: space-between;
        height: 130px;
        align-items: center;
      "
    >
      <p class="courseHeading" style="margin-bottom: 0px">Admin Dashboard</p>
      <form
        action="Logout"
        style="
          padding: 0px;
          margin: 0px;
          border: none;
          background-color: transparent;
          width: 130px;
          margin-right: 40px;
        "
      >
        <input
          action="Logout"
          type="submit"
          value="Logout"
          style="background-color: rgb(199, 50, 50)"
        />
      </form>
    </div>

     <%
     response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");  //http1.1
     response.setHeader("Pragma","no-cache"); //http1.0
     response.setHeader("Expires","0"); //proxies 
     if(session.getAttribute("username") == null){
        	response.sendRedirect("login.jsp");
        }
     
     %>
     
     
     
     
   <% ArrayList<Course> coursesInfo = (ArrayList<Course>)session.getAttribute("coursesInfo"); %>   

    <p
      class="stuInfoHead"
      style="
        font-size: 22px;
        font-weight: bold;
        color: #000000;
        text-align: center;
        margin-bottom: 30px;
      "
    >
      Currently Available Courses
    </p>

    <table
      class="courseTable table align-middle mb-0 bg-white table-hover"
      style="
        border-collapse: collapse;
        width: 50%;
        margin: 0 auto;
        border: 1px solid #ddd;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        margin-bottom: 40px;
      "
    >
      <thead class="bg-light" style="background-color: #f1f1f1">
        <tr>
          <th style="padding: 10px; border: 1px solid #ddd">Course Code</th>
          <th style="padding: 10px; border: 1px solid #ddd">Course Name</th>
        </tr>
      </thead>
      <tbody>
         <% for (int i = 0; i < coursesInfo.size(); i++) { %> 
       
        <tr>
           <td style="padding: 10px; border: 1px solid #ddd;"><%= coursesInfo.get(i).getCourseCode() %></td> 
           <td style="padding: 10px; border: 1px solid #ddd;"><%= coursesInfo.get(i).getCourseName() %></td> 
        </tr>
         <% } %> 
      </tbody>
    </table>

    <div style="display: flex; justify-content: center; margin-top: 90px">
      <div style="width: 50%; margin-right: 10px">
        <p
          class="stuInfoHead"
          style="
            font-size: 22px;
            font-weight: bold;
            color: #000000;
            text-align: center;
            margin-bottom: 30px;
            padding-right: 40px;
          "
        >
          Add new course to the system
        </p>
        <form
          method="get"
          action="Admin"
          style="box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); text-align: left"
        >
          <label for="coursecode">Course Code:</label>
          <input
            type="text"
            id="coursecode"
            name="coursecode"
            placeholder="Enter Course Code"
          /><br /><br />
          <label for="coursename">Course Name:</label>
          <input
            type="text"
            id="coursename"
            name="coursename"
            placeholder="Enter Course Name"
          /><br /><br />
          <input type="submit" value="Submit" />
        </form>
      </div>

      <div style="width: 60%; margin-left: 10px">
        <p
          class="stuInfoHead"
          style="
            font-size: 22px;
            font-weight: bold;
            color: #000000;
            text-align: center;
            margin-bottom: 30px;
            padding-right: 40px;
          "
        >
          Assign teacher to a particular course
        </p>
        <form
          action="Admin"
          method="post"
          style="box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); text-align: left"
        >
          <label for="fullname">Teacher's Name:</label>
          <input
            type="text"
            id="fullname"
            name="fullname"
            placeholder="Enter Teacher's Name"
          /><br /><br />
          <label for="email">Email:</label>
          <input
            type="email"
            id="email"
            name="email"
            placeholder="Enter Email"
          /><br /><br />
          <label for="coursecode">Course Code:</label>
          <input
            type="text"
            id="coursecode"
            name="coursecode"
            placeholder="Enter Course Code"
          /><br /><br />
          <input type="submit" value="Submit" />
        </form>
      </div>
    </div>
  </body>
</html>
