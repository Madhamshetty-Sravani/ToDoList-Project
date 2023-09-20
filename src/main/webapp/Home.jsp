<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
   <head>
   <title>Welcome...
   </title>
   <%@include file="component/allcss.jsp"%>
   <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
      <style>	 
    *{
	margin: 0%;
	padding: 0%;
	box-sizing: border-box;
	}
	h1
	{
		font-size: 15px;
	}	
		body
		{
			background-position:1px 150px;
			background-image: url("images/to-do-background.jpg");
			background-repeat: no-repeat;
			background-size: 100% auto;
		}
		.fade-in-text {
  font-family: Arial;
  font-size: 150px;
  animation: fadeIn 5s;
  
}
.display-3
{
	margin-top:3px;
	text-shadow: h-shadow v-shadow blur-radius color|none|initial|inherit;
    font-style: oblique;
    text-shadow: 2px 2px #000000;
}


@keyframes fadeIn {
  0% { opacity: 0; }
  100% { opacity: 1; }
}
		
.col{
	background-color:#0275d8;
	 color: #ffffff;
	 padding:18px;
	 font-size:0px;
	 position:sticky;
	 
}
.mySidebar a:hover {
  color: #000000;
  position:fixed;
  }
a:link {
  color: green;
  background-color: transparent;
  text-decoration: none;
}
</style>
	 
<link href="https://stackpath.bootstrapcdn.com/
font-awesome/4.7.8/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="style1.css">
<%
	String username = (String)session.getAttribute("userid");
	username = username.split("@")[0];
%>
</head>
	 <body background="images/to-do-background.jpg"width="1500px" height="844px">
<div class="w3-sidebar w3-bar-block w3-card w3-animate-left" style="display:none" id="mySidebar">
  <button class="w3-bar-item w3-button w3-large"
  onclick="w3_close()">Close &times;</button>
  <a href="addTask.jsp" class="w3-bar-item w3-button">Add Task</a>
  <a href="getAllTask.jsp" class="w3-bar-item w3-button">Show All Tasks</a>  
 
 <!--  <a href="findByTaskName.jsp" class="w3-bar-item w3-button">Find By Task Name or Find By Date</a>   --> 
 <button> <a href="logout.jsp"  class="btn btn-default btn-lg">
 
 
 
          <span class="glyphicon glyphicon-log-out"></span> Log out </a></button>
  
 <!--  <a href="contactUs.jsp" class="w3-bar-item w3-button">Contact Us</a>   --> 
</div>

<div id="main">
<div class="col">
  <button id="openNav" class="w3-button w3-black w3-xlarge" onclick="w3_open()">&#9776;</button>
   <h2>Dash Board</h2>
  <h5><i> Welcome..... <%=username %>!!!</i></h5>
</div>
<script>
function w3_open() {
  document.getElementById("main").style.marginLeft = "25%";
  document.getElementById("mySidebar").style.width = "25%";
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("openNav").style.display = 'none';
}
function w3_close() {
  document.getElementById("main").style.marginLeft = "0%";
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("openNav").style.display = "inline-block";
}
</script>

<div class="container-fluid bg-primary p-3 fixed-bottom">
		<h5 class="text-white text-center">Developed and Designed by
			Tech4All student team: Sravani, Sneha, Anjali, Bhargavi, Nishath</h5>
	</div>
		
 <section class="pb-5 header text-center">
    <div class="container py-0 text-white">
        <header class="py-0">
    <div class="fade-in-text">
  <b><h1 class="display-3">Organise your Task</h1></b>
</div>
            
</body>

</html>

 