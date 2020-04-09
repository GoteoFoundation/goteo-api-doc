---
layout: default
title: Users
group: endpoint
permalink: /doc/users.html
---
# Users endpoint

This section gives you information about users in [Goteo.org](http://goteo.org)

<a name="users"></a>
## /users/

Obtains a list of users.

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/users/
```

### Filters available:
**The [standard set of filters](filters.html) applies to this endpoint with these particulars:**

{{ site.data.users.parameters_table }}

* **location** does not applies to this endpoint.
* **lang** does not applies in this endpoint

### Response values:

{{ site.data.users.definitions_table }}

### Response body:

```json
{{ site.data.users.example }}
```

<a name="user"></a>
## /users/{USER_ID}

Gets information about a single user.

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/users/goteo
```

### Filters available:

* No filters are available in this endpoint
* **{USER_ID}** must be the unique identifier of the user


### Response values:

{{ site.data.user.definitions_table }}

### Response body:

```json
{{ site.data.user.example }}
```
