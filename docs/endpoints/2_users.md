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
* **location** Although this filter is available, only the user that have specifically allowed to be located will be listed.
* **lang** does not applies in this endpoint

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
| **profile-image-url** | *string* | URL with the avatar (image) of the user |
| **profile-url** | *string* | URL for the user profile |
| **date-created** | *datetime* | Date when the user was created [RFC822 format](http://validator.w3.org/feed/docs/error/InvalidRFC2822Date.html) |

### Response body:
```json
{
  "items": [
    {
      "date-created": "Fri, 30 Jan 2015 18:32:27 GMT",
      "id": "19preguntes",
      "name": "Llu\u00eds Nacenta",
      "node": "goteo",
      "profile-image-url": "https://goteo.org/img/medium/la_gota.png",
      "profile-url": "https://goteo.org/user/profile/19preguntes"
    },
    {
      "date-created": "Wed, 11 Feb 2015 16:00:30 GMT",
      "id": "aecheverri",
      "name": "Alberto Echeverri",
      "node": "goteo",
      "profile-image-url": "https://goteo.org/img/medium/la_gota.png",
      "profile-url": "https://goteo.org/user/profile/aecheverri"
    },
    {
      "date-created": "Fri, 17 May 2013 08:39:32 GMT",
      "id": "albertofortes",
      "name": "Alberto Fortes",
      "node": "goteo",
      "profile-image-url": "https://goteo.org/img/medium/04ba5aacf66bc170fd89ab936bc3aa6ad-404",
      "profile-url": "https://goteo.org/user/profile/albertofortes"
    },
    {
      "date-created": "Thu, 12 Feb 2015 06:45:59 GMT",
      "id": "alejandro-posada",
      "name": "Alejoposada",
      "node": "goteo",
      "profile-image-url": "https://goteo.org/img/medium/la_gota.png",
      "profile-url": "https://goteo.org/user/profile/alejandro-posada"
    },
    {
      "date-created": "Wed, 20 Jun 2012 09:16:24 GMT",
      "id": "alfons",
      "name": "Alf",
      "node": "goteo",
      "profile-image-url": "https://goteo.org/img/medium/la_gota.png",
      "profile-url": "https://goteo.org/user/profile/alfons"
    },
    {
      "date-created": "Wed, 25 Sep 2013 15:52:39 GMT",
      "id": "ali-ve",
      "name": "alicia vela",
      "node": "goteo",
      "profile-image-url": "https://goteo.org/img/medium/la_gota.png",
      "profile-url": "https://goteo.org/user/profile/ali-ve"
    },
    {
      "date-created": "Thu, 05 Feb 2015 15:07:24 GMT",
      "id": "alicia-escobio",
      "name": "Alicia Escobio",
      "node": "goteo",
      "profile-image-url": "https://goteo.org/img/medium/1511363-10203618275965842-3134443303106447142-n.jp",
      "profile-url": "https://goteo.org/user/profile/alicia-escobio"
    },
    {
      "date-created": "Sat, 31 Jan 2015 11:51:18 GMT",
      "id": "aliciarosello",
      "name": "Al\u00edcia Rosell\u00f3",
      "node": "goteo",
      "profile-image-url": "https://goteo.org/img/medium/aliciarosello.jpg",
      "profile-url": "https://goteo.org/user/profile/aliciarosello"
    },
    {
      "date-created": "Wed, 27 Feb 2013 14:26:47 GMT",
      "id": "amoya62",
      "name": "Alvaro Moya",
      "node": "euskadi",
      "profile-image-url": "https://goteo.org/img/medium/img-20140227-wa0000.jpg",
      "profile-url": "https://goteo.org/user/profile/amoya62"
    },
    {
      "date-created": "Tue, 10 Feb 2015 19:39:08 GMT",
      "id": "ana-gale",
      "name": "3ANGLE7",
      "node": "goteo",
      "profile-image-url": "https://goteo.org/img/medium/la_gota.png",
      "profile-url": "https://goteo.org/user/profile/ana-gale"
    }
  ],
  "meta": {
    "limit": 10,
    "page": 0,
    "project": [
      "lautomatica"
    ],
    "total": 219
  }
}
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

| Attribute  | Type | Description |
| ------------- | ------------- | ------------ |
| **id** | *string* | Unique identifier for the user in Goteo |
| **name** | *string* | Name of the user |
| **node** | *string* | Node where the user was created originally |
| **profile-image-url** | *string* | URL with the avatar (image) of the user |
| **profile-url** | *string* | URL for the user profile |
| **date-created** | *datetime* | Date when the user was created [RFC822 format](http://validator.w3.org/feed/docs/error/InvalidRFC2822Date.html) |

### Response body:
```json
{
  "date-created": "Wed, 01 Jun 2011 09:19:29 GMT",
  "id": "olivier",
  "name": "Olivier",
  "node": "goteo",
  "profile-image-url": "https://goteo.org/img/medium/ici-olivier-lift-losange.png",
  "profile-url": "https://goteo.org/user/profile/olivier",
  "time-elapsed": 0.12132906913757324
}
```
