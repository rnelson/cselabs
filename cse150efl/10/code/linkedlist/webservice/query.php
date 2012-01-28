<?php

if (!empty($_GET)) {
	require_once('constants.php');
	require_once('db.php');
	$res = work();
	
	// If it didn't parse properly, spit out the errors
	if ($res['status'] == false) {
		echo "Errors:\n";
		foreach ($res['errors'] as $error) {
			echo '  ' . $error;
		}
		
		die();
	}
	else {
		// Success! Tell the user where to get to the results
		echo "Success! " . $res['url'] . "\n";
		
		// We want to die here as well so the HTML below is only shown
		// if there's no $_POST
		die();
	}
}

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
		<title>Query</title>
	</head>
	<body>
		<strong>Error:</strong> This page shouldn't be visited manually.
	</body>
</html>
