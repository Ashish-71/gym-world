<!DOCTYPE html>
<html>

<?php

include ('connection.inc.php');

?>

    <head>
        <title>Login</title>
        <link rel="stylesheet" href="css/login.css">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

    </head>

    <body>
		
		<video autoplay muted loop id="myVideo">
			<source src="images/video.mp4" type="video/mp4">
			Your browser does not support HTML5 video.
		  </video>
		  
        <div class="main">
            <p class="success">
			
                <?php if(isset($_GET['successmsg'])) { echo $_GET['successmsg']; } ?>
            </p>
            <div class="form-box">
                <div class="button-box">
                    <div id="btn"></div>
                    <button class="toggle-btn" type="button" onclick="login()">Login</button>
                    <button class="toggle-btn" type="button" onclick="register()">Register</button>
                </div>
                <div class="icon" id="icontag">
                    <i class="fab fa-facebook" id="fb"></i>
                    <i class="fab fa-instagram" id="insta"></i>
                    <i class="fab fa-facebook" id="twt"></i>
                </div>
                <form action="php/login.php" class="login-form" id="loginform" method="post">
                    <input type="text" class="form-felds" placeholder="E-mail" name="username" required autocomplete="off">
                    <p id="">
                        
                    </p>
                    <input type="password" class="form-felds" placeholder="Password" name="password" required autocomplete="off">
                    <p id="">
                       
                    </p>
                    <p id="">
                        
                    </p>
                    <span id="usenamespan"></span>
                    <button type="submit" class="login" name="login">Login</button>
					<img src="images/logo.jpg">
                    <div class="bottomdiv">
                        <a href="dashboard/login.php" class="admin">admin?</a>
                    </div>
                </form>
                <!--  -->
                <form class="login-form" id="registerform" method="post" action="php/signup.php" onsubmit="return validation()">
                    <div class="f123">
                        <input name="name" type="text" id="name" class="form-felds" placeholder="First name" required autocomplete="off">
                        
                    </div>
                    <p id="name"></p>
                    <input name="email" type="text" id="email" class="form-felds" placeholder="Email" required autocomplete="off">
                    <p id="rmailspan">
                        
                    </p>
                    <input name="mobile" type="number" id="mobile" class="form-felds" placeholder="phone number" required autocomplete="off">
                    <p id="numberspan">
                        
                    </p>
                   
                    <div class="f123">
                        <input name="password" type="password" id="password" class="form-felds" placeholder="Password" required autocomplete="off">
                        <input name="conpass" type="password" id="conpass" class="form-felds" placeholder="Confirm Password" required autocomplete="off">
                        <p id="conpassspan"></p>
                    </div>
                    <button type="submit" class="register" name="submit">Register</button>
					<img src="images/logo.jpg">
                </form>
            </div>
        </div>

        <script>
            var a = document.getElementById("btn");
            var b = document.getElementById("loginform");
            var c = document.getElementById("registerform");
            var d = document.getElementById("fb");
            var e = document.getElementById("insta");
            var f = document.getElementById("twt");
            var g = document.getElementById("icontag");

            function register() {
                a.style.left = "107px";
                b.style.left = "-400px";
                c.style.left = "50px";
                b.style.visibility = "hidden";
                c.style.top = "120px";
                c.style.visibility = "visible";
                d.style.fontSize = "15px";
                e.style.fontSize = "15px";
                f.style.fontSize = "15px";
                g.style.marginTop = "15px";
            }

            function login() {
                a.style.left = "0";
                b.style.left = "50px";
                b.style.visibility = "visible";
                c.style.left = "450px";
                c.style.top = "180px";
                c.style.visibility = "hidden";
                d.style.fontSize = "30px";
                e.style.fontSize = "30px";
                f.style.fontSize = "30px";
            }

            function validation() {
                var name = document.getElementById('name').value;
                var email = document.getElementById('email').value;
                var password = document.getElementById('password').value;
                var conpass = document.getElementById('conpass').value;
                var mobile = document.getElementById('mobile').value;
                if (!isNaN(fname)) {
                    document.getElementById('name').innerHTML = "Please enter valid first Name";
                    return false;
                } else if (!isNaN(lname)) {
                    document.getElementById('name').innerHTML = "Please enter valid last Name";
                    return false;
                } else if (mail.indexOf('@') <= 0) {
                    document.getElementById('rmailspan').innerHTML = "envalid @ position";
                    return false;
                } else if (mail.charAt(mail.length - 4) != '.') {
                    document.getElementById('rmailspan').innerHTML = "Only .com is allowed";
                    return false;
                } else if ((phone.length < 10) || (phone.length > 10)) {
                    document.getElementById('numberspan').innerHTML = "only 10 digit allowed";
                    return false;
                } else if (password != conpass) {
                    document.getElementById('conpassspan').innerHTML = "password not matching";
                    return false;
                } else {
                    return true;
                }
            }

            function state() {

                var xmlhttp = new XMLHttpRequest();
                xmlhttp.open("GET", "php/ajax.php?state=" + document.getElementById("statedd").value, false);
                xmlhttp.send(null);
                document.getElementById("city").innerHTML = xmlhttp.responseText;

            }
        </script>
    </body>

</html>