<%@page import="com.login.Group"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.login.QueriesDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<style>

body {
  height: 100%;
}

body {
  margin: 0;
  background: linear-gradient(45deg, #99d6ff, #003d66);
  font-family: sans-serif;
  font-weight: 100;
}

.container {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

table {
border-radius:5px;
  width: 800px;
  border-collapse: collapse;
  overflow: hidden;
  box-shadow: 0 0 20px rgba(0,0,0,0.1);
}

th,
td {
  padding: 15px;
  background-color: #141452;
  color: #fff;
}

th {
  text-align: left;
}

thead {
  th {
    background-color: #00bfff;
  }
}

tbody {
  tr {
    &:hover {
      background-color: rgba(255,255,255,0.3);
    }
  }
  td {
    position: relative;
    &:hover {
      &:before {
        content: "";
        position: absolute;
        left: 0;
        right: 0;
        top: -9999px;
        bottom: -9999px;
        background-color: #59b1f0;
        z-index: -1;
      }
    }
  }
}
</style>

<head>
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">




    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="assets/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/light-bootstrap-dashboard.css?v=2.0.0 " rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="assets/css/demo.css" rel="stylesheet" />
</head>

<body>

        
    <div class="wrapper">
        <div class="sidebar" data-image="assets/img/sidebar-4.jpg" data-color="blue">
            <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

        Tip 2: you can also add an image using data-image tag
    -->
            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="javascript:;" class="simple-text">
                      Project Review System
                    </a>
                </div>
                <ul class="nav">
                <li class="nav-item active">
                        <a class="nav-link" href="Co-ordinator_info.jsp">
                            <i class="nc-icon nc-badge"></i>
                            <p>All Groups info</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="Co-ordinator_select_date.jsp">
                            <i class="nc-icon nc-icon nc-align-center"></i>
                            <p>Select Date</p>
                        </a>
                    </li> 
                    <li>
                        <a class="nav-link" href="Co_ordinator_alter_staff.jsp">
                            <i class="nc-icon nc-icon nc-notes"></i>
                            <p>Staff</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="Co_ordinator_alter_group.jsp">
                            <i class="nc-icon nc-icon nc-notes"></i>
                            <p>Groups</p>
                        </a>
                    </li>
                     <li  >
                        <a class="nav-link" href="Co-ordinator_weekly_log.jsp">
                            <i class="nc-icon nc-icon nc-notes"></i>
                            <p>Weekly Logs</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg " color-on-scroll="500">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#pablo">Co-ordinator</a>
                    <button href="" class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navigation">
                        <ul class="nav navbar-nav mr-auto">
                            
                        </ul>
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="#pablo">
                                    <span class="no-icon"><b>Welcome <%=session.getAttribute("staff_name") %></b></span>
                                </a>
                            </li>
                            
                            <li class="nav-item">
                                <a class="nav-link" href="Logout">
                                    <span class="no-icon">Log out</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- End Navbar -->
  
  
            
            
            
            
            
            <div class="content">
                <div class="container-fluid">
                    <div class="section">
                             
<%
	QueriesDao qdao=new QueriesDao();
	ArrayList<Group> groups= qdao.Groups_under_Co_ordinator();
	Float total=qdao.Co_ordinator_complete_groups();
%>


<h1 ><center>GROUP INFORMATION </center></h1>

<br><br>
<h3 style="color:white">Groups with complete information</h3>
<div style="width:60% ;border:solid;height:44px;border-width:4px" class="w3-light-grey w3-round-xlarge"> 
    <div class="w3-container w3-blue w3-round-xlarge" style=" width:<%=total %>%;height:36px ;border-radius:10px"><font style="color:black" size="5px"><%=total %>% Complete</font></div>
 
  </div>
&nbsp;*Shows you percentage of groups that have filled out their information

<br><br>


<font size="5" style="color:white">Groups with ID and Student Names</b></font>

  <table>
    <thead>
      <tr style="background-color:black">
        <th>GROUP ID</th>
        <th>PROBLEM STATEMENT</th>
        <th>PROJECT AREA</th>
        <th>PROJECT PLATFORM</th>
        <th>GUIDE ID</th>
        <th>REVIEWER ID</th>
      </tr>
    </thead>
    <tbody>
    
    <% 
    	for(int i=0;i<groups.size();i++)
    	{
    		Group grp_obj=new Group();
    		grp_obj=groups.get(i);
    %>	
    <tr>
    	<td><%=grp_obj.getGroup_id()  %></td>
    	<%if(grp_obj.getProblem_title()!=null) 
    	{
    		%>
    	<td><%=grp_obj.getProblem_title()  %></td>
    	<% }
    	else 
    	{
    	%>	
    	<td>N/A</td>
    	<% 	
    	}
    	%>
    	<%if(grp_obj.getProj_area()!=null) 
    	{
    		%>
    	<td><%=grp_obj.getProj_area()  %></td>
    	<%}
    	else 
    	{
    	%>	
    	<td>N/A</td>
    	<% 	
    	}
    	%>
    	<%if(grp_obj.getProject_platform()!=null) 
    	{
    		%>
    	<td><%=grp_obj.getProject_platform()  %></td>
    	<%}
    	else 	
    	{
    	%>	
    	<td>N/A</td>
    	<% 	
    	}
    	%>
    	<td><%=grp_obj.getGuide_id()  %></td>
    	<td><%=grp_obj.getReviewer_id()  %></td>
    </tr>
    <% 
    	}
    %>
      
    </tbody>
  </table>
  
  * N/A is entered whenever the information hasnt been enterd by a group


                    </div>
                </div>
            </div>
            <footer class="footer">
                <div class="container-fluid">
                    <nav>
                        <ul class="footer-menu">
                            <li>
                                <a href="#">
                                    Home
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Company
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Portfolio
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Blog
                                </a>
                            </li>
                        </ul>
                        
                    </nav>
                </div>
            </footer>
        </div>
    </div>

</body>
<!--   Core JS Files   -->
<script src="assets/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="assets/js/plugins/bootstrap-switch.js"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!--  Chartist Plugin  -->
<script src="assets/js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->
<script src="assets/js/light-bootstrap-dashboard.js?v=2.0.0 " type="text/javascript"></script>
<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
<script src="../assets/js/demo.js"></script>

</html>
