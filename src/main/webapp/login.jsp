




<!-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> -->

<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Log In</title>
     <link rel="stylesheet" href="loginStyle.css" /> 
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap"
      rel="stylesheet"
    />
  </head>
  <body
    style="
      background-image: url(./images/backgroundImage_03.jpg);
      background-repeat: no-repeat;
      background-attachment: fixed;
      background-size: cover;
      margin: 0px;
      height: 100%;
      display: flex;
      flex-direction: column;
      justify-content: center;
    "
  >
    <nav style="background-color: #17252a; height: 130px">
      <h1 style="font-size: 36px; margin: 0; padding-top: 10px">
        Course Management System
      </h1>
    </nav>

    <div class="center" style="margin: auto">
      <form method="post">
        <h4 style="text-align: center">Please Log in</h4>
        <br />
        <label style="font-weight: bold; color: #000000" for="username"
          >Username:</label
        >
        <input type="text" name="uname" required />
        <br />
        <label style="font-weight: bold; color: #000000" for="password"
          >Password:</label
        >
        <input type="password" name="pass" required />
        <br />
        <div
          class="submitDiv"
          style="display: flex; justify-content: space-between"
        >
          <input
            style="background-color: #429d98; font-weight: bold"
            type="submit"
            name="action"
            value="Admin Login"
            formaction="AdminLogin"
          />
          <input
            style="background-color: #429d98; font-weight: bold"
            type="submit"
            name="action"
            value="Teacher Login"
            formaction="TeacherLogin"
          />
          <input
            style="background-color: #429d98; font-weight: bold"
            type="submit"
            name="action"
            value="Student Login"
            formaction="StudentLogin"
          />
        </div>
      </form>
    </div>
  </body>
</html>





















