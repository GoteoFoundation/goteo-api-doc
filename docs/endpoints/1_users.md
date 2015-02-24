---
layout: default
title: Users
group: endpoint
permalink: /doc/users/
---
# Users endpoint

This section gives you information about users in [Goteo.org](http://goteo.org)

<a name="users"></a>
## /reports/users/

Obtains a list of users.

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/users/
```

### Filters available:
* The [standard set of filters](/filters) applies to this endpoint
* **from_date** and **to_date** restricts the list to the users created in that range
* **node** restricts the list to the users originally created in that node(s)
* **category** restricts the list to the users that have interests in that category(ies)
* **project** restricts the list to the users that have either collaborate or contributed (financially) to that project(s).
* **location** restricts the list to the users that have allowed to be geolocated in that area.

### Response values:

| Attribute  | Type | Description |
| ------------- | ------------- | ------------ |
| * **items** | *array* | An array (limited to the maximum results per page specified in filters) with the list |
| **meta** | *array* | Additionally, extra information will be provided here (such as pagination or parameter filtering ) |

#### * Array sub-fields:

**items** returns an array of the following object:

| Attribute  | Type | Description |
| ------------- | ------------- | ------------ |
| **id** | *string* | Unique identifier for the user in Goteo |
| **name** | *string* | Name of the user |
| **node** | *string* | Node where the user was created originally |
| **profile_image_url** | *string* | URL with the avatar (image) of the user |
| **date_created** | *datetime* | Date when the user was created [RFC822 format](http://validator.w3.org/feed/docs/error/InvalidRFC2822Date.html) |

<a name="users"></a>
## /reports/user/$USER_ID

Gets information about a single user.

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/users/olivier
```

### Filters available:
* No filters are available in this endpoint
* **$USER_ID** must be the unique identifier of the user


### Response values:

| Attribute  | Type | Description |
| ------------- | ------------- | ------------ |
| **id** | *string* | Unique identifier for the user in Goteo |
| **name** | *string* | Name of the user |
| **node** | *string* | Node where the user was created originally |
| **profile_image_url** | *string* | URL with the avatar (image) of the user |
| **date_created** | *datetime* | Date when the user was created [RFC822 format](http://validator.w3.org/feed/docs/error/InvalidRFC2822Date.html) |