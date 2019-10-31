
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
	border-radius:7px;
  width: 800px;
  border-collapse: collapse;
  overflow: hidden;
  box-shadow: 10px 10px 20px rgba(0,0,0,0.7);
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
    <link href="assets/css/demo.css" rel="stylesheet" />
</head>
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
                        <a class="nav-link" href="Rev1marks.jsp">
                            <i class="nc-icon nc-icon nc-single-02"></i>
                            <p>Evaluate Students</p>
                        </a>
                    </li>
                
                
                <li >
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
                    
<%
	QueriesDao qdao=new QueriesDao();
	Integer no=qdao.No_of_group_members((Integer)session.getAttribute("Reviewer_grp_id"));
	
%>
 <script>
function validateForm()
{
	
	var i;
	
	var id=[document.list.Student_Roll_No1.value,document.list.Student_Roll_No2.value,document.list.Student_Roll_No3.value,document.list.Student_Roll_No4.value];
	var bg=[document.list.bg_and_t1.value,document.list.bg_and_t2.value,document.list.bg_and_t3.value,document.list.bg_and_t4.value];
	var Pj=[document.list.Pj_scope_n_obj1.value, document.list.Pj_scope_n_obj2.value,document.list.Pj_scope_n_obj3.value,document.list.Pj_scope_n_obj4.value];
	var Ls=[document.list.Lit_survey1.value,document.list.Lit_survey2.value,document.list.Lit_survey3.value,document.list.Lit_survey4.value];
	var Pp=[document.list.Proj_plan1.value,document.list.Proj_plan2.value,document.list.Proj_plan3.value,document.list.Proj_plan4.value];
	var Ps=[document.list.Present_skill1.value,document.list.Present_skill2.value,document.list.Present_skill3.value,document.list.Present_skill4.value];
	var Qa=[document.list.QnA1.value,document.list.QnA2.value,document.list.QnA3.value,document.list.QnA4.value];
	var comment=document.list.comment_by_reviewer.value;	
	  // Get the value of the input field with id="group_id"
	  

	  // If x is Not a Number or less than one or greater than 10
	  
	  for (i=0;i<<%=no%>;i++)
	  {
		  if (isNaN(bg[i]) || bg[i]< 1 || bg[i] >4 ) 
		  {
				alert("Enter valid background and topic value between 1")
		  		return false;
		  }
		  else if (isNaN(Pj[i]) || Pj[i]< 1 || Pj[i] >4 ) 
		  {
				alert("Enter Project and scope marks between 1 and 4")
		  		return false;
		  }
		  else if (isNaN(Ls[i]) || Ls[i]< 1 || Ls[i] >5 ) 
		  {
				alert("Enter Literature Survey marks between 1 and 5")
		  		return false;
		  }
		  else if (isNaN(Pp[i]) || Pp[i]< 1 || Pp[i] >4 ) 
		  {
				alert("Enter Project planning marks between 1 and 4")
		  		return false;
		  }
		  else if (isNaN(Ps[i]) || Ps[i]< 1 || Ps[i] >4 ) 
		  {
				alert("Enter Presentation skills marks between 1 and 4")
		  		return false;
		  }
		  else if (isNaN(Qa[i]) || Qa[i]< 1 || Qa[i] >4 ) 
		  {
				alert("Enter Question and answer marks between 1 and 4 ")
		  		return false;
		  }
	  } 
	  
	  if(comment=="")
		{
		  alert("Please enter comments ")
		  return false
		}
	  return true ;
	  
} 
</script>                   
                    
<h2><center>Group <%=session.getAttribute("Reviewer_grp_id") %> Evaluation</center></h2>                    

<h3> <span style="color:green ;">${compMsg}</span></h3>
<form name="list" onsubmit="return validateForm()" action="Form_submit" method="post">
 <br>
      <p><h4>Entry for Student 1:</h4></p>      
     <table>
  <tbody> 
      <tr></tr>
    <td><b>Roll number of the student 1</b></td>
    <th><select name="Student_Roll_No1">          
     
 <%	
 ArrayList<Student> students=(ArrayList)session.getAttribute("student_array");
	Integer i=0;
	if(i<students.size())
	{	
		Student stu_obj=new Student();
		stu_obj=students.get(i);
%>	

 <option> <%= stu_obj.getStudentId()   %>  </option>
	
<%
	i++;
	}
	else
	{
%>
	<option> No member  </option>
<% 		
	}

