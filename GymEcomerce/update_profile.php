<?php
require('connection.inc.php');
require('functions.inc.php');
if(!isset($_SESSION['USER_LOGIN'])){
	?>
	<script>
	window.location.href='index.php';
	</script>
	<?php
}
#below code is to get new name from user and update new name in database and print current name in input field
$name=get_safe_value($con,$_POST['name']);
$uid=$_SESSION['USER_ID'];
mysqli_query($con,"update users set name='$name' where id='$uid'");
$_SESSION['USER_NAME']=$name;
echo "Your name updated";
?>