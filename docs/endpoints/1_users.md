---
layout: default
title: Users
group: endpoint
permalink: /users/
---
# Users endpoint

This section gives you information about users in [Goteo.org](http://goteo.org)

<a name="users"></a>
## /reports/users/

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/users/
```

Obtains a list of users.
### Filters available:


### Response values:

| Attribute  | Type | Description |
| ------------- | ------------- | ------------ |
| **id** | *string* | Unique identifier for the user in Goteo |