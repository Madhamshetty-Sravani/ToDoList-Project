<%@page import="com.jdbc.task.dao.TaskDaoImpl"%>
<%@page import="com.jdbc.task.dao.UserDaoImpl"%>
<%@page import="com.jdbc.task.dao.ITaskDao"%>
<%@page import="java.time.LocalDate"%>
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
.text-on-pannel {
  background: #fff none repeat scroll 0 0;
  height: auto;
  margin-left: 60px;
  padding: 3px 5px;
  position: absolute;
  margin-top: -47px;
  border: 1px solid #337ab7;
  border-radius: 8px;
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
</style>

</head>
<body>

	<%@include file="component/topnav2.jsp"%>
	<div class="container-fluid back-img text-center text-dark"><br>
	
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
<div class="container">
  <div class="panel panel-primary">
    <div class="panel-body">
      <h3 class="text-on-pannel text-dark"><strong class="text-uppercase">Update task</strong></h3>
      <form method="post">
		<fieldset>
		
		Email ID:<br><input type="text" name="email" readonly value="<%=request.getParameter("email")%>"><br>
		Task Name:<br><input type="text" name="taskName" readonly value="<%=request.getParameter("taskName")%>"><br>
		Start Date:<br><input type="date" name="startDate" value="<%=request.getParameter("startDt")%>"><br>
		End Date:<br><input type="date" name="endDate" value="<%=request.getParameter("endDt")%>"><br>
		Status:<br><select name="status">
						  
						  <option value="IN-PROGRESS">IN-PROGRESS</option>
						  <option value="COMPLETED">COMPLETED</option>
					  </select><br><br>
		<input type="submit" value="Update Task" onclick="callAlert()";><br><br>
	<!-- 	<button><h5><a href="Home.jsp">Back</a></h5></button>    -->
		</fieldset>
	</form>
	</body>
</html>	
<%
	if(request.getMethod().equals("POST"))
	{
		String taskName=request.getParameter("taskName");
		String email = request.getParameter("email");
		taskName= java.net.URLDecoder.decode(taskName, "UTF-8");
		LocalDate startDate=LocalDate.parse(request.getParameter("startDate"));
		LocalDate endDate=LocalDate.parse(request.getParameter("endDate"));
		String status=request.getParameter("status");
		LocalDate date = LocalDate.now();
		if(startDate.isBefore(endDate)){
			Task t=new Task();
			t.setTaskName(taskName);
			t.setStartDate(startDate);
			t.setEndDate(endDate);
			t.setEmail(email);
			t.setStatus(status);
			
			ITaskDao tDao=new TaskDaoImpl();
			boolean result = tDao.updateTask(t);
			if(result)
				response.sendRedirect("getAllTask.jsp");
			else
				out.print("<h3 style='color:red'>Please Check the details Entered!!!<h3>");	
		}
		else{
			out.print("<h3 style='color:red'>Please Check the StartDate and EndDates!!!<h3>");
		}
		
	}
%>
    </div>
  </div>
  </div>	
	</div>

	<div class="container-fluid bg-primary p-3">
		<h5 class="text-white text-center">Developed and Designed by
			Tech4All student team: Sravani, Sneha, Anjali, Bhargavi, Nishath</h5>
	</div>
</body>
<script type="text/javascript">
/*	function callAlert()
	{
		swal({
			  title: "Task Updated Successfully!",
			  text: "Good job!",
			  icon: "success",
			  button: "OK",
			});
	}  */
</script>
</html>