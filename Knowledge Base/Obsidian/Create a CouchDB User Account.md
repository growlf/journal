---
tags:
  - guide
  - couchdb
---
## Creating Users
Use the Permissions tab of the database in Fauxton (i.e. `https://couchdb-address/_utils` ) to create a role ("member") - that will allow permissions.  Then create a new user that implements that role like so in the `_users` database:
```
{
"_id": "org.couchdb.user:newuser",
"name": "newuser",
"password": "securepassword",
"roles": ["member"],
"type": "user"
}
```
Replace both instances of `newuser` with the new user name (keep it lowercase), and use a clear-text password to replace `securepassword` (dont worry, it will get encrypted when you save the document).
