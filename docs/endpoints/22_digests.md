---
layout: default
title: Digests
group: endpoint
permalink: /doc/digests.html
---
# Digests endpoint

This section allows to automatically group the information provided from other endpoints in predefined intervals of dates.

For example, you can retrieve all money reports given by the [/reports/money/](/doc/reports/#money) endpoint in 13 different chunks, 12 corresponding to the 12 months of the year and the last one for whole year itself. 

<a name="digests"></a>
## /digests/{ENDPOINT}

Retrieves the same information given by the endpoint specified in {ENDPOINT} divided in several periods of time.

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/digests/reports/money/?year=2014
```


### Filters available
**Some of the [standard set of filters](/doc/filters) plues some more applies to this endpoint:**

{{ site.data.digests.parameters_table }}

* **page** and **limit** are not available in this endpoint
* **from_date** and **to_date** are not available in this endpoint
* Parameter **year** allows to specify witch year you want the digest from. Data will return in 12 buckets, one for each month of the year.
* If the parameter **year** is not specified, then the information will be chunked in buckets of one year duration. Starting at the year 2011 (when the platform Goteo started).

### Response values:

{{ site.data.digests.definitions_table }}

### Types of buckets:

Every item in the bucket array represents a particular period of time.

If the parameter **year** is present then the period is a month in the specified year.

If the parameter  **year** is not present, the period is a year in the history of Goteo. All years from the beginning (year 2011) will be returned.

In any case, always and additional "global" item will be returned representing the sum of all the periods.

#### Response example without the "year" parameter:

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/digests/{SOME-ENDPOINT}/
```

```json
{
  "buckets": {
    "2011": {
      
      ... endpoint data for the year 2011 ...
      
      "meta": {
        "from_date": "2011-01-01",
        "to_date": "2011-12-31"
      }
    },
    "2012": {
      
      ... endpoint data for the year 2012 ...

      "meta": {
        "from_date": "2012-01-01",
        "to_date": "2012-12-31"
      }
    },
    
    ...

  },
  "endpoint": "reports/money",
  "global": {

    ... endpoint data for from the beginning of times...

  }
}
```

#### Response example with the "year" set to 2014:

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/digests/{SOME-ENDPOINT}/?year=2014
```

```json
{
  "buckets": {
    "01": {
      
      ... endpoint data for January 2014 ...
      
      "meta": {
        "from_date": "2014-01-01",
        "to_date": "2014-01-31"
      }
    },
    "02": {
      
      ... endpoint data for February 2014 ...

      "meta": {
        "from_date": "2014-02-01",
        "to_date": "2014-02-28"
      }
    },
    
    ...

  },
  "endpoint": "reports/community",
  "global": {

    ... endpoint data for from the beginning of times...
    
    "meta": {
      "from_date": "2014-01-01",
      "to_date": "2014-12-31"
    },
  }
}
```


### Allowed endpoints to digest

Not all endpoints can be digested, these are the available ones:

* [reports/summary](/doc/reports#summary)
* [reports/money](/doc/reports#money)
* [reports/community](/doc/reports#community)
* [reports/projects](/doc/reports#projects)
* [reports/rewards](/doc/reports#rewards)
* [categories](/doc/categories)
* [licenses](/doc/licenses)

### Examples

#### Digesting the money reports for the full history of Goteo:

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/digests/reports/money/
```

Response:

```json
{{ site.data.digests.example }}
```


#### Digesting the licenses used in the year 2014 in a radius of 100Km around Barcelona city:

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/digests/licenses/?year=2014&location=41.38879,2.15899,100
```

Response:

```json
{{ site.data.digests1.example }}
```

