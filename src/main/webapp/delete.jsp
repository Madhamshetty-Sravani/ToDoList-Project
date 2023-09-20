<%@page import="com.jdbc.task.dao.TaskDaoImpl"%>
<%@page import="com.jdbc.task.dao.ITaskDao"%>
<%@page import="com.jdbc.task.entity.Task"%>

<%
	if(request.getMethod().equals("GET"))
	{
	String taskName=request.getParameter("taskName");
	taskName= java.net.URLDecoder.decode(taskName, "UTF-8");
	ITaskDao tDao=new TaskDaoImpl();
	tDao.deleteTask(taskName);
	response.sendRedirect("getAllTask.jsp");
	}
%>