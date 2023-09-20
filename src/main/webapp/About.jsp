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
	<div class="container-fluid back-img text-center text-success"><br>
		<h1>
			<b>Welcome to ToDoList App</b><br><br><br>
		</h1>
		<b><h1>The fastest way to get tasks out of your head.</h1></b>
		<h4>Your tasks are automatically sorted into Today, Upcoming, and custom Filter<br> views to help you prioritize your most important work.</h4>
		<h4>Tons of tasks, just one app. With workspaces, your personal, work, and team tasks can all live harmoniously under the same roof. (Sigh of relief).</h4>
	</div>

	<div class="container-fluid bg-primary p-3">
		<h5 class="text-white text-center">Developed and Designed by
			Tech4All student team: Sravani, Sneha, Anjali, Bhargavi, Nishath</h5>
	</div>


</body>
</html>