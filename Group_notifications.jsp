<%@page import="com.login.Student"%>
<%@page import="com.login.Weekly_log"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.login.QueriesDao"%>
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
                <li >
                        <a class="nav-link" href="Student_info.jsp">
                            <i class="nc-icon nc-notes"></i>
                            <p>Info for students</p>
                        </a>
                    </li>
                    <li class="nav-item active">
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
                             


<u><h2 style="color:#000099">Weekly Log Notifications :</h2></u>
<ul>
<% 
	QueriesDao qdao=new QueriesDao();
	Integer grp_id=(Integer)session.getAttribute("Student_group");
	Integer week_num=qdao.Week_no();
	
	System.out.println(grp_id + week_num);
	ArrayList<Weekly_log>weeks= qdao.Group_notification_guide(grp_id,week_num );

	for(int i=0;i<weeks.size();i++)
	{
		Weekly_log week_obj=new Weekly_log();
		week_obj=weeks.get(i);
		System.out.println("hiiie");
		
	%>
	<li><h4>	Your Group Weekly log For Week <%=week_obj.getWeek_no() %> is scheduled on <%=week_obj.getDate_of_log() %></h4></li><br><br>
	<%
	}
	
	if(weeks.size()==0)
	{
%>
	<li><h4> Your Group Weekly log for Week <%=week_num %> has not been scheduled yet by your guide   </h4></li><br><br>
<%
	}

%>

</ul>

<br><br><br>
<u><h2 style="color:#000099"> Student Details Notification : </h2></u>
<ul>
<% 
	qdao.Group_home(request, grp_id);
	ArrayList<Student>students= (ArrayList<Student>)session.getAttribute("student_array");
	
	Integer countstu=0;
	for(int i=0;i<students.size();i++)
	{
		Student stu_obj=new Student();
		stu_obj=students.get(i);
		
		if(stu_obj.getStudentname()==null)
		{
			countstu++;
%>			
			
		<li><h4>Student <%=stu_obj.getStudentId()%> your personal details are incomplete kindly update your details</h4></li>
	
<% 	
		}
	}


%>

</ul>
<% 
 if(countstu==0)
 {
%>	 
	<h4>All Student Details are updated</h4><b><br>
<% 	 
 }

%>




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