%>  
 </select> 
 </th>
    <tr></tr>
    <tr></tr>
    <tr></tr>
    </tr>
    <tr>
    <td><b>Background & Topic(4M)</b></td>
    <td><input type="text" name="bg_and_t1" placeholder="Enter Marks" autofocus></td>
    <tr></tr>
    <tr></tr>
    <tr></tr>
    </tr>
    <tr>
    <td><b>project Scope & Objectives(4M)</b></td>
    <td><input type="text" name="Pj_scope_n_obj1" placeholder="Enter Marks" autofocus></td>
    <tr></tr>
    <tr></tr>
    <tr></tr>
    </tr>
    <tr>
    <td><b>Literature Suvey(5M)</b></td>
    <td><input type="text" name="Lit_survey1" placeholder="Enter Marks" autofocus></td>
    <tr></tr>
    <tr></tr>
    <tr></tr>
    </tr>
    <tr>
    <td><b>Project Planning(4M)</b></td>
    <td><input type="text" name="Proj_plan1" placeholder="Enter Marks" autofocus></td>
    <tr></tr>
    <tr></tr>
    <tr></tr>
    </tr>
    <tr>
    <td><b>Presentation Skills(4M)</b></td>
    <td><input type="text" name="Present_skill1" placeholder="Enter Marks" autofocus></td>
    <tr></tr>
    <tr></tr>
    <tr></tr>
    </tr>
    <tr>
    <td><b>Question And Answers(4M)</b></td>
    <td><input type="text" name="QnA1" placeholder="Enter Marks" autofocus></td>
    <tr></tr>
    <tr></tr>
    <tr></tr>
    </tr>
    </tbody>
   </table><br><br>
   <p><h4>Entry for student 2:</h4></p>
   <table>
   <tbody>
   
    <td><b>Roll number of the student 2</b></td>
    <th><select name="Student_Roll_No2">          
     
 <%	
	
	if(i<students.size())
	{		
		Student stu_obj=new Student();
		stu_obj=students.get(i);
%>	

 <option> <%= stu_obj.getStudentId()   %>  </option>
	
<%
	i++;
	}
	else
	{
%>
	<option> No member  </option>
<% 		
	}

%>  

 </select> 
 </th>
    <tr></tr>
    <tr></tr>
    <tr></tr>
    </tr>
    <tr>
    <td><b>Background & Topic(4M)</b></td>
    <td><input type="text" name="bg_and_t2" placeholder="Enter Marks" autofocus></td>
    <tr></tr>
    <tr></tr>
    <tr></tr>
    </tr>
    <tr>
    <td><b>project Scope & Objectives(4M)</b></td>
    <td><input type="text" name="Pj_scope_n_obj2" placeholder="Enter Marks" autofocus></td>
    <tr></tr>
    <tr></tr>
    <tr></tr>
    </tr>
    <tr>
    <td><b>Literature Suvey(5M)</b></td>
    <td><input type="text" name="Lit_survey2" placeholder="Enter Marks" autofocus></td>
    <tr></tr>
    <tr></tr>
    <tr></tr>
    </tr>
    <tr>
    <td><b>Project Planning(4M)</b></td>
    <td><input type="text" name="Proj_plan2" placeholder="Enter Marks" autofocus></td>
    <tr></tr>
    <tr></tr>
    <tr></tr>
    </tr>
    <tr>
    <td><b>Presentation Skills(4M)</b></td>
    <td><input type="text" name="Present_skill2" placeholder="Enter Marks" autofocus></td>
    <tr></tr>
    <tr></tr>
    <tr></tr>
    </tr>
    <tr>
    <td><b>Question And Answers(4M)</b></td>
    <td><input type="text" name="QnA2" placeholder="Enter Marks" autofocus></td>
    <tr></tr>
    <tr></tr>
    <tr></tr>
    </tr>
    </tbody>
    </table><br>
    

    <p><h4>Entry for Student 3:</h4></p>
    <table>
    <tbody>
    <td><b>Roll number of the student 3</b></td>
    <th><select name="Student_Roll_No3">          
     
 <%	
	
	if(i<students.size())
	{
		Student stu_obj=new Student();
		stu_obj=students.get(i);
%>	

 <option> <%= stu_obj.getStudentId()   %>  </option>
	
<%
	i++;
	}
	else
	{
%>
	<option> No member  </option>
<% 		
	}

