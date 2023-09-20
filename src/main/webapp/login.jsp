<%@page import="java.util.logging.Logger"%>
<%@page import="com.jdbc.task.dao.TaskDaoImpl"%>
<%@page import="com.jdbc.task.dao.UserDaoImpl"%>
<%@page import="com.jdbc.task.dao.ITaskDao"%>
<%@page import="com.jdbc.task.entity.Task"%>
<%@page import="com.jdbc.task.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>WelcomePage</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.back-img {
	background-image: url("images/about.jpeg");
	width: 100%;
	height: 80vh;
	background-repeat: no-repeat;
	background-size: cover;
}
 *{
	margin: 0%;
	padding: 0%;
	box-sizing: border-box;
	}
.text-on-pannel {
  background: #fff none repeat scroll 0 0;
  height: auto;
  margin-left: 100px;
  padding: 3px 5px;
  position: absolute;
  margin-top: -47px;
  border: 1px solid #337ab7;
  border-radius: 8px;
  color:black;
}


.panel {
  margin-top: 10px !important;
  width:30%;
  height:55%;
  padding:0.5;
  margin:0 auto;
  
}

.panel-body {
  padding-top: 20px !important;

}
h1
{
	color:black;
}

h3{
	color:black;
	background-color:white;
}

</style>
</head>
<body>
	
	<%@include file="component/topnav.jsp"%>



	<div class="container-fluid back-img text-center text-success">
		<br><br><br>
		<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
<div class="container">
  <div class="panel panel-primary">
    <div class="panel-body">
      <h3 class="text-on-pannel text-dark"><strong class="text-uppercase"> Login </strong></h3>
      <form method="post">
    
		<fieldset align="center">
				<h4 class="text-dark">User ID:<br><input type="text" placeholder="Enter emailID" name="userid" pattern=".+@gmail\.com" required></h4>
				<h4 class="text-dark">Password:<br><input type="password" placeholder="Enter Password" name="password" required></h4>
				<div class="text-center text-lg-start mt-4 pt-2">
          <!--    <button type="button" class="btn btn-primary btn-lg"
              style="padding-left: 8.5rem; padding-right: 8.5rem;"><a class="text-white" href="Home.jsp">Sign In</button> </div><br>  -->
              
              <a class="text-muted" href="forgot.jsp">Forgot password?</a><br>
                

                  <div class="d-flex align-items-center justify-content-center pb-4">
                    <p class="mb-0 me-2">Don't have an account?</p>
                    <button type="button" class="btn btn-outline-danger"> <a class="text-danger"href="Register.jsp">Create new</button>
                  </div>
                  
                  
     
			<button type="submit" class="btn btn-primary btn-lg" >Sign In</button><br><br>
		<!-- 	<h4><a href="Register.jsp" style="color:red">Sign Up</a></h4>      -->	
			<!-- 		<h4> <a href="forgot.jsp" style="color:red">forgot password?</a></h4>     -->
		</fieldset>
	</form>
	</div>
<%
	if(request.getMethod().equals("POST"))
	{
		String userid=request.getParameter("userid");
		String password=request.getParameter("password");
			User user=new User();
			user.setUserid(userid);
			user.setPassword(password);
			UserDaoImpl uDao=new UserDaoImpl();
			String email=null;
			email = uDao.validateUser(user);
			if(email!=null){
				out.print("<h3 style='color:green'>Logged in</h3>");
				HttpSession sess=request.getSession();
				sess.setAttribute("userid",email);
				response.sendRedirect("Home.jsp");
			}
			else{
				out.print("<h3 style='color:red'>Invalid UserId or Password </h3>");	
			
	}		
				
	}

%>		
    </div>
  </div>
  </div>
    

	<div class="container-fluid bg-primary p-3">
		<h5 class="text-white text-center">Developed and Designed by
			Tech4All student team: Sravani, Sneha, Anjali, Bhargavi, Nishath</h5>
	</div>


</body>
</html>