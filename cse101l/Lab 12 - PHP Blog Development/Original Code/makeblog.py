#!/usr/bin/env python
import sqlite3
import sys

#  POSTS
#     :id       => integer (primary key)
#     :title    => text
#     :body     => text
#     :author   => text
#     :date     => text
#  
#  COMMENTS
#     :id       => integer (primary key)
#     :author   => text
#     :title    => text
#     :body     => text
#     :date     => text
#     :post_id  => integer (foreign key, posts::id)

# Open the database
conn = sqlite3.connect('blog.sq3')
cur = conn.cursor()


# Create the tables listed above
posts    = 'CREATE TABLE posts (id INTEGER PRIMARY KEY, title TEXT, body TEXT, author TEXT, date TEXT)'
comments = 'CREATE TABLE comments (id INTEGER PRIMARY KEY, author TEXT, title TEXT, body TEXT, date TEXT, post_id INTEGER)'

cur.execute(posts)
cur.execute(comments)


# Add some default data for us to work with
addPost    = 'INSERT INTO posts (title, body, author, date) VALUES ("Hello, World!", "This is my blog. Do you like it? It\'s very simple and not very good, but it works. :-)", "Blog", "2009-04-15 1:30 PM")'
addComment = 'INSERT INTO comments (author, title, body, date, post_id) VALUES ("Anonymous", "Nice!", "I like it. I like it a lot.", "2009-04-15 2:11 PM", 1)'

cur.execute(addPost)
cur.execute(addComment)


# Make sure the changes get saved to disk
conn.commit()
