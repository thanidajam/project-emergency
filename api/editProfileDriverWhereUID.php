<?php
	include 'connected.php';
	header("Access-Control-Allow-Origin: *");

if (!$link) {
    echo "Error: Unable to connect to MySQL." . PHP_EOL;
    echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
    echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;
    
    exit;
}

if (!$link->set_charset("utf8")) {
    printf("Error loading character set utf8: %s\n", $link->error);
    exit();
	}


if (isset($_GET)) {
	if ($_GET['isAdd'] == 'true') {
			
		$uid = $_GET['uid'];		
		$name = $_GET['name'];
		$username = $_GET['username'];
		$phone = $_GET['phone'];
		$password = $_GET['password'];
		$image = $_GET['image'];
		
		
							
		$sql = "UPDATE `user` SET `name` = '$name', `username` = '$username', `phone` = '$phone', `password` = '$password', `image` = '$image' WHERE uid = '$uid'";

		$result = mysqli_query($link, $sql);

		if ($result) {
			echo "true";
		} else {
			echo "false";
		}

	} else echo "Welcome Master UNG";
   
}

	mysqli_close($link);
?>