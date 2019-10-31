<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<style>
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


.grid {
  display: grid;
  grid-template-columns: repeat(1, 1fr);
  justify-items: center;
  align-items: center;
  grid-gap: 10px;
}

body {
  font-family: Arial, Helvetica, sans-serif;
  font-color:black;
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  height: 900px;
  width: 1000px;
  border-radius: 5px;
  color:black;
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

img {
  border-radius: 5px 5px 0 0;
}

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
                    <li  >
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
<font size="5"><b>Guidlines for Guides:</b></font>
<div class="card">
  <div class="container">
    <h3 align="center"><b>Guidelines</b></h3> 
<h5>
        1) The Head of the department/Project coordinator shall constitute a review committee for project group; project guide would be one member of that committee by default.<br><br><br>
        2) There shall be two reviews in Project phase -I in semester-I by the review committee.<br><br>
        3) The Project Review committee will be responsible for evaluating the timely progress of the projects.<br><br><br>
        4) As far as possible Students should finalize the same project title taken for Project Based Seminar (PBS).<br><br><br>
        5) Student should Identify Project of enough complexity, which has at least 4-5 major functionalities.<br><br><br>
        6) Student should identify stakeholders, actors and write detail problem statement for system.<br><br><br>
        7) Review committee should revisit "Feasibility Review" conducted by Examiners during Oral examination in Third year in first week after commencement of the term.<br><br><br>
        8) Review committee should finalize the scope of the project.<br><br><br>
        9) If change in project topic is unavoidable then the students should complete the process of Project approval by submitting synopsis along with the review of important papers.<br><br><br>
        10)This new Project topic should be approved by review committee.<br><br><br>
        12) The students or project group shall make presentation on the progress made by them before the committee.<br><br><br>
        13) The record of the remarks/suggestions of the review committee should be properly maintained and should be made available at the time of examination.<br><br><br>
        14) Each student/group is required to give presentation as part of review for 10 to 15 minutes followed by a detailed discussion.<br><br><br>
        15) Students should Revisit and Reassess the problem statement mentioned in the project- based seminar activity.<br>
</h5> 
</div>
<br>
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
