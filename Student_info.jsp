<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html lang="en">

<style>
<style>
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
  height: 180px;
  width: 190px;
  border-radius: 5px;
  color:rgb(211,211,211);
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

img {
  border-radius: 5px 5px 0 0;
}

</style>
<style>
  .wrap-collabsible {
  margin-bottom: 1.2rem 0;
}

input[type='checkbox'] {
  display: none;
}

.lbl-toggle {
  display: block;

  font-weight: bold;
  font-family: monospace;
  font-size: 1.2rem;
  text-transform: uppercase;
  text-align: center;

  padding: 1rem;

  color: #c6cccd;
  background: #073d63;

 
  border-radius: 7px;
  transition: all 0.25s ease-out;
}

.lbl-toggle:hover {
  color:#c6cccd ;
}

.lbl-toggle::before {
  content: ' ';
  display: inline-block;

  border-top: 10px solid transparent;
  border-bottom: 10px solid transparent;
  border-left: 10px solid currentColor;
  vertical-align: middle;
  margin-right: .7rem;
  transform: translateY(-2px);

  transition: transform .2s ease-out;
}

.toggle:checked + .lbl-toggle::before {
  transform: rotate(90deg) translateX(-3px);
}


.collapsible-content {
  max-height: 0px;
  overflow: hidden;
  transition: max-height .25s ease-in-out;
}

.toggle:checked + .lbl-toggle + .collapsible-content {
  max-height: 350px;
}

.toggle:checked + .lbl-toggle {
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}

