<?php

// *
$siteRoot = 'http://cse.unl.edu/~cse150efl/query/';
$dbFile = 'query.sq3';
$dsn = 'sqlite:/home/grad/Classes_102/cse150efl/public_html/query/' . $dbFile;

$supportedQueriesString = 'google';

// Google
$googleInsertQuery = 'INSERT INTO google(name, user, query) VALUES (:name, :user, :query)';
$googleSelectQuery = 'SELECT name, user, query FROM google WHERE rowid=:id';

?>