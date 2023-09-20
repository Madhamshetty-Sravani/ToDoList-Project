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
h3{
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
		 <h2><b>For any Technical issues please contact us at......</h2><br><br><br>
     <h2> E-mail ID:sravani64862@gmail.com</h2>
      <h2> Mobile No:7385648620</h2>
    </b>   
	</div>

	<div class="container-fluid bg-primary p-3">
		<h5 class="text-white text-center">Developed and Designed by
			Tech4All student team: Sravani, Sneha, Anjali, Bhargavi, Nishath</h5>
	</div>


</body>
</html>