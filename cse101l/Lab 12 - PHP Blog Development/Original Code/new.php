<?php

echo '<html>';
echo '<head>';
echo '<title>New Blog Post</title>';
echo '</head>';
echo '<body>';

echo '<div id="header-wrapper">';
echo '<div id="header">';
echo '</div></div>';
echo '<div id="content-wrapper">';
echo '<div id="content">';

echo '<div class="post_form_header">New Post</div>';
echo '<div class="post_form">';
echo '<form action="post.php" method="post">';
echo '<div class="post_form_title">Title: <input type="text" name="title" /></div>';
echo '<div class="post_form_author">Name: <input type="text" name="author" /></div>';
echo '<div class="post_form_body">Body: <textarea name="body" rows="5" cols="20"></textarea></div>';
echo '<div class="post_form_submit"><input type="submit" value="Add Post" /></div>';
echo '</form>';
echo '</div>';

echo '</div>'; // content
echo '</div>'; // content-wrapper

echo '</body>';
echo '</html>';

?>
