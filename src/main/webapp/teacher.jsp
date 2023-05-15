 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.login.model.StudentInfo" %>
  <%@ page import="java.util.ArrayList" %> 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Teacher Dashboard</title>
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
    <link rel="stylesheet" href="teacherStyle.css" />
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
      <p class="courseHeading" style="margin-bottom: 0px">Teacher Dashboard</p>
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
    <!--  Checking whether the session is null or not -->
     <%
     response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");  //http1.1
     response.setHeader("Pragma","no-cache"); //http1.0
     response.setHeader("Expires","0"); //proxies 
     if(session.getAttribute("username") == null){
        	response.sendRedirect("login.jsp");
        }
     
     %> 

    <div class="center">
       <% ArrayList<String> courseCodes = (ArrayList<String>)request.getAttribute("courseCodes");
       ArrayList<String> courseNames = (ArrayList<String>)request.getAttribute("courseNames");
      // for (int i = 0; i < courseCodes.size(); i++) {
        //   out.println(courseCodes.get(i) + " " + courseNames.get(i) + "<br>");
       //}
    %> 

      <div style="text-align: center">
        <p
          class="stuInfoHead"
          style="margin: 20px; font-weight: bold; color: black"
        >
          
           Assigned Courses for <%= session.getAttribute("username") %> 
        </p>

        <table
          class="courseTable table align-middle mb-0 bg-white table-hover"
          style="width: 50%"
        >
          <thead class="bg-light">
            <tr>
              <th style="padding: 10px; border: 1px solid #ddd; color: black">
                Course Code
              </th>
              <th style="padding: 10px; border: 1px solid #ddd; color: black">
                Course Name
              </th>
            </tr>
          </thead>
          <tbody>
             <% for (int i = 0; i < courseCodes.size(); i++) { %> 
            <tr>
              
               <td style="padding: 10px; border: 1px solid #ddd;"><%= courseCodes.get(i) %></td> 
               <td style="padding: 10px; border: 1px solid #ddd;"><%= courseNames.get(i) %></td> 
            </tr>
           
             <% } %> 
          </tbody>
        </table>

        <button
          id="toggleButton"
          style="
            background-color: #3aafa9;
            border: none;
            color: white;
            font-weight: 500;
            padding: 12px 30px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 18px;
            margin: 40px;
            cursor: pointer;
            border-radius: 5px;
            box-shadow: 1px 1px 5px #e1e1e1;
            transition: background-color 0.5s;
            margin-top: 52px;
          "
        >
          StudentList of particular course
        </button>

        <form
          action="StudentList"
          method="post"
          id="addCourseForm"
          style="
            display: none;
            width: 35%;
            text-align: left;
            margin-top: 120px;
            margin-top: 30px;
            padding: 40px;
            border: 1px solid rgb(200, 200, 200);
            border-radius: 5px;
          "
        >
          <label
            for="coursecode"
            style="
              font-weight: bold;
              color: black;
              text-align: center;
              padding-bottom: 20px;
            "
            >Course Code :
          </label>
          <input
            type="text"
            id="coursecode"
            name="coursecode"
            placeholder="Please enter the course code : "
          />
          <!-- <input
            id="toogleButtonTwo"
            type="submit"
            value="Get Student List"
            style="padding: 8px 20px; font-size: 500"
          /> -->
          <button
            id="toggleButtonTwo"
            style="
              background-color: #3aafa9;
              border: none;
              color: white;
              font-weight: 500;
              padding: 8px 20px;
              text-align: center;
              text-decoration: none;
              display: inline-block;
              font-size: 18px;
              /* margin: 40px; */
              cursor: pointer;
              border-radius: 5px;
              box-shadow: 1px 1px 5px #e1e1e1;
              transition: background-color 0.5s;
              /* margin-top: 52px; */
              margin: auto;
              width: 100%;
            "
          >
            Get Student List
          </button>
        </form>

         
       <%  ArrayList<StudentInfo> studentInfos = (ArrayList<StudentInfo>) request.getAttribute("studentInfos"); %>
   
    <% 
    
    if(request.getParameter("coursecode") != null) { %>
        <div id="getStudentTable" style="display: block; margin: 40px">
          <p class="stuInfoHead">
           
             Students of <%= request.getParameter("coursecode") %> 
          </p>
          <table
            class="courseTable table align-middle mb-0 bg-white table-hover"
            style="
              border-collapse: collapse;
              width: 50%;
              margin: 0 auto;
              border: 1px solid #ddd;
              box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            "
          >
            <thead class="bg-light" style="background-color: #f1f1f1">
              <tr>
                <th style="padding: 10px; border: 1px solid #ddd; color: black">
                  Full Name
                </th>
                <th style="padding: 10px; border: 1px solid #ddd; color: black">
                  Reg. No.
                </th>
              </tr>
            </thead>
            <tbody>
               <% if (studentInfos != null && !studentInfos.isEmpty()) {%>
    <% for (StudentInfo studentInfo : studentInfos) { %> 
                <tr>
                 <td style="padding: 10px; border: 1px solid #ddd;"><%= studentInfo.getFullname() %></td> 
                 <td style="padding: 10px; border: 1px solid #ddd;"><%= studentInfo.getRegistration() %></td> 
              </tr>
               <% } %> 
               <%} %> 
            </tbody>
          </table>
        </div>
        
            <%} %>
        
      </div>
    </div>
    <script>
      var toggleButton = document.getElementById("toggleButton");
      var addCourseForm = document.getElementById("addCourseForm");
      toggleButton.addEventListener("click", function () {
        if (addCourseForm.style.display === "none") {
          addCourseForm.style.display = "block";
        } else {
          addCourseForm.style.display = "none";
        }
        addCourseForm.scrollIntoView({ behavior: 'smooth' });
      });

      var toggleButtonTwo = document.getElementById("toggleButtonTwo");
      var getStudentTable = document.getElementById("getStudentTable");
      getStudentTable.scrollIntoView({ behavior: 'smooth' });
      toggleButtonTwo.addEventListener("click", function () {
        if (getStudentTable.style.display === "none") {
          getStudentTable.style.display = "block";
        } else {
          getStudentTable.style.display = "none";
        }
        getStudentTable.scrollIntoView({ behavior: 'smooth' });
      });
    </script>
  </body>
</html>
