<?php

	if( !isset($_GET['to']) || !isset($_GET['msg']) ) exit();

	$url = "https://api.twilio.com/2010-04-01/Accounts/AC2800d479f42dfd8290f9f5306d0ea834/Messages";
	$fields = array(
	            'From'=>urlencode("+17478886438"),
	            'To'=>urlencode($_GET['to']),
	            'Body'=>urlencode($_GET['msg'])
	        );

	//url-ify the data for the POST
	foreach($fields as $key=>$value) { $fields_string .= $key.'='.$value.'&'; }
	rtrim($fields_string,'&');

	$usr = "AC2800d479f42dfd8290f9f5306d0ea834";
	$pwd = "6107649756757ec9f9392a0562521a06";

	//open connection
	$ch = curl_init();

	//set the url, number of POST vars, POST data
	curl_setopt($ch,CURLOPT_URL,$url);
	curl_setopt($ch,CURLOPT_POST,count($fields));
	curl_setopt($ch,CURLOPT_POSTFIELDS,$fields_string);
	curl_setopt($ch,CURLOPT_USERPWD,$usr.":".$pwd);

	//execute post
	$result = curl_exec($ch);
	print $result;
?>