---
tags:
  - couchdb
  - tricks
---
## Limit Git Uploads
Add a design doc to a CouchDB database to prevent `.git/` directory from uploading:
```json
{
  "_id": "_design/_git_no_more",
  "updates": {"prevent_git_updates": "function(doc,req){if(doc&&doc._id&&doc._id.startsWith('.git')){doc._deleted=!0;return[doc,'Document with .git ID marked for deletion.']}else{var body=JSON.parse(req.body);for(var key in body){doc[key]=body[key]}\n return[doc,'Document updated successfully.']}}"}
}
```
