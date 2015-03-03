---
layout: default
title: Categories
group: endpoint
permalink: /doc/categories/
---
# Categories endpoint

This section gives you information about the categories used by projects or users in [Goteo.org](http://goteo.org)

<a name="categories"></a>
## /reports/categories/

Obtains a list of categories.

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/categories/
```

### Filters available:
**The [standard set of filters](/doc/filters) applies to this endpoint with these particulars:**

* **from_date** and **to_date** restricts the list to the categories used in projects created between that dates
* **node** restricts the list to the categories used in projects assigned in that nodes
* **category** restricts the list to the categories used in projects in that categories
* **project** restricts the list to the categories used in that projects
* **location** restricts the list to the categories used in projects geolocated in that area.

### Response values:

| Attribute  | Type | Description |
| ------------- | ------------- | ------------ |
| * **items** | *array* | An array with the list of categories |
| **meta** | *array* | Additionally, extra information will be provided here (such as parameter filtering) |

#### * Array sub-fields:

**items** returns an array of the following object:

| Attribute  | Type | Description |
| ------------- | ------------- | ------------ |
| **id** | *string* | Unique identifier for the category in Goteo |
| **name** | *string* | Name of the category |
| **description** | *string* | Description for the category |
| **total-projects** | *number* | Number of published projects in that category |
| **total-users** | *number* | Number of users interested in that category |

### Response body
```json
{
  "items": [
    {
      "description": "Gizarte eraldaketa bultzatzen dituzten proiektuak, ongizate handiagoa lortzeko, giza harremanetan ematen diren arazoak ebatzi edo/eta  giza harremanak indartuz.\r\n",
      "id": "2",
      "name": "Soziala",
      "total-projects": 323,
      "total-users": 4609
    },
    {
      "description": "Arazo edo behar konkretuak ebazteko garapen teknikoak, software, hardware, herramintak etar.",
      "id": "7",
      "name": "Teknologikoa",
      "total-projects": 123,
      "total-users": 2704
    },
    {
      "description": "\r\nIrabazi ekonomikoak sortuz, enpresa-ekimenen bat bihurtzeko asmoa duten propiektuak.",
      "id": "9",
      "name": "Komertziala",
      "total-projects": 66,
      "total-users": 1354
    },
    {
      "description": "",
      "id": "16",
      "name": "Design",
      "total-projects": 48,
      "total-users": 817
    },
    {
      "description": "Berri ematea, salaketa, komunikazio helburua duten proiektuak (adibidez herri kazetaritza, dokumentalak. blogak, irrati programak).",
      "id": "6",
      "name": "Komunikatiboa",
      "total-projects": 159,
      "total-users": 2227
    },
    {
      "description": "Formakuntza edo ikaskuntza helburu nagusia duten proiektuak. ",
      "id": "10",
      "name": "Hezigarria",
      "total-projects": 258,
      "total-users": 3613
    },
    {
      "description": "Zentzu zabalean helburu artistiko eta kulturalak dituzten proiektuak. ",
      "id": "11",
      "name": "Kulturala",
      "total-projects": 234,
      "total-users": 3607
    },
    {
      "description": "Ingurumenaren zainketa, jasangarritasun eta/edo aniztasun biologikoarekin harremanetan dauden proiektuak.",
      "id": "13",
      "name": "Ekologikoa",
      "total-projects": 141,
      "total-users": 2754
    },
    {
      "description": "Zenbait gaien ikasketak edo ikerketak, erantzun, azalpen, ebazpen berriak bilatzen dituzten proiektuak.",
      "id": "14",
      "name": "Zientifikoa",
      "total-projects": 55,
      "total-users": 1817
    }
  ],
  "meta": {
    "lang": [
      "eu",
      "en"
    ],
    "total": 9
  }
}
```