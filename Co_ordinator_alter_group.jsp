
<!DOCTYPE html>
<%@page import="com.login.Staff"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.login.QueriesDao"%>
<html lang="en">

<style>
#ip1 {
    border-radius: 8px;
  }

table {
  border-radius: 8px;
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

.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  height: 800px;
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
  height: 750px;
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
                    <li>
                        <a class="nav-link" href="Co_ordinator_alter_staff.jsp">
                            <i class="nc-icon nc-icon nc-notes"></i>
                            <p>Staff</p>
                        </a>
                    </li>
                    <li class="nav-item active">
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
                        <h1 align="left"><b><center>Group wise all Student Information</center></b></h1>

<h3 align="left"><b> All Student Information</b></h3>

<table>
<thead><tr><th>Group ID</th><th>RollNo</th><th>Student name</th><th>Problem Title</th><th>Guide ID</th><th>Reviewer ID</th></tr></thead>
<% 
	//QueriesDao qdao=new QueriesDao();
	//qdao.Co_ordinator_view_student_and_group(response);

	
String db_url="jdbc:mysql://localhost:3306/";
	
	String db_name="mini_project";
	String db_user="root";
	String db_password="";
	String view_student_and_group="Select student.roll_no,student.stu_name,student.Group_id,group_info.Problem_title,group_info.Guide_id,group_info.Reviewer_id from student,group_info where group_info.grp_id=student.Group_id";
		try 
		{
		
			System.out.println("Inside view student and group ");
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection(db_url+db_name,db_user,db_password);
			PreparedStatement statement=connection.prepareStatement(view_student_and_group);
			
			ResultSet rs= statement.executeQuery();
		//	PrintWriter outt=response.getWriter();
		
			//outt.write("<thead><tr><th>RollNo</th><th>Student name</th><th>Group ID</th><th>Problem Title</th><th>Guide ID</th><th>Reviewer ID</th></tr></thead>" );
			while(rs.next())
			{
				out.write("<tr>");
				out.write("<td>");
				out.write(rs.getString(3));
				out.write("</td>");
				
				out.write("<td>");
				out.write(rs.getString(1));
				out.write("</td>");
				out.write("<td>");
				if(rs.getString(2)!=null)
					out.write(rs.getString(2));
				else
					out.write("Name not entered");	
				out.write("</td>");
				
				out.write("<td>");
				if(rs.getString(4)!=null)
					out.write(rs.getString(4));
				else
					out.write("Problem title not entered");
				out.write("</td>");
				out.write("<td>");
				if(rs.getString(5)!=null)
					out.write(rs.getString(5));
				else
					out.write("No guide alloted");
				out.write("</td>");
				out.write("<td>");
				if(rs.getString(6)!=null)
					out.write(rs.getString(6));
				else
					out.write("No reviewer alloted");
				out.write("</td>");
				out.write("</tr>");
			}
			
			
		}
		catch (Exception e) {
			// TODO: handle exception
		}
%>
</table>
<br><br>

<div class="card1">
  <div class="container">
     <form action="Form_submit" method="post">
     <br>
        <h3>Enter the ID of the Group You want to add:</h3><br>
       
        Group ID &nbsp;&nbsp;&nbsp; :
        <input id="ip1" type="text" name="Group_id" placeholder="ID of the Group"><br><br><br>
        
        Student 1  &nbsp;&nbsp;&nbsp;:
        <input id="ip1" type="text" name="student1_id" placeholder="ID of Student1"><br><br><br>
        Student 2  &nbsp;&nbsp;&nbsp;:
        <input id="ip1" type="text" name="student2_id" placeholder="ID of Student2"><br><br><br>
        Student 3  &nbsp;&nbsp;&nbsp;:
        <input id="ip1" type="text" name="student3_id" placeholder="ID of Student3"><br><br><br>
        Student 4  &nbsp;&nbsp;&nbsp;:
        <input id="ip1" type="text" name="student4_id" placeholder="ID of Student4"><br><br><br>
        
        Reviewer Id : 
     <!--<input type="text" name="rev_id" placeholder="ID of Reviewer"><br><br><br>-->
        <select id="ip1" name="rev_id">
        <%
        	QueriesDao qdao=new QueriesDao();
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
        
        Guide Id &nbsp;&nbsp;&nbsp;&nbsp;  :
   <!--      <input type="text" name="guide_id" placeholder="ID of Guide"><br><br><br>-->
        
        <select id="ip1" name="guide_id">
        <%
        	
        	ArrayList<Staff> staf=qdao.Co_ordinator_all_guide();
        	for(int i=0;i<sta.size();i++)
        	{
        		Staff staff_obj=new Staff();
        		staff_obj=staf.get(i);
        %>
        	<option><%=staff_obj.getStaff_id() %>		
        		
  		<%
        	}
        %>
        
        </select><br><br>
        
        
        <button class="button button1" name="button" value="Add the group" >Add</button>
        
        
        
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
