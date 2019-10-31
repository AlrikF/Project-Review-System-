<%@page import="com.login.Group"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.login.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>

.button {
  display: inline-block;
  border-radius: 4px;
  background-color: #338;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 18px;
  padding: 10px;
  width: 240px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
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
  height: 180px;
  width: 190px;
  border-radius: 5px;
  color:#757a82 ;
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.6);
}

img {
  border-radius: 5px 5px 0 0;
}

</style>
<style>
    .sec {
      width: 1100px;
      padding: 10px;
      border: 5px solid gray;
      margin: 0;
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
body {
  font-family: "Lato", sans-serif;
}

</style>
<style>
    ul {
      list-style-type: none;
      margin: 0;
      padding: 0;
      overflow: hidden;
      background-color:#003153;
    }
    
    li {
      float: left;
    }
    
    li a {
      display: block;
      color: white;
      text-align: center;
      padding: 14px 16px;
      text-decoration: none;
    }
    li a:hover {
      background-color:rgb(255,255,255);
    
  }
  </style>
  <style>
 .clearfix {
  overflow: auto;
}

</style>
<head>
  <title>Homepage</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <!-- Material Kit CSS -->
  <link href="assets/css/material-kit.css?v=2.0.6" rel="stylesheet" />
</head>

<body>
	<ul>
        <li><a href="#">Home</a></li>
        
        
        <li style="float:right"><a class="active" href="Logout">Logout</a></li>
      </ul>
  <div class="page-header header-filter" data-parallax="true" style="background-image: url('assets/img/mac.jpg')">
    <div class="container">
      <div class="row">
        <div class="col-md-8 ml-auto mr-auto">
          <div class="brand text-center">
            <h1><b>Project Based Seminar</b></h1>
            <h1 class="title text-center">Guide's Page</h1>
          </div>
        </div>
      </div>
    </div>
  </div>


<% 
    	Group grp_obj=(Group)request.getAttribute("Group_info");
%>


<div class="main main-raised">  
	<div class="container">
      <div class="section text-center">
        <h1 class="title">Everything you need to know</h1>
     <div class="grid">
	

<font size="8"><b>Group <%=grp_obj.getGroup_id() %></b></font>


<div class="card">
  <div class="container">
  <h3><b>Problem Title</b></h3>
	<%if(grp_obj.getProblem_title()!=null){ %>
  	<font size=4 ><b><%=grp_obj.getProblem_title() %></b></font>
	<%}else{%>
	<b>	Not Entered</b>
		<%} %>
   </div>
</div>

<div class="card">
  <div class="container">
    <h3><b>Domain</b></h3> 
    <%if(grp_obj.getProj_area()!=null){ %>
   <font size=4> <b><%=grp_obj.getProj_area() %></b></font>
   <%}else{%>
	<b>	Not Entered</b>
	<%} %>
  </div>
</div>

<div class="card" style="height:270px">
  <div class="container">
  <h3><b>Group Members<b></h3>
  
  <font size=4>
<%   
    ArrayList<Student> stu_array=(ArrayList<Student>)session.getAttribute("student_array");
	for(int i=0;i<stu_array.size();i++)
	{
		Student stu_obj=new Student();
		stu_obj=stu_array.get(i);
%>
<center>	
		<%if(stu_obj.getStudentId()!=null){ %>
		<%=stu_obj.getStudentId() %>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<%}else{%>
		Not Entered&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<%} %>
		<%if(stu_obj.getStudentname()!=null){ %>
		<%=stu_obj.getStudentname() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<%}else{%>
		Not Entered&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<%} %>
		<%if(stu_obj.getStudentemail()!=null){ %>
		<%=stu_obj.getStudentemail() %>
		<%}else{%>
		Not Entered&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<%} %>
</center>
	<br>
<% 
		
	}
    
%>

	</font>
  </div>
</div>

<form action="Form_submit" method="post">
<% 
	int no=grp_obj.getGroup_id();
System.out.println("Inside Guide group info"+no);

%>
<input style="margin-left:10%" class="button" type="submit" name="button" value="Enter weekly log for group">

</form> 


</div>
</div>
    </div>
    
   
    <br><br><br><br>
   
    </div>
  </div>
</div>




  <footer class="footer footer-default">
  	
  </footer>
</body>

</html>
