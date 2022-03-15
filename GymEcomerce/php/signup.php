<?php
include ("../connection.inc.php");
session_start();
// main code

if(isset($_POST['submit'])) {

  $name = $_POST['name'];
  $email = $_POST['email'];
  $mobile = $_POST['mobile'];
  $password = $_POST['password'];
  $conpass = $_POST['conpass'];
  $add_on=date('Y-m-d h:i:s');
 
 
  $password =md5($password) ;
  // $conpassw = password_hash($pass, md5) ;

  
  $_SESSION['email'] = $email;

  $emailquery = "select * from users where email = '$email' ";
  $query = mysqli_query($con , $emailquery);
  $emailcount = mysqli_num_rows($query);

  $phonequery = "select * from users where mobile = '$mobile' ";
  $phquery = mysqli_query($con , $phonequery);
  $phonecount = mysqli_num_rows($phquery);

  if ($emailcount>0) {
    $mailerror ="email already register";
    header('location:../login.php?msg='.$mailerror);   
  }
  elseif ($phonecount >0) {
    $numerror ="Phone number already register";
    header('location:../login.php?nummsg='.$numerror);    
  }
  else{ 
    $insertquery = " INSERT INTO `users`(name, email, mobile, password,add_on) VALUES('$name', '$email', '$mobile', '$password','$add_on')" ;
    if ($con->query($insertquery) === TRUE) {
      $success = "Successfully register Login now";
      header('location:../index.php');
      
    } else {
      echo "Error: " . $insertquery . "<br>" . $con->error;
    }
  }
}
?>