<?php

// The post script adds a new post, displays an error if there was a problem

// Get the information the user submitted
$title = $_POST['title'];
$author = $_POST['author'];
$body = $_POST['body'];

// Check for errors
$error = false;
$error_message = '';

if (empty($title))
{
	$error = true;
	$error_message = 'You must specify a title';
}
else if (empty($author))
{
	$error = true;
	$error_message = 'You must specify an author name';
}
else if (empty($body))
{
	$error = true;
	$error_message = 'You must fill in the comment body';
}
else
{
	// Connect to the database
	$db = new PDO('sqlite:blog.sq3');
	$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	
	// Construct our INSERT query
	$query  = "INSERT INTO posts (title, author, body, date) VALUES (";
	$query .= $db->quote($title) . ", ";
	$query .= $db->quote($author) . ", ";
	$query .= $db->quote($body) . ", ";
	$query .= $db->quote(date("Y-m-d g:h A")) . ")";
	
	// Add the comment
	$result = $db->query($query);
	
	// If there was a problem, flag an error
	if (!$result)
	{
		$error = true;
		$error_message = 'Unable to add post';
	}
}

$page_title = '';
if ($error)
{
	$page_title = 'Error adding post';
	$page_body = '<div class="error">' . $error_message . '</div>';
}
else
{
	$page_title = 'Post added';
	$page_body = '<div class="information">Post added. <a href="index.php">Go back</a></div>';
}


echo '<html>';
echo '<head>';
echo '<title>$page_title</title>';
echo '</head>';
echo '<body>';
echo $page_body;
echo '</body>';
echo '</html>';

?>