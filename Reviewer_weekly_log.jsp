
<%@page import="com.login.Weekly_log"%>
<%@page import="com.login.group_review1"%>
<%@page import="com.login.QueriesDao"%>
<%@page import="com.login.Student"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
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
/*table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}*/
</style>


<head>
<head>
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
    <link href="../assets/css/demo.css" rel="stylesheet" />
</head>
</head>
<body>
   <div class="wrapper">
        <div class="sidebar" data-image="assets/img/sidebar-2.jpg" data-color="blue">
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
                <li >
                        <a class="nav-link" href="Rev1marks.jsp">
                            <i class="nc-icon nc-icon nc-single-02"></i>
                            <p>Evaluate Students</p>
                        </a>
                    </li>
                
                
                <li class="nav-item active" >
                        <a class="nav-link" href="Reviewer_weekly_log.jsp">
                            <i class="nc-icon nc-icon nc-paper-2"></i>
                            <p>Weekly log Report</p>
                        </a>
                    </li>
                   <li  >
                        <a class="nav-link" href="Reviewer_home_new.jsp">
                            <i class="nc-icon nc-icon nc-tap-01"></i>
                            <p>Select a group</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg " color-on-scroll="500">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#pablo">Welcome Reviewer <%=session.getAttribute("Reviewer_logged_in") %></a>
                    
                    <div class="collapse navbar-collapse justify-content-end" id="navigation">
                        <ul class="nav navbar-nav mr-auto">
                           
                          
                        </ul>
                        <ul class="navbar-nav ml-auto">
                            
                           
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
                    
<h2>Group <%=session.getAttribute("Reviewer_grp_id") %> Weekly Log</h2>                    
<table>
<%
	QueriesDao qdao =new QueriesDao();
	ArrayList<Weekly_log> weeks=qdao.Group_Weekly_Log((Integer)session.getAttribute("Reviewer_grp_id"));
	Integer count=0;
	for(int i=0;i<weeks.size();i++)
	{
		Weekly_log week_obj= new Weekly_log();
		week_obj=weeks.get(i);
		count++;
%>	
<tr>
<td><%=week_obj.getWeek_no() %></td>
<td><%=week_obj.getDate_of_log() %></td>
<% if(week_obj.getTopics()==null)
{
%>
<td>Not discussed</td>
<%}
else 
{%>
<td><%=week_obj.getTopics() %></td>
<%} %>
<%if(week_obj.getRemarks()==null){ %>
<td>Not given</td>
<%}
else
{%>
<td><%=week_obj.getRemarks() %></td>
<%} %>
</tr>	
<% 		
	}
%>

<%
	if(count==0)
	{
%>	
<td>Log Report not yet uploaded</td>
	
<% 		
	}
%>
</table>
<br><br><br>
<h2>Abstract :</h2>
<table>
<%

	ArrayList<group_review1> grprev1=qdao.reviewer_acknowledge_upload((Integer)session.getAttribute("Reviewer_grp_id"));
	Integer count1=0;
	for(int i=0;i<grprev1.size();i++)
	{
		group_review1 rev1_obj= new group_review1();
		rev1_obj=grprev1.get(i);
		count1++;
		
%>	

<tr>

<td><a href="<%= rev1_obj.getProject_report()  %>"download>
  Review 1 Deliverables
</a></td>
</tr>

	
<% 		
	}
%>


<%
	if(count1==0)
	{
%>	
<td>Abstract not yet uploaded</td>
	
<% 		
	}
%>
</table>






					</div>
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
<script src="assets/js/demo.js"></script>
</html>