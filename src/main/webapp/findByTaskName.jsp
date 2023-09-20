<%@page import="com.jdbc.task.dao.TaskDaoImpl"%>
<%@page import="com.jdbc.task.dao.ITaskDao"%>
<%@page import="com.jdbc.task.entity.Task"%>
<%@page import="java.util.*"%>
<%@page import="java.time.LocalDate"%>
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
</style>
</head>
<body>

	<%@include file="component/topnav2.jsp"%>
	<div class="container-fluid back-img text-center text-dark"><br>
	<h3>Find By Task Name or Date</h3><br><br>
	
<%
	if(request.getMethod().equals("GET"))
	{
		
	ITaskDao tDao=new TaskDaoImpl();
	String taskName=request.getParameter("taskName");
	String filterDate = request.getParameter("date");
	LocalDate startDate =null;
	if(filterDate != null && !filterDate.isEmpty())
	startDate = LocalDate.parse(filterDate);
	List<Task>list=new ArrayList<>();
	if(taskName == null || taskName.isEmpty())
		list = tDao.FilterByDate(startDate,userid);
	else
		list = tDao.findByTaskName(taskName,userid);
	out.print("<center><table align='center' width='70%'border='2'>");
		out.print("<th>Task Name</th>");
		out.print("<th>Start Date</th>");
		out.print("<th>End Date</th>");
		out.print("<th>Status</th>");
		out.print("<th>Update</th>");
		out.print("<th>Delete</th>");
		
	for(Task t:list)
		{
		String encodedParameter = java.net.URLEncoder.encode(t.getTaskName(), "UTF-8");
			String statusColor = "";
			LocalDate date = LocalDate.now();
			if(date.isBefore(t.getStartDate()))
				statusColor = "yet-orange";
			else if(date.isAfter(t.getEndDate()))
				statusColor = "end-red";
		else statusColor = "progress-blue"; 	
			out.print("<tr>");
				out.print("<td>"+t.getTaskName()+"</td>");
				out.print("<td>"+t.getStartDate()+"</td>");
				out.print("<td>"+t.getEndDate()+"</td>");
				out.print("<td>"+t.getStatus()+"</td>");
				out.print("<td><a href=update.jsp?taskName="+encodedParameter+">update</a></td>");
				out.print("<td><a href=delete.jsp?taskName="+encodedParameter+">delete</a></td>");
			out.print("</tr>");
		}
		out.print("</table></center><br><br>");
	}	   
%>	
		
	</div>

	<div class="container-fluid bg-primary p-3">
		<h5 class="text-white text-center">Developed and Designed by
			Tech4All student team: Sravani, Sneha, Anjali, Bhargavi, Nishath</h5>
	</div>


</body>
</html>