%>  

 </select> 
 </th>
    <tr></tr>
    <tr></tr>
    <tr></tr>
    </tr>
    <tr>
    <td><b>Background & Topic(4M)</b></td>
    <td><input type="text" name="bg_and_t3" placeholder="Enter Marks" autofocus></td>
    <tr></tr>
    <tr></tr>
    <tr></tr>
    </tr>
    <tr>
    <td><b>project Scope & Objectives(4M)</b></td>
    <td><input type="text" name="Pj_scope_n_obj3" placeholder="Enter Marks" autofocus></td>
    <tr></tr>
    <tr></tr>
    <tr></tr>
    </tr>
    <tr>
    <td><b>Literature Suvey(5M)</b></td>
    <td><input type="text" name="Lit_survey3" placeholder="Enter Marks" autofocus></td>
    <tr></tr>
    <tr></tr>
    <tr></tr>
    </tr>
    <tr>
    <td><b>Project Planning(4M)</b></td>
    <td><input type="text" name="Proj_plan3" placeholder="Enter Marks" autofocus></td>
    <tr></tr>
    <tr></tr>
    <tr></tr>
    </tr>
    <tr>
    <td><b>Presentation Skills(4M)</b></td>
    <td><input type="text" name="Present_skill3" placeholder="Enter Marks" autofocus></td>
    <tr></tr>
    <tr></tr>
    <tr></tr>
    </tr>
    <tr>
    <td><b>Question And Answers(4M)</b></td>
    <td><input type="text" name="QnA3" placeholder="Enter Marks" autofocus></td>
    <tr></tr>
    <tr></tr>
    <tr></tr>
    </tr>
    </tbody>
    </table><br>
    
   
    <p><h4>Entry for Student 4:</h4></p>
 <table>
 <tbody>
    <td><b>Roll number of the student 1</b></td>
   <th><select name="Student_Roll_No4">          
     
 <%	

	
	if(i<students.size())
	{	Student stu_obj=new Student();
		stu_obj=students.get(i);
%>	

 <option> <%= stu_obj.getStudentId()   %>  </option>

<%
	}else
{
%>
<option> No member  </option>
<% 		
}

%>  

 </select> 
 </th>
    <tr></tr>
    <tr></tr>
    <tr></tr>
    </tr>
    <tr>
    <td><b>Background & Topic(4M)</b></td>
    <td><input type="text" name="bg_and_t4" placeholder="Enter Marks" autofocus></td>
    <tr></tr>
    <tr></tr>
    <tr></tr>
    </tr>
    <tr>
    <td><b>project Scope & Objectives(4M)</b></td>
    <td><input type="text" name="Pj_scope_n_obj4" placeholder="Enter Marks" autofocus></td>
    <tr></tr>
    <tr></tr>
    <tr></tr>
    </tr>
    <tr>
    <td><b>Literature Suvey(5M)</b></td>
    <td><input type="text" name="Lit_survey4" placeholder="Enter Marks" autofocus></td>
    <tr></tr>
    <tr></tr>
    <tr></tr>
    </tr>
    <tr>
    <td><b>Project Planning(4M)</b></td>
    <td><input type="text" name="Proj_plan4" placeholder="Enter Marks" autofocus></td>
    <tr></tr>
    <tr></tr>
    <tr></tr>
    </tr>
    <tr>
    <td><b>Presentation Skills(4M)</b></td>
    <td><input type="text" name="Present_skill4" placeholder="Enter Marks" autofocus></td>
    <tr></tr>
    <tr></tr>
    <tr></tr>
    </tr>
    <tr>
    <td><b>Question And Answers(4M)</b></td>
    <td><input type="text" name="QnA4" placeholder="Enter Marks" autofocus></td>
    <tr></tr>
    <tr></tr>
    <tr></tr>
    </tr>
    </tbody>
    </table>
    
    
    
    <table>
    </tbody><br>
    <p><h4>Write comments</h4></p>
    
    <td><b>Comments by Reviewer:</b></td>
    <td><textarea rows="5" cols="33" name="comment_by_reviewer" style="background: #f1f1f1;"></textarea></td>
    <tr></tr>
    <tr></tr>
    <tr></tr>
  <tr></tr>
    <tr></tr>
    <tr></tr>
    </tbody>
    </table>
  <br>
   
  <input type="submit" name="button" value="Submit Review" style="font-size: 20px;margin-top: 2%;">&emsp;&emsp;
 
  
  <input type="reset" value="Reset" style="font-size: 20px;margin-top: 2%;"><br><br>
</form>
</div>
</div> 
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