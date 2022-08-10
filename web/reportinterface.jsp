<%-- 
    Document   : reportinterface
    Created on : Aug 6, 2022, 2:53:18 AM
    Author     : KAINE.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

     <!-- Font Awesome for icons -->
     <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
     <link rel="stylesheet" href="css/login-page.css">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
     <link rel="stylesheet" href="css/demo.css" />
     <link rel="stylesheet" href="menu.css">
     <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
     <!-- <link href="https://fonts.googleapis.com/css?family=Raleway:100,200,400,500,600" rel="stylesheet" type="text/css"> -->
     <link rel="stylesheet" href="cards.css">

    <title>REPORTS</title>

    <style>
   body{
       background-image:url("grad.png");
   }
     </style>
    
</head>
<body>

    <nav>
        <input type="checkbox" id="check">
        <label for="check" class="checkbtn">
            <i class="fas fa-bars"></i>
        </label>
        <label class="logo">CHILDLEARN</label>
        <ul>
            <li><a href="pupilform.php">Register Pupils</a></li>
            <li><a href="assignments.php">Assignments</a></li>
            <li><a href="results.php">Results</a></li>
            <li><a href="logout.php">logout</a></li>
        </ul>
    </nav><br>
    <h2 style="margin-left:5%;">Dashboard</h2>
    <p style="margin-left:5%;">logged in, as <?php  echo($_SESSION['teacherid']); ?> </p>
    
   <div class="container">
        <div class="main-part">

            <div class="cpanel">
            <div class="icon-part">
            <i class="fa fa-users" aria-hidden="true"></i><br>
            <small>pupils</small>
            <p> <?php
          $mysqli = new mysqli("localhost", "root", "", "childlearn");
          $myquery = "select usercode from pupils";
          $myresult = mysqli_query($mysqli, $myquery);
          $num = mysqli_num_rows($myresult);

          echo"$num";
      
      ?></p>
            </div>

            <div class="card-content-part">
            <a href="pupillist.php"> Details </a>
            </div>
            </div>

                <div class="cpanel cpanel-orange">
                <div class="icon-part">
                <i class="fa fa-bell" aria-hidden="true"></i><br>
                <small>Activation requests</small>
                <p> <?php
          $mysqli = new mysqli("localhost", "root", "", "childlearn");
          $myquery = "select usercode from pupils where request ='activate me'";
          $myresult = mysqli_query($mysqli, $myquery);
          $num = mysqli_num_rows($myresult);

          echo"$num";
      
      ?></p>
                </div>

                <div class="card-content-part">
                <a href="pupillist.php"> Details </a>
                </div>
                </div>

                <div class="cpanel cpanel-blue">
                <div class="icon-part">
                <i class="fa fa-tasks" aria-hidden="true"></i><br>
                <small>closed assignments</small>
                <p> <?php
          $mysqli = new mysqli("localhost", "root", "", "childlearn");
          $myquery = "select assignmentID from assignments where a_status ='closed'";
          $myresult = mysqli_query($mysqli, $myquery);
          $num = mysqli_num_rows($myresult);

          echo"$num";
      
      ?></p>
                </div>
                <div class="card-content-part">
                <a href="open.php"> Details </a>
                </div>
            </div>

            <div class="cpanel cpanel-skyblue">
            <div class="icon-part">
            <i class="fa fa-comments" aria-hidden="true"></i><br>
            <small>open assignments</small>
            <p> <?php
          $mysqli = new mysqli("localhost", "root", "", "childlearn");
          $myquery = "select assignmentID from assignments where a_status='open'";
          $myresult = mysqli_query($mysqli, $myquery);
          $num = mysqli_num_rows($myresult);

          echo"$num";
      
      ?></p>
            </div>
            <div class="card-content-part">
            <a href="open.php"> Details </a>
            </div>
            </div>
  </div>  
</div>

<!-- beginning  of the content after the cards. -->
<br><br>



    <center>
<div class="reports">
<br><br>
<p>the highest mark scored so far is:<b><?php 
      $conn= mysqli_connect("localhost", "root", "", "childlearn");
      if($conn-> connect_error){
          die("connection faied:".$conn-> connect_error);
      }
      
      $sql = "select max(mark) from results";
      $result = $conn-> query($sql);
      if($result->num_rows > 0){
      while($row = $result->fetch_assoc()){
      
        $mark = $row['max(mark)'];
        echo" $mark";
      
           } 
        } 
     
    ?>
 </b></p><br>

    <p>the average mark scored by the pupils is:<b><?php

$conn= mysqli_connect("localhost", "root", "", "childlearn");
if($conn-> connect_error){
    die("connection faied:".$conn-> connect_error);
}

$sql = "select avg(mark) from results";
$result = $conn-> query($sql);
if($result->num_rows > 0){
while($row = $result->fetch_assoc()){

  $mark = $row['avg(mark)'];
  echo" $mark";

     } 
  } 

    ?></b>
    </p><br>

    <p>the lowest mark so far scored is:<b><?php
     $conn= mysqli_connect("localhost", "root", "", "childlearn");
     if($conn-> connect_error){
         die("connection faied:".$conn-> connect_error);
     }
     
     $sql = "select min(mark) from results";
     $result = $conn-> query($sql);
     if($result->num_rows > 0){
     while($row = $result->fetch_assoc()){
     
       $mark = $row['min(mark)'];
       echo" $mark";
     
          } 
       } 
    
    ?></b>
    </p><br>

    <p><b><?php
$mysqli = new mysqli("localhost", "root", "", "childlearn");
$myquery = "select distinct usercode from results;";
$myresult = mysqli_query($mysqli, $myquery);
$num = mysqli_num_rows($myresult);

echo"$num ";

    ?></b>
    pupils have so far submitted the assignments.
    </p><br>
    </center>
</div>    
   
   

</div>
</div>
  
</body>
</html>
