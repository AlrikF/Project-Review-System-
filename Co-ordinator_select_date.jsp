<%@page import="com.login.Weekly_date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.login.QueriesDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<style>
#ip1 {
    border-radius: 8px;
  }

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
  height: 410px;
  width: 500px;
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
                        <a class="nav-link" href="Co-ordinator_info.jsp">
                            <i class="nc-icon nc-badge"></i>
                            <p>All Groups info</p>
                        </a>
                    </li>
                    <li class="nav-item active">
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


<h1><center>Week Duration for weekly log</center></h1>

<h3>All weeks</h3><br>
<table>
<thead>
<tr>
<th>Week Number</th>
<th>From date</th>
<th>To date  </th>
</tr>
</thead>
<tbody>
<%
	QueriesDao qdao=new QueriesDao();
	ArrayList<Weekly_date> weeks=qdao.Display_weekly_dates();
	for(int i=0;i<weeks.size();i++)
	{
		Weekly_date week_obj=new Weekly_date();
		week_obj=weeks.get(i);
%>
	<tr>
	<td><%=week_obj.getWeek_no() %> </td>
	<td><%=week_obj.getFrom_date() %></td>
	<td><%=week_obj.getTo_date() %></td>
	</tr>	
<% 		
	}

%>
</tbody>


</table>  
* Shows duration of each weekly log that shall be notified to the guide for weekly log                   
                    
<br><br>                                             
<font size="5"><b>Select The Date Interval</b></font><br>
<br>
<div class="card">
  <div class="container">
    <h3 align="center"><b>Select Date</b></h3> 
    <h4>

<font size="3">

<script type="text/javascript">

function validateForm()
{
	var wn=document.list.Week_no.value;
	var fd=document.list.from_date.value;
	var td=document.list.to_date.value;
	
	if(wn=="")
		{
			alert("wn")
		}
	else if(fd=="fd")
		{
		alert("rt")
		}
	else if (td=="td") 
		{
		alert("td")
		}
	return false
	
}

</script>







<form action="Form_submit" method="post">
  You want Review to be done <br>

  
  Week_no :<input id="ip1" type="text" name="Week_no"><br><br>
  From&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    :<input id="ip1" type="date" name="from_date"><br><br>
  To&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      :<input id="ip1" type="date" name="to_date"><br><br>
  
  <button class="button button1" onclick="return validateForm()" name="button" value="Co-ordinator_select_date"> Add week</button><br><br>
 <!--    <input type="submit" name="button" value="Co-ordinator_select_date">-->
</form> 

</font>
    </h4> 
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
<script src="assets/js/demo.js"></script>

</html>
