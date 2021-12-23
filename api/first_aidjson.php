<?php
	header("Access-Control-Allow-Origin: *");
	
	header("Content-Type: application/json; charset=UTF-8");
	
	header("Access-Control-Allow-Methods: OPTIONS,GET,POST,PUT,DELETE");
	
	header("Access-Control-Max-Age: 3600");
	
	header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

	$servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "newemer";

	$conn = new mysqli($servername, $username, $password, $dbname);

	$requestMethod = $_SERVER["REQUEST_METHOD"];
    // Check Connection
    if($conn->connect_error){
        die("Connection Failed: " . $conn->connect_error);
        return;
    }
    $conn->set_charset("utf8");

	$sql = "SELECT * FROM first_aid";
	$result = $conn->query($sql);
	$response = array();
	if ($result->num_rows > 0) {
		while($rowdata = $result->fetch_assoc()){
			ini_set("memory_limit","1024M");
	$response[] = $rowdata;
	}
	
	echo json_encode($response, \JSON_UNESCAPED_UNICODE);
	} else {
		echo "error";
	}
	//อ่านข้อมูลที่ส่งมาแล้วเก็บไว้ที่ตัวแปร data
	$data = file_get_contents("php://input");

	//แปลงข้อมูลที่อ่านได้ เป็น array แล้วเก็บไว้ที่ตัวแปร result
	$result = json_decode($data,true,512, \JSON_UNESCAPED_UNICODE);

?>