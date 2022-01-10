#Bookmark Manager App

User Story 1
------------

```
As a user
So I can re-visit my favourite sites
I want to see a list of saved bookmarks

```

Domain Model
------------

![Alt text](screenshots/user_Story_1_DM.png?raw=true "index view")

Setting up the Database
-----------------------

Run `psql` in the terminal and create the `bookmark_manager` database:
```CREATE DATABASE bookmark_manager;```
To set up the appropriate tables, connect to the database in psql and run the SQL scripts in the db/migrations folder in the given order.


