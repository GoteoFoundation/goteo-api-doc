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

* **from_date** and **to_date** restricts the list to the users created in that range
* **node** restricts the list to the users originally created in that node(s)
* **category** restricts the list to the users that have interests in that category(ies)
* **project** restricts the list to the users that have either collaborate or contributed (financially) to that project(s).
* **location** restricts the list to the users that have allowed to be geolocated in that area.

### Response values:

| Attribute  | Type | Description |
| ------------- | ------------- | ------------ |
| * **items** | *array* | An array (limited to the maximum results per page specified in filters) with the list of users |
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

<a name="user"></a>
## /users/{USER_ID}

Gets information about a single user.

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/users/olivier
```

### Filters available:
* No filters are available in this endpoint
* **{USER_ID}** must be the unique identifier of the user


### Response values:

| Attribute  | Type | Description |
| ------------- | ------------- | ------------ |
| **id** | *string* | Unique identifier for the user in Goteo |
| **name** | *string* | Name of the user |
| **node** | *string* | Node where the user was created originally |
| **profile_image_url** | *string* | URL with the avatar (image) of the user |
| **date_created** | *datetime* | Date when the user was created [RFC822 format](http://validator.w3.org/feed/docs/error/InvalidRFC2822Date.html) |

### Response body:
```json
{
  "items": [
    {
      "date_created": "Fri, 30 Jan 2015 18:32:27 -0000",
      "id": "19preguntes",
      "name": "Llu\u00eds Nacenta",
      "node": "goteo",
      "profile_image_url": "http://goteo.org/img/512x512c/la_gota.png"
    },
    {
      "date_created": "Wed, 11 Feb 2015 16:00:30 -0000",
      "id": "aecheverri",
      "name": "Alberto Echeverri",
      "node": "goteo",
      "profile_image_url": "http://goteo.org/img/512x512c/la_gota.png"
    },
    {
      "date_created": "Thu, 12 Feb 2015 06:45:59 -0000",
      "id": "alejandro-posada",
      "name": "Alejoposada",
      "node": "goteo",
      "profile_image_url": "http://goteo.org/img/512x512c/la_gota.png"
    },
    {
      "date_created": "Wed, 20 Jun 2012 09:16:24 -0000",
      "id": "alfons",
      "name": "Alf",
      "node": "goteo",
      "profile_image_url": "http://goteo.org/img/512x512c/la_gota.png"
    },
    {
      "date_created": "Wed, 25 Sep 2013 15:52:39 -0000",
      "id": "ali-ve",
      "name": "alicia vela",
      "node": "goteo",
      "profile_image_url": "http://goteo.org/img/512x512c/la_gota.png"
    },
    {
      "date_created": "Thu, 05 Feb 2015 15:07:24 -0000",
      "id": "alicia-escobio",
      "name": "Alicia Escobio",
      "node": "goteo",
      "profile_image_url": "http://goteo.org/img/512x512c/1511363-10203618275965842-3134443303106447142-n.jp"
    },
    {
      "date_created": "Sat, 31 Jan 2015 11:51:18 -0000",
      "id": "aliciarosello",
      "name": "Al\u00edcia Rosell\u00f3",
      "node": "goteo",
      "profile_image_url": "http://goteo.org/img/512x512c/aliciarosello.jpg"
    },
    {
      "date_created": "Wed, 27 Feb 2013 14:26:47 -0000",
      "id": "amoya62",
      "name": "Alvaro Moya",
      "node": "euskadi",
      "profile_image_url": "http://goteo.org/img/512x512c/img-20140227-wa0000.jpg"
    },
    {
      "date_created": "Tue, 10 Feb 2015 19:39:08 -0000",
      "id": "ana-gale",
      "name": "3ANGLE7",
      "node": "goteo",
      "profile_image_url": "http://goteo.org/img/512x512c/la_gota.png"
    },
    {
      "date_created": "Sat, 31 Jan 2015 15:27:34 -0000",
      "id": "ana-posada",
      "name": "Ana posada",
      "node": "goteo",
      "profile_image_url": "http://goteo.org/img/512x512c/la_gota.png"
    }
  ],
  "meta": {
    "limit": 10,
    "page": 0,
    "project": [
      "lautomatica"
    ],
    "total": 212
  }
}
```