.collapsible-content .content-inner {
  background: #eeeeec;
  border-bottom: 1px solid rgba(250, 224, 66, .45);
  border-bottom-left-radius: 20px;
  border-bottom-right-radius: 20px;
  padding: .5rem 1rem;
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
        <div class="sidebar" data-image="assets/img/sidebar-1.jpg" data-color="blue">
            <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

        Tip 2: you can also add an image using data-image tag
    -->
            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="javascript:;" class="simple-text">
                      Project Based Seminar
                    </a>
                </div>
                <ul class="nav">
                <li class="nav-item active">
                        <a class="nav-link" href="Student_info.jsp">
                            <i class="nc-icon nc-notes"></i>
                            <p>Info for students</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="Group_notifications.jsp">
                            <i class="nc-icon nc-icon nc-bell-55"></i>
                            <p>Notifications</p>
                        </a>
                    </li>
                    
                    <li>
                        <a class="nav-link" href="Group_upload_details.jsp">
                            <i class="nc-icon nc-icon nc-single-02"></i>
                            <p>Upload Group Details</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="student_upload1.jsp">
                            <i class="nc-icon nc-icon nc-paper-2"></i>
                            <p>Review one upload</p>
                        </a>
                    </li>
                   <li>
                        <a class="nav-link" href="student_upload2.jsp">
                            <i class="nc-icon nc-icon nc-paper-2"></i>
                            <p>Review two upload</p>
                        </a>
                    </li> 
                    <li>
                        <a class="nav-link" href="Student_see_comments.jsp">
                            <i class="nc-icon nc-icon nc-single-copy-04"></i>
                            <p>See comments</p>
                        </a>
                        </li>
                </ul>
            </div>
        </div>
        <div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg " color-on-scroll="500">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#pablo">Group<%=session.getAttribute("Group_no") %></a>
                   
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
                             




 <div class="wrap-collabsible">
  <input id="collapsible" class="toggle" type="checkbox">
  <label for="collapsible" class="lbl-toggle">Guidlines for Students:</label>
  <div class="collapsible-content">
    <div class="content-inner">
      
        1. The Head of the department/Project coordinator shall constitute a review committee for project group, project guide would be one member<br> 
        &nbsp;&nbsp;&nbsp;  of that committee by default.<br>
        2. There shall be two reviews in Project phase-I in semester-I by the review committee.<br>
        3. The Project Review committee will be responsible for evaluating the timely progress of the projects.<br>
        4. As far as possible Students should finalize the same project title taken for Project Based Seminar (PBS).<br>
        5. Student should Identify Project of enough complexity, which has at least 4-5 major functionalities<br>
        6. Student should identify stakeholders, actors and write detail problem statement for system<br>
        7. Review committee should revisit "Feasibility Review" conducted by Examiners during Oral examination in third year. <br>
        8. Review committee should finalize the scope of the project.<br>
        9. If change in project topic is unavoidable then the students should complete the process of project approval by submitting synopsis along  with the <br>
        &nbsp;&nbsp;&nbsp; review of important papers. This new project topic should be approved by review committee.<br>
        10. The students or project group shall make presentation on the progress made by them before the committee.<br>
        11. The record of the remarks/suggestions of the review committee should be properly maintained and should be made available at the time of examination.<br>
        12. Each student/group is required to give presentation as part of review for 10 to 15 minutes followed by a detailed discussion.<br>
        13. Students should Revisit and Reassess the problem statement mentioned in the project- based seminar activity.<br>
      </font>
    </div>
  </div>
</div>
<br>
<div class="wrap-collabsible">
  <input id="collapsibl" class="toggle" type="checkbox">
  <label for="collapsibl" class="lbl-toggle">Rules And Regulations</label>
  <div class="collapsible-content">
    <div class="content-inner">
     <font>
  1.  All students must enter the correct information in the work book.<br>
  2.  All the entries in the project work book must be verified by the concerned project guide.<br>
  3.  Students must report to their respective guide on project day as per the time table.<br>
  4.  Activities of the project work should be completed as per the project plan only.<br>
  5.  Project group must submit soft copies of Project Abstract, Project Report and Publications in PDF format only.<br>
  6.  Project group members submit two hard copies of Project Report in the format provided by department.<br>
  7.  Project work book must be brought at the time of Project Reviews & Project Examination.<br>
  8.  Any changes, if any, must be countersigned by the concerned project guide.<br>
  9.  For project reviews and project examination, all students must report 15 minutes before the scheduled time.<br>
  10. For any query, concerned guide should be consulted.<br>
</font>
      </pre>
    </div>
  </div>
  <br>
</div><div class="wrap-collabsible">
  <input id="collapsib" class="toggle" type="checkbox">
  <label for="collapsib" class="lbl-toggle">Review overviews</label>
  <div class="collapsible-content">
    <div class="content-inner">
      <font>
        <b>Review 1:: Synopsis</b><br>
          Deliverables:<br>
          1. The precise problem statement/title based on literature survey and feasibility study.<br>
          2. Purpose, objectives and scope of the project.<br>
          3. List of required hardware, software or other equipment for executing the  project, test Environment/tools, cost and human efforts in hours.
          4. System overview- proposed system and proposed outcomes.<br>
          5. Architecture and initial phase of design (DFD).<br>
          6. Project plan 1.0.<br><br>

        <b>Review 2:: SRS</b>    <br>
           Deliverables:<br>
        1. SRS and High level design<br>
        2. Detail architecture/System design/algorithms/techniques<br>
        3. At least 30-40% coding documentation with at least 3 to 4 working modules<br>
        4. Test Results<br>
        5. Project plan 2.0<br>
        One paper should be published in reputed International conference/International journal based on project work done.<br>
   </font> 
    </div>
  </div>
</div>
<p><font size="5">Click on the image to download the undertaking for the students</font><p>
<a href="assets/img/undertaking.pdf" download>
  <img src="assets/img/download.jpg" alt="Undertaking" width="142" height="142">
</a>
<br>
<p><font size="5">Click on the image to download the format of abstract to get your work done quickly!!</font><p>
<a href="assets/img/abs.pdf" download>
  <img src="assets/img/download.jpg" alt="Undertaking" width="142" height="142">
</a>



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

