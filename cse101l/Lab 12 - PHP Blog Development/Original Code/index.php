<?php

// The index page will display all of the posts and their comments

echo '<html>';
echo '<head>';
echo '<title>My Awesome Blog</title>';
echo '</head>';
echo '<body>';

// First, we need to connect to the database
$db = new PDO('sqlite:blog.sq3');
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

// This query will get every post in the system. By ordering (in reverse
// order, "DESC") we can get the newest posts first
$posts = $db->query('SELECT * FROM posts ORDER BY id DESC');

echo '<div id="header-wrapper">';
echo '<div id="header">';
echo '</div></div>';
echo '<div id="content-wrapper">';
echo '<div id="content">';
echo '<div id="posts">';

// Use a foreach loop to display the posts
foreach ($posts as $post)
{
	// Get comments for the post
	$comments = $db->query('SELECT * FROM comments WHERE post_id=' . $post['id']);
	
	// Surround the entire post in a <div>
	echo '<div class="post">';
	
	// Add the information about the post
	echo '<h2 class="post_title">' . $post['title'] . '</h2>';
	echo '<h3 class="post_author">by ' . $post['author'] . '</h3>';
	echo '<h3 class="post_date">Date: ' . $post['date'] . '</h3>';
	
	// Add the post body
	echo '<p class="post_body">' . $post['body'] . '</p>';
	
	// Comments
	echo '<div class="comments_header">Comments</div>';
	if (count($comments) > 0)
	{
		// Do the same thing with all of the comments for the post
		echo '<div class="comments">';
		
		foreach ($comments as $comment)
		{
			echo '<div class="comment">';
			
			echo '<h3 class="comment_title">' . $comment['title'] . ' <span class="comment_id">(#' . $comment['id'] . ')</span></h3>';
			echo '<h4 class="comment_author">by ' . $comment['author'] . '</h4>';
			
			echo '<h4 class="comment_date">' . $comment['date'] . '</h4>';
			echo '<p class="comment_body">' . $comment['body'] . '</p>';
			
			echo '</div>';
		}
		
		echo '<div class="comment_form_header">Add a Comment</div>';
		echo '<div class="comment_form">';
		echo '<form action="comment.php" method="post">';
		echo '<div class="comment_form_title">Title: <input type="text" name="title" /></div>';
		echo '<div class="comment_form_author">Name: <input type="text" name="author" /></div>';
		echo '<div class="comment_form_body">Body: <textarea name="body" rows="5" cols="20"></textarea></div>';
		echo '<input type="hidden" name="post_id" value="' . $post['id'] . '" />';
		echo '<div class="comment_form_submit"><input type="submit" value="Add Comment" /></div>';
		echo '</form>';
		echo '</div>';
		
		echo '</div>'; // comments
	}
	
	echo '</div>'; // post
}

echo '</div>'; // posts
echo '</div>'; // content
echo '</div>'; // content-wrapper

echo '</body>';
echo '</html>';

?>