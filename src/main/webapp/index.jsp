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
	background-image: url("images/home bg.jpeg");
	width: 100%;
	height: 80vh;
	background-repeat: no-repeat;
	background-size: cover;
}

@keyframes fadeIn {
  0% { opacity: 0; }
  100% { opacity: 1; }
}
.fade-in-text {
  font-family: Arial;
  font-size: 80px;
  animation: fadeIn 5s;
  font-weight:bold;
}
</style>
</head>
<body>

	<%@include file="component/topnav.jsp"%>
	<div class="container-fluid back-img text-center text-success">
	<div class="fade-in-text">
	<strong><h1 class="font-weight-bold" "display-3">Welcome to ToDoList App</h1></strong>
	</div>	
	</div>
	<div class="container-fluid bg-primary p-3">
		<h5 class="text-white text-center">Developed and Designed by
			Tech4All student team: Sravani, Sneha, Anjali, Bhargavi, Nishath</h5>
	</div>
</body>
</html>