<?php
session_start();
$servername = "localhost";
$username = "root";
$spassword = "";
$database = "gym_db";

$con = mysqli_connect($servername, $username, $spassword, $database);

define('SERVER_PATH',$_SERVER['DOCUMENT_ROOT'].'/gym-world/GymEcomerce/');
define('SITE_PATH','http://127.0.0.1/gym-world/GymEcomerce/');

define('PRODUCT_IMAGE_SERVER_PATH',SERVER_PATH.'media/product/');
define('PRODUCT_IMAGE_SITE_PATH',SITE_PATH.'media/product/');
?>