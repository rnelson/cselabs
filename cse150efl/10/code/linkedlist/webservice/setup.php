<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
		<title>Query Setup</title>
	</head>
	<body>
<?php

require_once('constants.php');

if (file_exists($dbFile)) {
?>
		<strong>Error:</strong> Query has already been set up. Please delete <?= $dbFile ?> if you want to rerun setup. <em>Note</em>: 
		This will destroy all saved queries.
<?php
}
else {
	$db = new PDO($dsn);
	
	// Add the configuration table
	$sql = 'CREATE TABLE config (version INTEGER)';
	$db->prepare($sql)->execute();
	
	// Add the query tables
	$sql = 'CREATE TABLE google (name TEXT, user TEXT, query TEXT)';
	$db->prepare($sql)->execute();
	
	// Add the version information to the config table
	$sql = 'INSERT INTO config VALUES (1)';
	$db->prepare($sql)->execute();
	
	// Add a few queries
	$sql = 'INSERT INTO google VALUES (\'Ross Nelson\', \'rnelson\', \'Rise Against\')';
	$db->prepare($sql)->execute();
	$sql = 'INSERT INTO google VALUES (\'Ross Nelson\', \'rnelson\', \'Dawn of the Dead\')';
	$db->prepare($sql)->execute();
	$sql = 'INSERT INTO google VALUES (\'Ross Nelson\', \'rnelson\', \'quit looking at my searches\')';
	$db->prepare($sql)->execute();
	$sql = 'INSERT INTO google VALUES (\'Ross Nelson\', \'rnelson\', \'Bad Religion\')';
	$db->prepare($sql)->execute();
	$sql = 'INSERT INTO google VALUES (\'Ross Nelson\', \'rnelson\', \'Pomplamoose\')';
	$db->prepare($sql)->execute();
	$sql = 'INSERT INTO google VALUES (\'Ross Nelson\', \'rnelson\', \'CSCE 150EFL site:cse.unl.edu\')';
	$db->prepare($sql)->execute();
	$sql = 'INSERT INTO google VALUES (\'Ross Nelson\', \'rnelson\', \'Ibanez\')';
	$db->prepare($sql)->execute();
	$sql = 'INSERT INTO google VALUES (\'Ross Nelson\', \'rnelson\', \'Doctor Who\')';
	$db->prepare($sql)->execute();
	$sql = 'INSERT INTO google VALUES (\'Ross Nelson\', \'rnelson\', \'FreeBSD\')';
	$db->prepare($sql)->execute();
	$sql = 'INSERT INTO google VALUES (\'Ross Nelson\', \'rnelson\', \'Boondock Saints\')';
	$db->prepare($sql)->execute();
?>
	<strong>Success!</strong> Setup is complete. <a href="./?id=1">Home</a>
<?php
}

?>
	</body>
</html>
