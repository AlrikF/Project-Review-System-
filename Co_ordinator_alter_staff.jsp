<%@page import="com.login.QueriesDao"%>
<%@page import="com.login.Staff"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<style>
#ip1 {
    border-radius: 8px;
  }


.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  height: 600px;
  width: 700px;
  border-radius: 5px;
 color:rgb(0,0,0);
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}
body {
  height: 100%;
}
.card1 {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  height: 600px;
  width: 700px;
  border-radius: 5px;
  background-color:rgb(255,255,255);
}

.card1:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
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
                    <li>
                        <a class="nav-link" href="Co-ordinator_select_date.jsp">
                            <i class="nc-icon nc-icon nc-align-center"></i>
                            <p>Select Date</p>
                        </a>
                    </li> 
                    <li class="nav-item active">
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
                    
                    <h1><center>All staff information</center></h1>
                        <h3 align="left"><b>Alter Guide</b></h3>

<div class="card">
  <div class="container">
     <form action="Form_submit" method="post">
        <h3>Enter the Name And ID of the Guide You want to add:</h3>
        <input id="ip1" type="text" name="Guide_name" placeholder="Name Of Guide">&emsp;&emsp;<br><br>
        <input id="ip1" type="text" name="Guide_id_add" placeholder="ID of the guide"><br><br>
        <button class="button button1" name="button" value="Add Guide">Add</button><br><br>
        
        <h3>Update the Name And ID of the Guide</h3>
        <br>
        Old guide Id to be Updated:
        <select id="ip1" name="old_guide_id">
        <%
        	QueriesDao qdao =new QueriesDao();
        	ArrayList<Staff> staf=qdao.Co_ordinator_all_guide();
        	for(int i=0;i<staf.size();i++)
        	{
        		Staff staff_obj=new Staff();
        		staff_obj=staf.get(i);
        %>
        	<option><%=staff_obj.getStaff_id() %>	  </option>	
        		
  		<%
        	}
        %>
      
        </select>
        <br><br>
         New guide Id:
        <input id="ip1" type="number" name="new_guide_id" ><br><br>
        
        Guide name :&nbsp;
        <input id="ip1" type="text" name="new_guide_name" ><br><br>
        <button class="button button1" name="button" value="Update Guide">Update Guide</button>
        
<!--      <h3>Warning Deleting a Staff will delete all groups associated </h3>
        <h3>Enter the ID of the Guide You want to Delete:</h3>
       
        <input type="text" name="Guide_id_delete" placeholder="ID of the guide">
        
        <button class="button button1" name="button" value="Delete Guide">Delete</button>
-->
     </form>
</div>
</div>
<h3 align="left"><b>Alter Reviewer</b></h3>
<div class="card">
  <div class="container">
     <form action="Form_submit" method="post">
        <h3>Enter details of new reviewer </h3>
        <input id="ip1" type="text" name="Reviewer_name" placeholder="Name Of Reviewer">&emsp;&emsp;<br><br>
        <input id="ip1" type="text" name="Reviewer_id_add" placeholder="ID of the Reviewer"><br><br>
        <button class="button button1" name="button" value="Add Reviewer"> Add</button><br><br>
        <h3>Update Name And ID of the Reviewer :</h3><br>
        <select id="ip1" name="old_rev_id">
        <%
        	
        	ArrayList<Staff> sta=qdao.Co_ordinator_all_reviewer();
        	for(int i=0;i<sta.size();i++)
        	{
        		Staff staff_obj=new Staff();
        		staff_obj=sta.get(i);
        %>
        	<option><%=staff_obj.getStaff_id() %>		
        		
  		<%
        	}
        %>
        
        </select><br><br>
        New reviewer Id:
        <input id="ip1" type="text" name="new_rev_id" ><br><br>
        
        Reviewer name :
        <input id="ip1" type="text" name="new_rev_name" ><br><br>
       <button class="button button1" name="button" value="Update Reviewer">Update Reviewer</button>
        
        
<!--     <h1>Warning Deleting a Staff will delete all groups associated </h1>
        <h3>Enter the Name And ID of the Reviewer You want to Delete:</h3>
        
        <input type="text" name="Reviewer_id_delete" placeholder="ID of the Reviewer">
        <button class="button button1" name="button" value="Delete Reviewer" >Delete</button>
-->     </form>
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
