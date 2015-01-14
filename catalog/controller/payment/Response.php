<?php
//Initializing session
session_start();

//Storing $_REQUEST['msg'] in session.
$_SESSION['msg'] = $_REQUEST['msg'];

if($_REQUEST['msg'] != '') {
	
	$msg=trim($_REQUEST['msg']);
	$msg_array=explode("|",$msg);

//---Set Property file Path
$property_path="MerchantDetails.properties"; //Modify this url with the path of your property file.
	
//---Read Property file
		$property_data_array=readPropertyFileData($property_path);

		if(count($property_data_array)<5)
		{
			ShowError("Invald Proerty File");
			die();
		}

		$txtBillerId=$property_data_array[0];
		$txtResponseUrl=$property_data_array[1];
		$txtCRN=$property_data_array[2];
		$txtCheckSumKey=$property_data_array[3];
		$CheckSumGenUrl=trim($property_data_array[4]);
		$TPSLUrl=$property_data_array[5];


		$txtResponseKey = $msg_array[0] ."|".$msg_array[1] ."|".$msg_array[2] ."|".$msg_array[3] ."|".$msg_array[4] ."|".$msg_array[5] ."|".$msg_array[6] ."|".$msg_array[7] ."|".$msg_array[8] ."|".$msg_array[9] ."|".$msg_array[10] ."|".$msg_array[11] ."|".$msg_array[12] ."|".$msg_array[13] ."|".$msg_array[14] ."|".$msg_array[15] ."|".$msg_array[16] ."|".$msg_array[17] ."|".$msg_array[18] ."|".$msg_array[19] ."|".$msg_array[20] ."|".$msg_array[21] ."|".$msg_array[22] ."|".$msg_array[23] ."|".$msg_array[24] ."|".$txtCheckSumKey;	


//Contatinating values.
$txtResponseKey = "txtResponseKey=" . $txtResponseKey;


//-----Curl main Function Start

 define('POST', $CheckSumGenUrl);
 define('POSTVARS', $txtResponseKey);  // POST VARIABLES TO BE SENT
 
// INITIALIZE ALL VARS
 

 if($_SERVER['REQUEST_METHOD']==='POST') {  // REQUIRE POST OR DIE
 $ch = curl_init(POST);
 curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 1);
 curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, False);
 curl_setopt($ch, CURLOPT_CAINFO, getcwd() . '/keystoretekp.pem'); //Setting certificate path
 curl_setopt ($ch, CURLOPT_SSLCERTPASSWD, 'changeit');
 curl_setopt($ch, CURLOPT_POST      ,1);
 //curl_setopt($ch, CURLOPT_TIMEOUT  ,10); // Not required. Don't use this.
 curl_setopt($ch, CURLOPT_REFERER  ,'http://www.yourdomain.com/Response.php'); //Setting header URL
 curl_setopt($ch, CURLOPT_POSTFIELDS    ,POSTVARS);
 curl_setopt($ch, CURLOPT_FOLLOWLOCATION  ,1); 
 curl_setopt($ch, CURLOPT_HEADER      ,0);  // DO NOT RETURN HTTP HEADERS 
 curl_setopt($ch, CURLOPT_RETURNTRANSFER  ,1); // RETURN THE CONTENTS OF THE CALL
 
$Received_CheckSum_Data = curl_exec($ch);
curl_close($ch);

$session_val = $_SESSION['msg'];
$return_array = explode("|",$session_val);


	 //Validate Checksum
	
		if(trim($Received_CheckSum_Data) == trim($return_array[25])){

			echo "<br>Response return from payment gatway.<br>";
			echo "<pre>";
			print_r($return_array);
			
			echo "<br>";

			if(trim($return_array[14])=='0300')
			{

				echo "<BR>";
				echo "Success";	
				echo "<BR>Transaction Id : ".$return_array[1];
				exit;

			}
			else
			{
				 
				echo "<BR>";
				echo "Failed transaction.";	
			}

		}else{
			
			echo "Checksum verification failed. Fake transaction detected!";
			
		}

	 } else {
	echo "<PRE> Invalid Response !";
	}
}
function readPropertyFileData($s11) {
		
		$process_file_array=array();
		$fp = @fopen($s11, 'r');
		if ($fp) {
			$array = explode("\n", fread($fp, filesize($s11)));
		}
		$array_count=count($array);
		
		for($i=0;$i<$array_count;$i++) {
			$array_str=explode("=",$array[$i]);
			$process_file_array[]=$array_str[1];
		}
		return $process_file_array;
		
	}

function ShowError($error)
{
	 echo "<p>
	 <span style='coloe:red; font size:16px;'>Error:<br></span>".$error;
}

?>