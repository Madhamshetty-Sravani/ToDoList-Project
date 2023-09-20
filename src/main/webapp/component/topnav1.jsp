<%@page import="com.jdbc.task.entity.User"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	<a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-list-check"></i> ToDoList</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
	<!-- 	<li class="nav-item active"><a class="nav-link" href="Home.jsp"><i class="fa-solid fa-house"></i> Home
					<span class="sr-only">(current)</span>
			</a></li>    -->	
			<li class="nav-item active"><a class="nav-link" href="About.jsp"><i
					class="fa-regular fa-calendar-plus"></i>About Us</a></li>

			<li class="nav-item active"><a class="nav-link" href="contactUs.jsp">
					<i class="fa-solid fa-address-book"></i>Contact Us</a></li>
		</ul>
		<%
			User user1=(User)session.getAttribute("username");
		if(user1==null){
		%>
		<form class="form-inline my-2 my-lg-0 float-right">
			<a href="login.jsp" class="btn btn-success  mt-3 float-right"> <i class="fa-regular fa-user"></i>  Login</a>
			 <a href="Register.jsp" class="btn btn-danger ml-2 mt-3 float-right"> Register</a>
		</form>
		<%
		}else{
		%>
			<form class="form-inline my-2 my-lg-0">
				<button class="btn btn-success"><%=user1.getUsername()%></button>
			</form>	
		
		<form class="form-inline my-2 my-lg-0 float-right">
		<a href="logout.jsp" class="btn btn-danger btn-lg" type="button" value="Logout" >
      <span class="glyphicon glyphicon-log-out"></span> Log out
    </a>
	</form>
	    <%
		}
		%>
		
	</div>
</nav>