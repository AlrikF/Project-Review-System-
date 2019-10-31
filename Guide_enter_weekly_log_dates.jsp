<%@page import="com.login.Weekly_date"%>
<%@page import="com.login.Weekly_log"%>
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
table {
	border-radius: 5px;
  width: 800px;
  border-collapse: collapse;
  overflow: hidden;
  box-shadow: 10px 10px 20px rgba(0,0,0,0.6);
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




.grid {
  display: grid;
  grid-template-columns: repeat(1, 1fr);
  justify-items: center;
  align-items: center;
  grid-gap: 10px;
}

body {
  font-family: Arial, Helvetica, sans-serif;
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  height: 400px;
  width: 700px;
  border-radius: 5px;
  color:rgb(0,0,0);
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

img {
  border-radius: 5px 5px 0 0;
}
.button {
  background-color:  #003153; 
  border: none;
  color: white;
  padding: 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
.button1 {border-radius: 8px;}
</style>
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
                
                   <li >
                        <a class="nav-link" href="guide_info.jsp">
                            <i class="nc-icon nc-notes"></i>
                            <p>Info for Guide</p>
                        </a>
                    </li>

                   <li >
                        <a class="nav-link" href="Guide_enter_weekly_log.jsp">
                            <i class="nc-icon nc-icon nc-paper-2"></i>
                            <p>Weekly log Report</p>
                        </a>
                    </li>
                    
                    <li >
                        <a class="nav-link" href="Guide_notifications.jsp">
                            <i class="nc-icon nc-bell-55"></i>
                            <p>Notifications</p>
                        </a>
                    </li>
                    <li  class="nav-item active">
                        <a class="nav-link" href="Guide_enter_weekly_log_dates.jsp">
                            <i class="nc-icon nc-time-alarm"></i>
                            <p>Set Weekly Log Dates</p>
                        </a>
                    </li>
                    <li  >
                        <a class="nav-link" href="Guide_home_new.jsp">
                            <i class="nc-icon nc-tap-01"></i>
                            <p>Select group</p>
                        </a>
                    </li>
                    
                </ul>
            </div>
        </div>
        <div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg " color-on-scroll="500">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#pablo">Guide</a>
                   
                    <div class="collapse navbar-collapse justify-content-end" id="navigation">
                        <ul class="nav navbar-nav mr-auto">
                            
                            
                        </ul>
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="#pablo">
                                    <span class="no-icon">Welcome Guide <%=session.getAttribute("Guide_id") %></span>
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
	Integer week=qdao.Week_no();
%>




<h2>All Group <%=session.getAttribute("Guide_grp_id")  %> weekly log reports </h2>                    
<table>
<thead>
<tr>
<th>Week Number</th>
<th>Date of Log</th>
<th>Topics </th>
<th>Remarks</th>
</tr>
</thead>

<tbody>
<%
	
	ArrayList<Weekly_log> weeks=qdao.Group_Weekly_Log((Integer)session.getAttribute("Guide_grp_id"));

	for(int i=0;i<weeks.size();i++)
	{
		Weekly_log week_obj=new Weekly_log();
		week_obj=weeks.get(i);
%>	
<tr>	
	<td><%=week_obj.getWeek_no() %>	</td>
	<td><%=week_obj.getDate_of_log() %></td>
	<td><%=week_obj.getTopics() %></td>
	<td><%=week_obj.getRemarks() %></td>	
</tr>
<%
	}

%>

</tbody>
</table>

<h2>Week wise Durations </h2>                    
<table>
<thead><th>Week No<th>From date</th><th>To date</th></thead>
<tbody>



<h4>You are in week <%=week %></h4>

<%
	ArrayList<Weekly_date> weeklistobj=qdao.Co_ordinator_display_date();
	for(int i=0;i<weeklistobj.size();i++)
	{
		Weekly_date week_obj=new Weekly_date();
		week_obj =weeklistobj.get(i);
		if(week_obj.getWeek_no()==week)
		{
			System.out.println(week+1);
%>
	
	<tr>
	
	<td style="color:#ffc61a"><%=week_obj.getWeek_no() %></td>
	<td style="color:#ffc61a"><%=week_obj.getFrom_date() %></td>
	<td style="color:#ffc61a"><%=week_obj.getTo_date() %></td>
	
	</tr>
	<%
		}
		else
		{
%>

<tr>
<td><%=week_obj.getWeek_no() %></td>
<td><%=week_obj.getFrom_date() %></td>
<td><%=week_obj.getTo_date() %></td>
</tr>

<% 
		}	
	}

%>
</tbody>
</table>



<br>
<font size="6"><b> Set Log Report Date for group<%=session.getAttribute("Guide_grp_id") %></b></font><br>
<br>
<div class="card">

  <div class="container">
  
  
 <form action="Form_submit" method="post">
 	<br><h3><b>Week Number</b></h3>
 	<input type="number" name="Week_no">
 	
    <br><h3><b>Enter Date of log report:</b></h3>
    <input type="date" name="date_of_log">
    <br><br>
    <button class="button button1" name="button" value="Guide_set_group_weekly_dates">Set Weekly Log Date </button>
    <button class="button button1">Reset</button>

 </form>   
</div>
</div>


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
