<%@page import="com.jdbc.task.dao.TaskDaoImpl"%>
<%@page import="com.jdbc.task.dao.UserDaoImpl"%>
<%@page import="com.jdbc.task.dao.ITaskDao"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.jdbc.task.entity.Task"%>
<%@page import="com.jdbc.task.entity.User"%>
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
.text-on-pannel {
  background: #fff none repeat scroll 0 0;
  height: auto;
  margin-left: 55px;
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
	<div class="text-left">
  	<button type="button" class="btn btn-outline-info"><a href="Home.jsp"><i class="fa fa-home"></i> Home</a></button>
  	<button type="button" class="btn btn-outline-info"><a href="getAllTask.jsp"><i class="fa-solid fa-grip"></i> ShowAllTask</a></button>
</div> 
	 
<!--	 <button><h6><a href="getAllTask.jsp" >ShowAllTask</a></h6></button> 
    <button><h6><a href="Home.jsp" >Home</a></h6></button>    -->
<div class="container">
  <div class="panel panel-primary">
    <div class="panel-body">
      <h3 class="text-on-pannel text-dark"><strong class="text-uppercase">Add new task</strong></h3>
 
    <form method="post">
          <fieldset>
			
			Email ID:<br><input type="email" name="email" value = "<%=session.getAttribute("userid") %>" readOnly><br>
			Task Name:<br><input type="text" name="taskName" required><br>
			Start Date:<br><input type="date" name="startDate" required><br>
			End Date:<br><input type="date" name="endDate" required><br>
			Status:<br><select name="status">
						  <option value="YET-TO-START">YET-TO-START</option>
						  
					  </select><br><br>
			<input type="submit" value="Save Record" onclick="callAlert();"><br><br>
			   
		</fieldset>
	</form>
<%
	if(request.getMethod().equals("POST"))
	{ 
		String taskName=request.getParameter("taskName");
		LocalDate startDate=LocalDate.parse(request.getParameter("startDate"));
		LocalDate endDate=LocalDate.parse(request.getParameter("endDate"));
		String status=request.getParameter("status");
		String email = request.getParameter("email");
        boolean isValid = taskName.matches("^[A-Za-z][A-Za-z ]*$");
        LocalDate date = LocalDate.now();
       if(!isValid)   
        {
       		out.println("<div class=\"alert alert-danger\" role=\"alert\">");
		out.println("TaskName should not contain any special characters or numbers!!");
		out.println("</div>");
        }
        else if((startDate.isAfter(date)|| startDate.isEqual(date)) && startDate.isBefore(endDate)){
			Task t=new Task();
			t.setTaskName(taskName);
			t.setStartDate(startDate);
			t.setEndDate(endDate);
			t.setStatus(status);
			t.setEmail(email);
			ITaskDao tDao=new TaskDaoImpl();
			//tDao.addTask(t);
			boolean result = tDao.addTask(t);
			if(result)
			{
				tDao.sendEmailNotification(email, taskName, startDate, endDate);
				response.sendRedirect("getAllTask.jsp");
			}
			else
				out.print("<h3 style='color:red'>Please Check the details Entered!!!<h3>");	
		}
		else{

		out.println("<div class=\"alert alert-danger\" role=\"alert\">");
		out.println("<h3 style='color:red'>Start date must be the current date or greater than current date!!...<h3>");
		out.println("</div>");
		} 
	}
		
	/*	if(isValid)
        {	
           	if((startDate.isAfter(date)|| startDate.isEqual(date)) && startDate.isBefore(endDate))
			{
			Task t=new Task();
			t.setTaskName(taskName);
			t.setStartDate(startDate);
			t.setEndDate(endDate);
			t.setStatus(status);
			t.setEmail(email);
			ITaskDao tDao=new TaskDaoImpl();
			boolean result = tDao.addTask(t);
			  
			  
			  
			  
			if(result)
			{
				tDao.sendEmailNotification(email, taskName, startDate, endDate);
				response.sendRedirect("getAllTask.jsp");
			}
		}
		else
		{
			 out.print("<h3 style='color:red'>Start date must be the current date or greater than current date!!!...<h3>"); 
		}
}
else
{
	out.print("<h3 style='color:red'>Task Name Should not contain any numbers/specialcharcters !!!<h3>");
	
}
	} */
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
	function callAlert()
	{
		Swal{
	        title: "Are you sure?",
	        text: "You wont be able to revert this!",
	        icon: "warning",
	        showCancelButton: true,
	        confirmButtonText: "Yes, delete it!",
	        cancelButtonText: "No, cancel!",
	        reverseButtons: true
	    }.then(function(result) {
	        if (result.value) {
	         
	       return Swal(
	                "Added!",
	                "Your Task has been Added.",
	                "success"
	            )
	            // result.dismiss can be "cancel", "overlay",
	            // "close", and "timer"
	        } else if (result.dismiss == "taskName== '' && startDate== '' && endDate == '' && status==''") {
	           
	        	return Swal(
	                "error",
	                "please check the details :)",
	                "error"
	            )
	        }
	    
	}
	
		
		
		
	/*	if (taskName!= '' && startDate!= '' && endDate != '' && status!='')
			{
			if (taskName.matches("^[A-Za-z][A-Za-z0-9 ]*$")) {
				if ((startDate.isAfter(date)|| startDate.isEqual(date)) && startDate.isBefore(endDate)) {
				if (status!='') {
				alert("All type of validation has done on OnSubmit event.");
				return true;
				} else {
				alert("Task Name is invalid.....");
				return false;
				}
				} else {
				alert("You must select start Date and end Date.....!");
				return false;
				}
				} else {
				alert("status should not be empty...!!!");
				return false;
				}
				} else {
				alert("All fields are required.....!");
				return false;
				}    */
		
	}
</script>
</html>