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
				
		$code = $_GET['code'];
		$username = $_GET['username'];
		$password = $_GET['password'];
		$name = $_GET['name'];
		$email = $_GET['email'];
		$phone = $_GET['phone'];
		$type = $_GET['type'];
		$image = $_GET['image'];
		
							
		$sql = "INSERT INTO `user`(`UID`, `Code`, `Username`, `Password`, `Name`, `Email`, `Phone`, `Type` , `image`) VALUES (Null,'$code','$username','$password','$name','$email','$phone','$type','$image')";

		$result = mysqli_query($link, $sql);

		if ($result) {
			echo "true";
		} else {
			echo "false";
		}

	} else echo "Welcome to emergency";
   
}
	mysqli_close($link);
?>