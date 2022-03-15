<?php

$servername = "localhost";
$username = "root";
$spassword = "";
$database = "gym_db";

$con = mysqli_connect($servername, $username, $spassword, $database);
// Create connection

session_start();
if(isset($_POST['login'])) {
    
    $name = mysqli_real_escape_string($con, $_POST['username']);
    $password = mysqli_real_escape_string($con, $_POST['password']);
    
    $emailquery = "select * from users where email = '$name' ";
    $query = mysqli_query($con , $emailquery);
    $emailcount = mysqli_num_rows($query);
    
    if($emailcount>0) {
        $passfatch = mysqli_fetch_assoc($query);
        $dbpass = $passfatch['password'];
        $password = md5($password);
       
        $_SESSION['email'] = $passfatch['email'];
        
        echo $password;
        echo "<br>";
        echo $dbpass;

       
            if($password == $dbpass) {
                header('location:../index.php'); 
            } else {
                $passerror = "wrong password";
                header('location: ../login.php?errorpass='. $passerror);
            }
        }else {
            $inactive = "Sorry your id has been disabled";
            header('location: ../login.php?inactive='. $inactive);
        }
    
   
}
?>