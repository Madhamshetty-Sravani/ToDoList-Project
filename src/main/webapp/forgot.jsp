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
	<div class="container-fluid back-img text-center text-dark"><br>
		
		
		<form method="post"  align="center"><br><br><br>
	Enter the User ID:<input type="text" name="userid" required><br><br>
	<input type="submit" value="Click here"><br><br>
	</form>


<%
	if(request.getMethod().equals("POST"))
	{
		String userid=request.getParameter("userid");
		UserDaoImpl uDao=new UserDaoImpl();
		Boolean status = uDao.ValidateUserName(userid);
		if(status){
			response.sendRedirect("newpass.jsp?userid="+userid);
		}else
		out.print("<h3 style='color:red'>Invalid Username!! Please Enter Valid Username!!</h3>");
	}
%>
	</div>

	<div class="container-fluid bg-primary p-3">
		<h5 class="text-white text-center">Developed and Designed by
			Tech4All student team: Sravani, Sneha, Anjali, Bhargavi, Nishath</h5>
	</div>

</body>
</html>