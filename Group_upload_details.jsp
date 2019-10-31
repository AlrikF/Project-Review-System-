<%@page import="com.login.Group"%>
<%@page import="com.login.Student"%>
<%@page import="com.login.Weekly_log"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.login.QueriesDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html lang="en">


<style>

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
  height: 100%;
}


.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  height: 500px;
  width: 900px;
  border-radius: 5px;
  color:rgb(0,0,0);
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

.button {
border-radius: 8px;
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
                <li>
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
                    
                    <li class="nav-item active">
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
                             



<% 
	QueriesDao qdao=new QueriesDao();
	Integer grp_id=(Integer)session.getAttribute("Student_group");
	Integer week_num=qdao.Week_no();
	
%>

<br>
<u><h2 > Student Details: </h2></u>
<table>
<thead><tr><th>Student Id</th><th>Student Name</th><th>Student Email</th></tr></thead>
<% 
	qdao.Group_home(request, grp_id);
	ArrayList<Student>students= (ArrayList<Student>)session.getAttribute("student_array");
	
	Integer countstu=0;
	for(int i=0;i<students.size();i++)
	{
		Student stu_obj=new Student();
		stu_obj=students.get(i);
		
		
%>			
			
		<tr>
		<td><%=stu_obj.getStudentId() %></td>
		<td><%=stu_obj.getStudentname() %></td>
		<td><%=stu_obj.getStudentemail() %></td>
		</tr>
	
<% 	
		
	}


%>

<script>

function validateSForm()
{
	var Sn=document.myform.['Student_name'].value;
	var Se=document.myform.['Student_email'].value;
	
	
	if(Sn=="" || Se=="")
	{
		alert('Please enter all fields')	;
		return false;
	}
	return false;
}

function validateForm()
{
	var pt=document.list1.['Project title'].value;
	var pa=document.list1.['Project Area'].value;
	var pp=document.list1.['Project Platform'].value;
	
	if(pt=="" || pa==""||pp=="")
	{
		alert('Please enter all fields')	;
		return false;
	}
	return false;
}


</script>
</table>
<br><br>
</ul>
<div class="card">
<div class="container">


<form name="myform" onsubmit="return validateSForm()"  action="Form_submit" method="post">
<h2>Update Student Details :</h2>
<h4>Student ID:</h4>
<select name="Student_id">
<% 
	
	for(int i=0;i<students.size();i++)
		{
			Student stu_obj=new Student();
			stu_obj=students.get(i);
%>		
		<option><%=stu_obj.getStudentId() %></option>
<% 
		}
%>
</select>
<h4>Student name:</h4>
<input type="text" name="Student_name">

<h4>Student Email:</h4>
<input type="email" name="Student_email"><br><br>

<button type="submit" class="button" name="button"  value="Update Student">Update Student details</button>
</div></div>

</form>
<form name="list1" onsubmit="return validateForm()"  action="Form_submit" method="post">
<h2> Group Details</h2><br>

<table>
<thead><tr><th>Problem Title</th><th>Project Area</th><th>Project Platform</th></tr></thead>
<% 
	Group group_obj=qdao.display_group(grp_id);
%>
<tr>
<td>	<%=group_obj.getProblem_title() %>  </td>
<td>	<%=group_obj.getProj_area() %>    </td>
<td>	<%=group_obj.getProject_platform() %> </td>
</tr>
</table>
<br><br><br>
<div class=card>
<div class=container>
<h2>Update Group Details</h2>
<h4>Project Title</h4>
<input type="text" name="Project title"><br>

<h4>Project Platform</h4>
<input type="text" name="Project Platform"><br>

<h4>Project Area</h4>
<input type="text" name="Project Area"><br><br>

<button type="submit" class="button"  name="button" value="Update Group">Update Group details</button>
</div></div>
</form>




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

