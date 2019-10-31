<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
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
  height: 80px;
  width: 80px;
  border-radius: 5px;
  color:#757a82 ;
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
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
 .clearfix {
  overflow: auto;
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
  <div class="page-header header-filter" data-parallax="true" style="background-image: url('assets/img/img.jpg')">
    <div class="container">
      <div class="row">
        <div class="col-md-8 ml-auto mr-auto">
          <div class="brand text-center">
            <h1><b>Project Review System</b></h1>
            <h1 class="title text-center"></h1>

          </div>
        </div>
      </div>
    </div>
  </div>

<div class="main main-raised">  
	<div class="container">
      <div class="section text-center">
        <font size="5"><b>Login as:</b></font>
        <div class="grid">
  
<div class="card">
  <div class="container">
    <h3><b>Student</b></h3> 
     <a href="login_student.jsp"><button class="button button1">Login As Student</button></a>
  </div>
</div>
<div class="card">
  <div class="container">
    <h3><b>Staff</b></h3> 
     <a href="login_staff.jsp"><button class="button button1">Login As Staff</button></a>
  </div>
</div>
    </div>
    </div>
  </div>
</div>
  <footer class="footer footer-default">
  	<p>Pune Institute Of Computer Technology</p>
  </footer>
</body>

</html>
