<?php

function work() {
	require_once('constants.php');
	
	$ret = array();
	$ret['status'] = true;
	$ret['errors'] = array();
	
	// Make sure we have something
	if (empty($_GET)) {
		$ret['status'] = false;
		$ret['errors'][] = "No data sent\n";
		
		return $ret;
	}
	
	// Get the bits from the request
	if (!isset($_GET['type'])) {
		$ret['status'] = false;
		$ret['errors'][] = 'Must specify a query type; supported types: (' . $supportedQueriesString . ")\n";
		
		return $ret;
	}
	
	$type = $_GET['type'];
	
	if ($type != 'google') {
		$ret['status'] = false;
		$ret['errors'][] = '"' . $type . '" is an unknown type; supported types: (' . $supportedQueriesString . ")\n";
		
		return $ret;
	}
	
	// Since we only do Google, get to work
	$name = getName($_GET);
	$user = $_GET['username'];
	$query = $_GET['query'];
	
	// Make sure we have everything
	if (empty($name) || empty($user) || empty($query)) {
		$ret['status'] = false;
		$ret['errors'][] = "Incomplete query\n";
		
		return $ret;
	}
	
	// Add the query to the database
	try {
		include('constants.php');
		
		// Open the database
		$db = new PDO($dsn);
		
		// Create the SQL query
		$statement = $db->prepare($googleInsertQuery);
		$statement->bindValue(':name', $name, PDO::PARAM_STR);
		$statement->bindValue(':user', $user, PDO::PARAM_STR);
		$statement->bindValue(':query', $query, PDO::PARAM_STR);
		
		// Execute the query
		$success = $statement->execute();
		
		// Make sure it worked
		if (!$success) {
			$ret['status'] = false;
			
			$eInfo = $db->errorInfo();
			$ret['errors'][] = 'Database error: [' . $eInfo[0] . '] ' . $eInfo[2] . "\n";
			
			return $ret;
		}
		
		// Get the id and set it and the url
		$id = $db->lastInsertId('id');
		$ret['id'] = $id;
		$ret['url'] = $siteRoot . '?id=' . $id;
	}
	catch (PDOException $e) {
		$ret['status'] = false;
		$ret['errors'][] = 'Database error: ' . $e->getMessage() . "\n";
		
		return $ret;
	}
	
	return $ret;
}

function getName($get) {
	$ret = '';
	
	if (isset($get['firstName']))
		$ret .= $get['firstName'];
	if (isset($get['firstName']) && isset($get['lastName']))
		$ret .= ' ';
	if (isset($get['lastName']))
		$ret .= $get['lastName'];
	
	return $ret;
}

?>
