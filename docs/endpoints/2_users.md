---
layout: default
title: Users
group: endpoint
permalink: /doc/users/
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
**The [standard set of filters](/doc/filters) applies to this endpoint with these particulars:**

{{ site.data.users.parameters_table }}

* **location** does not applies to this endpoint.
* **lang** does not applies in this endpoint

### Response values:

| Attribute  | Type | Description |
| ------------- | ------------- | ------------ |
| * **items** | *array* | An array (limited to the maximum results per page specified in filters) with the list of users |
| **meta** | *array* | Additionally, extra information will be provided here (such as pagination or parameter filtering ) |

#### * Array sub-fields:

**items** returns an array of the following object:

{{ site.data.users.definitions_table }}

### Response body:

```json
{{ site.data.users.example }}
```

<a name="user"></a>
## /users/{USER_ID}

Gets information about a single user.

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/users/olivier/
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
