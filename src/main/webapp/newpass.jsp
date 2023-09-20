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
h1
{
	color:black;
}
h4{
	color:black;
	background-color:white;
	
}
</style>

</head>
<body>

	<%@include file="component/topnav.jsp"%>
	<div class="container-fluid back-img text-center text-dark"><br><br><br>
		 <form method="post">
       <center>
	UserName:<br><input type="text" name="userid" readonly value="<%= request.getParameter("userid")%>"><br><br>
	Password:<br><input type="password" name="password" required><br><br>
	Confirm password:<br><input type="password" name="cpassword" required><br><br>
	<input type="submit" value="Click here"><br><br>
	</center>
	</form>
</html>

<%
		
if(request.getMethod().equals("POST"))
{
	String userId=request.getParameter("userid");
	String password=request.getParameter("password");
	String cpassword=request.getParameter("cpassword");
	if(password.equals(cpassword))
	{
			User user=new User();
			user.setUserid(userId);
			user.setPassword(password);
			UserDaoImpl uDao=new UserDaoImpl();
			Boolean status = uDao.updateUserPassword(user);
			if(status)
			{
				out.print("<h3 style='color:green'>Password Updated Successfully</h3>");
				response.sendRedirect("index.jsp");
			}
			else
				out.print("<h3 style='color:red'>Failed to Update Password!!</h3>");
	   }
	else
	{
		out.print("<h3 style='color:red'> Both passwords doesnot match</h3>");
	}
}
%>
	</div>
	

	<div class="container-fluid bg-primary p-3">
		<h5 class="text-white text-center">Developed and Designed by
			Tech4All student team: Sravani, Sneha, Anjali, Bhargavi, Nishath</h5>
	</div>


</body>
</html>