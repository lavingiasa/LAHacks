<?php
	error_reporting(E_ALL);
	ini_set('display_errors', 1);

	

	$url = "https://api.parse.com/1/users/";
	$head1 = "X-Parse-Application-Id: pPMMcEX5L6ZaJKAA10f7UqHPvBzXawin9NyyGGZj";
	$head2 = "X-Parse-REST-API-Key: U5lIy47Tj7JpGzKlgptapzNJXvbEiuHAyW45obMj";


	//open connection
	$ch = curl_init();

	//set the url and header
	curl_setopt($ch,CURLOPT_URL,$url);
	curl_setopt($ch,CURLOPT_HTTPHEADER,array($head1, $head2));
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

	//execute
	$response = curl_exec($ch);
	$json = json_decode($response, true);
	echo var_dump($json);

	echo "<br />ASDF<br /><br />";

	$results = $json["results"];
	echo var_dump($results);

	
	foreach($results as $user) {
		$classesMissedThisSemester = $user["classesMissedThisSemester"];
		$numberOfClassesPerDay = $user["numberOfClassesPerDay"];
		$classesHitToday = $user["classesHitToday"];
		$classesMissedThisSemester = $user["classesMissedThisSemester"];
		$graceDays = $user["graceDays"];
		$cancelDays = $user["cancelDays"];
		$classesHitToday = $user["classesHitToday"];
		$today =date( "w" ) + 0;

		echo "<br /><br />" . var_dump($numberOfClassesPerDay) . "<br />" . var_dump($classesMissedThisSemester) . "<br />" . var_dump($classesHitToday);

		
		$classesMissedThisSemester = $classesMissedThisSemester + ($numberOfClassesPerDay[$today] - $classesHitToday);
		if ($classesMissedThisSemester > ($graceDays + $cancelDays)) {
			punishment($user);
		}
		$classesHitToday = 0;
		
		update($user, $classesMissedThisSemester);

	}

	function punishment($user) {
		$textMessage = $user["textMessage"];
		$phoneNumber = $user["phoneNumber"];
		$url = $_SERVER['HTTP_HOST'] . dirname($_SERVER['REQUEST_URI']) . "/text.php?".
			"to=" . urlencode($phoneNumber) . "&msg=" . urlencode($textMessage);  

		echo $url;
		//open connection
		$ch = curl_init();

		//set the url
		curl_setopt($ch,CURLOPT_URL,$url);

		//execute
		$result = curl_exec($ch);
	}

	function update($user, $classesMissedThisSemester) {

		$update_json = '{ "classesHitToday": 0, "classesMissedThisSemester": ' .
			$classesMissedThisSemester . ' }';

		$url = "https://api.parse.com/1/users/" . $user["objectId"];
		echo $url."<br /><br /><br /><br />";
		$head1 = "X-Parse-Application-Id: pPMMcEX5L6ZaJKAA10f7UqHPvBzXawin9NyyGGZj";
		$head2 = "X-Parse-REST-API-Key: U5lIy47Tj7JpGzKlgptapzNJXvbEiuHAyW45obMj";
		$head3 = "X-Parse-Master-Key: EFjMQ1yWTZ51ktLHZIp6amzHlK18yUR9RANNHxVD";
		$head4 = "Content-Type: application/json";
		$head5 = "Content-Length: " . strlen($update_json);

		//open connection
		$ch = curl_init();

		//set the url and header
		curl_setopt($ch,CURLOPT_URL,$url);
		curl_setopt($ch,CURLOPT_HTTPHEADER,array($head1, $head2, $head3, $head4, $head5));
		curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "PUT");
		curl_setopt($ch, CURLOPT_POSTFIELDS,$update_json);

		//execute put
		$result = curl_exec($ch);
	}


	

?>