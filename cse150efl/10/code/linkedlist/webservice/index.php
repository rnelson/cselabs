<?php
	require_once('constants.php');

	// Set up our defaults
	$name = '';
	$username = '';
	$query = 'Fortran';
	
	// Force it to be Google for now. TODO: support other queries
	$type = 'g';
	
	if ($type == 'g') {
		// If the user specified a query, look it up
		if (isset($_GET['id'])) {
			$db = new PDO($dsn);
			
			$statement = $db->prepare($googleSelectQuery);
			$statement->bindValue(':id', $_GET['id'], PDO::PARAM_INT);
			$success = $statement->execute();
			
			if ($success) {
				// Grab the query information
				$res = $statement->fetch(PDO::FETCH_ASSOC);
				
				if (empty($res['name']) || empty($res['user']) || empty($res['query'])) {
					// If part/all of the information is missing, likely meaning the query doesn't
					// exist at all in the database, just send them back to the root
					header('Location: ' . $siteRoot);
				}
				else {
					$name = $res['name'];
					$username = $res['user'];
					$query = $res['query'];
				}
			}
		}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
		<title>Google Search: <?= $query ?></title>
		<link rel="stylesheet" type="text/css" href="google.css" />
		<script src="http://www.google.com/jsapi" type="text/javascript"></script>
		<script src="google.js" language="javascript"></script>
	</head>
	<body>
		<div id="query"><?= $query ?></div>
		<div id="content">
			<div id="resultCount">
			</div>
			<div id="createdBy">Query created by <span id="created_name"><?= $name ?></span> (<span id="created_username"><?= $username ?></span>)</div>
			<div id="results">
			</div>
		</div>
	</body>
</html>
<?php
	}
?>
