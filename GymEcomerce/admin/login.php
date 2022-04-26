<?php
require('connection.inc.php');
require('functions.inc.php');
$msg='';
if(isset($_POST['submit'])){
	$username=get_safe_value($con,$_POST['username']);
	$password=get_safe_value($con,$_POST['password']);
	$sql="select * from admin_users where username='$username' and password='$password'";
	$res=mysqli_query($con,$sql);
	$count=mysqli_num_rows($res);
	if($count>0){
		$_SESSION['ADMIN_LOGIN']='yes';
		$_SESSION['ADMIN_USERNAME']=$username;
		header('location:categories.php');
		die();
	}else{
		$msg="*Please enter correct login details";	
	}
}
?>
<html>
<head>
</head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Login Form Desing</title>
    <link rel="stylesheet" type="text/css" href="../css/newlogin.css">
    <div class="loginbox">
    
    <body>
        
        <h1 class="admin">Admin</h1>
        <h1>Login</h1>
        <form method="POST">
            
        <input type="text" name="username" class="form-control" placeholder="Username" required>
           
        <input type="password" name="password" class="form-control" placeholder="Password" required>
            <button type="submit" name="submit" class="btn btn-success btn-flat m-b-30 m-t-30">Sign in</button>
            <div class="error"><?php echo $msg?></div>
               </div>
</div>
</form>

</body>
<video id="myVideo" autoplay muted loop>
        <source src="../images/video.mp4">
</video>
</html>