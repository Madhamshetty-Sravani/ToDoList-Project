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



	<div class="container-fluid back-img text-center text-dark">
		<br><br><br>
		<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
<div class="container">
  <div class="panel panel-primary">
    <div class="panel-body">
      <h3 class="text-on-pannel text-dark"><strong class="text-uppercase"> Sign up</strong></h3>
    
     <form method="post">
		<fieldset align="center">
	
	
		
		<div class="mail">
<body onload='document.form1.text1.focus()'>
<form name="form1" action="#"> 

<ul>
<!--  <li><input type='text' name='text1'/></li>  

<button type="submit" class="btn btn-primary" onclick="ValidateEmail(document.form1.text1)"/>Sign in</button>
</ul>
   -->
			
				User ID:<br><input type="email" placeholder="Enter emailID" name="userid" required><br><br>
				Password:<br><input type="password" placeholder="Enter Password" name="password" required><br><br>
				Confirm Password:<br><span><input type="password" placeholder="Enter Confirm Password" name="cpassword" required></span><br><br>
				User Name:<br><input type="text" placeholder="Enter user name" name="username" maxlength="15" required><br><br>
					
		<!--	 <button type="button" class="btn btn-primary btn-lg"
              style="padding-left: 8.5rem; padding-right: 8.5rem;"><a class="text-white" href="login.jsp">Sign Up</button> </div><br>
            -->  
        <!--     <button type="submit" class="btn btn-primary" onclick="ValidateEmail(document.form1.text1);"/>Sign Up</button>   --> 
			  <button type="submit" class="btn btn-primary" >Sign Up</button><br><br>      	   
			<!-- <a href="login.jsp" style="color:red">Login</a>     -->	
		</fieldset>
	</form>
	</div>
</body>
</html>	
<%	
if(request.getMethod().equals("POST"))
{
		String userId=request.getParameter("userid");
		String password=request.getParameter("password");
		String cpassword=request.getParameter("cpassword");
		String username=request.getParameter("username");
		if(password.length()<6)
		{
			out.print("<h3 style='color:red'> Password should be of minimum 6 characters!!! </h3>");
		}
		else if(password.equals(cpassword))
		{
				User user=new User();
				user.setUserid(userId);
				user.setPassword(password);
				user.setUsername(username);
				UserDaoImpl uDao=new UserDaoImpl();
				uDao.registerUser(user);	
		out.print("<h3 style='color:green'>User Registered Successfully!!</h3>");
		}
		else
		{
			out.print("<h3 style='color:red'>Both passwords not matched!!</h3>");
		}
}
%>
    </div>
  </div>
  </div>

	<div class="container-fluid bg-primary p-3 fixed-bottom">
		<h5 class="text-white text-center">Developed and Designed by
			Tech4All student team: Sravani, Sneha, Anjali, Bhargavi, Nishath</h5>
	</div>
	<script src="email-validation.js"></script>
</body>
<script>
function ValidateEmail(inputText)
{
var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
if(inputText.value.match(mailformat))
{
alert("Valid email address!");
document.form1.text1.focus();
return true;
}
else
{
alert("You have entered an invalid email address!");
document.form1.text1.focus();
return false;
}
}

</script>
</html>