<?php
session_start();
$con=mysqli_connect("localhost","root","","gym_db");
define('SERVER_PATH',$_SERVER['DOCUMENT_ROOT'].'/GymEcomerce/');
define('SITE_PATH','http://localhost:3000/GymEcomerce/');

define('PRODUCT_IMAGE_SERVER_PATH',SERVER_PATH.'media/product/');
define('PRODUCT_IMAGE_SITE_PATH',SITE_PATH.'media/product/');
?>