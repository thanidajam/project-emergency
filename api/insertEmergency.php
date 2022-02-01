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
				
		$e_type = $_GET['e_type'];
		$e_name = $_GET['e_name'];
		$e_date = date('Y-m-d h:i:s');
		$pic = $_GET['pic'];
		$lat = $_GET['lat'];
		$lng = $_GET['lng'];
		$location = $_GET['location'];
		$phone = $_GET['phone'];
		$status = $_GET['status'];
		$send_emer = $_GET['send_emer'];
		$rec_emer = $_GET['rec_emer'];
		
							
		$sql = "INSERT INTO `emergency`(`EID`, `E_type`, `E_name`, `E_date`, `Pic`, `lat`, `lng`, `Location` , `Phone` ,`Status` , `Send_emer` , 
		`Rec_emer`) VALUES (Null,'$e_type','$e_name','$e_date','$pic','$lat','$lng','$location','$phone' ,'$status','$send_emer','$rec_emer')";

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