<%@page import="com.jdbc.task.dao.TaskDaoImpl"%>
<%@page import="com.jdbc.task.dao.ITaskDao"%>
<%@page import="com.jdbc.task.entity.Task"%>
<%@page import="java.util.List"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%
	String userid = null;
   	session = request.getSession(false);
    if (session != null) {
        if(session.getAttribute("userid") != null) {
        	userid=(String)(session.getAttribute("userid"));
        }
    }  
%>
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

  .but1 {
  background-color: orange;
  border-radius: 50%;
   font-size: 10px;
  padding: 10px;
  float:left;
  color:white;
  margin-left:6px;
  }	
  
   .but2 {
  background-color: #33ccff;
  border-radius: 50%;
  font-size: 10px;
  padding: 10px;
   float:left;
  color:white;
  margin-left:6px;
  }
   .but3 {
  background-color: green;
  border-radius: 50%;
   font-size: 10px;
  padding: 10px;
   float:left;
  color:white;
  margin-left:6px;
  }
  	
      .table-td {
	background-color: red;
	}
	.yet-orange{
	background-color: orange;
	}
	.end-red{
	background-color: red;
	}
	.progress-blue{
	background-color:#33ccff;
	}
	.completed-green{
	background-color: green;
	} 
	
	.contain{
background-color: #d2f0ee;
text-align: center;
margin-top: 5%;
margin-bottom: 0%;
}
	
</style>

</head>
<body>

	<%@include file="component/topnav2.jsp"%>
	<div class="container-fluid back-img text-center text-dark"><br>
	
	
	<div class="text-left">
  	<button type="button" class="btn btn-outline-info"><a href="Home.jsp" ><i class="fa fa-home"></i> Home</a></button>
  	<button type="button" class="btn btn-outline-info"><a href="addTask.jsp"><i class="fa-solid fa-folder-plus"></i>  AddTask</a></button>
</div> 
	
	 <form action="findByTaskName.jsp" method="get">
      <center>Search By TaskName:<input type="text" name="taskName" placeholder="Enter TaskName">	
      <!--<button type="button" class="btn btn-outline-primary btn-sm mb-1">Search</button><br><br> -->
     <button>search</button></center> <br><br>     
       </form>
       <form action="findByTaskName.jsp" method="get">
      <center>Search By Date:<input type="date" name="date" placeholder="Filter by Date">	
  <!--      <button type="button" class="btn btn-outline-primary btn-sm mb-1">Search</button><br><br>  --> 
      <button>search</button></center> <br><br>      
       </form>
       		
  <% 
       
	if(request.getMethod().equals("GET"))
	{
	ITaskDao tDao=new TaskDaoImpl();
	List<Task>list=tDao.getAllTaskByUserID(userid);
	out.print("<center><table align='center'width='70%'border='2px'>");
		
		out.print("<th>Task Name</th>");
		out.print("<th>Start Date</th>");
		out.print("<th>End Date</th>");
		out.print("<th>Status</th>");
		out.print("<th>Email ID</th>");
		out.print("<th>Update</th>");
		out.print("<th>Delete</th>");
		
		
		for(Task t:list)
		{
			String statusColor = "end-red";
			String encodedParameter = java.net.URLEncoder.encode(t.getTaskName(), "UTF-8");
			String email = t.getEmail();
			LocalDate date = LocalDate.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	        String startDate = t.getStartDate().format(formatter);
	        String endDate = t.getEndDate().format(formatter);
			String encodedStartDate = java.net.URLEncoder.encode(startDate, "UTF-8");
			String encodedEndDate = java.net.URLEncoder.encode(endDate, "UTF-8");
			out.print("<tr>");
				out.print("<td>"+t.getTaskName()+"</td>");
				out.print("<td>"+t.getStartDate()+"</td>");
				out.print("<td>"+t.getEndDate()+"</td>");
				if(date.isBefore(t.getStartDate()))
				out.print("<td class=yet-orange>"+t.getStatus()+"</td>");
				else if((date.isEqual(t.getStartDate()) ||date.isAfter(t.getStartDate())) && date.isBefore(t.getEndDate()))
					out.print("<td class=progress-blue>"+t.getStatus()+"</td>");
				else if(date.isAfter(t.getEndDate()) && !t.getStatus().equalsIgnoreCase("COMPLETED"))
					out.print("<td class=end-red>"+t.getStatus()+"</td>");
				else 
					out.print("<td class=completed-green>"+t.getStatus()+"</td>");
				out.print("<td>"+t.getEmail()+"</td>");
				out.print("<td><a href=update.jsp?taskName="+encodedParameter+"&email="+email+"&startDt="+encodedStartDate+"&endDt="+encodedEndDate+">update</a></td>");
				out.print("<td><a href=delete.jsp?taskName="+encodedParameter+"&email="+email+">delete</a></td>");
				
			out.print("</tr>");
		}
		out.print("</table></center><br><br>");
		
		 out.println("<center><button><h5 align='left'><a href=\"Home.jsp\">Back</a></h5></button></center>");
	}
%>
  <div class="div">

<button class="but1 float-left"></button><p class="float-left"> YET TO START<br></p>
<button class="but2 float-left"></button><p class="float-left"> IN-PROGRESS<br></p>
<button class="but3 float-left"></button><p class="float-left"> COMPLETED<br></p>
</div>
	</div>

	<div class="container-fluid bg-primary p-3">
		<h5 class="text-white text-center">Developed and Designed by
			Tech4All student team: Sravani, Sneha, Anjali, Bhargavi, Nishath</h5>
	</div>
</body>
<script type="text/javascript">
	function callAlert()
	{
		var res=confirm("Are u sure to delete?");
		if(res==false)
			{
				event.preventDefault();
			}
	}
</script>
</html>