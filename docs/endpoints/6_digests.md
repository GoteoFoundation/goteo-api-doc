---
layout: default
title: Digests
group: endpoint
permalink: /doc/digests/
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
**The [standard set of filters](/doc/filters) applies to this endpoint with these particulars:**

* **page** and **limit** are not available in this endpoint
* **from_date** and **to_date** are not available in this endpoint

**Additionally, these filters are added to this endpoint:**

* Parameter **year** allows to specify witch year you want the digest from. Data will return in 12 buckets, one for each month of the year.
* If the parameter **year** is not specified, then the information will be chunked in buckets of one year duration. Starting at the year 2011 (when the platform Goteo started).

### Response values:

| Attribute  | Type | Description |
| ------------- | ------------- | ------------ |
| **buckets** | *array* | An associative array where the key is an identified of the period (usually the year or the month) and the value is the content of the endpoint. |
| **global** | *misc* | The content of the endpoint with the data of all the buckets together |
| **endpoint** | *string* | the name of the endpoint used to digest |

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
{
  "buckets": {
    "2011": {
      "average-donation": 35.32,
      "average-donation-paypal": 29.69,
      "average-failed": 863.67,
      "average-minimum": 3897.5,
      "average-received": 5618.83,
      "average-second-round": 467.0,
      "cash-amount": 840,
      "creditcard-amount": 22476,
      "fee-amount": 1880.8,
      "matchfund-amount": 0,
      "matchfundpledge-amount": 0,
      "meta": {
        "from_date": "2011-01-01",
        "to_date": "2011-12-31"
      },
      "paypal-amount": 5072,
      "percentage-pledged-failed": 24.65,
      "percentage-pledged-successful": 44.52,
      "pledged": 28388,
      "refunded": 4281
    },
    "2012": {
      "average-donation": 41.3,
      "average-donation-paypal": 29.68,
      "average-failed": 584.59,
      "average-minimum": 4236.08,
      "average-received": 5298.86,
      "average-second-round": 611.81,
      "cash-amount": 21012,
      "creditcard-amount": 334771,
      "fee-amount": 32729.04,
      "matchfund-amount": 0,
      "matchfundpledge-amount": 0,
      "meta": {
        "from_date": "2012-01-01",
        "to_date": "2012-12-31"
      },
      "paypal-amount": 83049,
      "percentage-pledged-failed": 20.51,
      "percentage-pledged-successful": 27.82,
      "pledged": 438832,
      "refunded": 25218
    },
    "2013": {
      "average-donation": 48.69,
      "average-donation-paypal": 40.98,
      "average-failed": 915.94,
      "average-minimum": 5048.62,
      "average-received": 6828.76,
      "average-second-round": 1065.85,
      "cash-amount": 33676,
      "creditcard-amount": 726846,
      "fee-amount": 71313.76,
      "matchfund-amount": 38375,
      "matchfundpledge-amount": 52000,
      "meta": {
        "from_date": "2013-01-01",
        "to_date": "2013-12-31"
      },
      "paypal-amount": 141104,
      "percentage-pledged-failed": 22.42,
      "percentage-pledged-successful": 29.67,
      "pledged": 940001,
      "refunded": 47339
    },
    "2014": {
      "average-donation": 48.76,
      "average-donation-paypal": 36.86,
      "average-failed": 1293.25,
      "average-minimum": 5161.14,
      "average-received": 6257.58,
      "average-second-round": 999.47,
      "cash-amount": 72173,
      "creditcard-amount": 610659,
      "fee-amount": 59277.76,
      "matchfund-amount": 19563,
      "matchfundpledge-amount": 22000,
      "meta": {
        "from_date": "2014-01-01",
        "to_date": "2014-12-31"
      },
      "paypal-amount": 97985,
      "percentage-pledged-failed": 25.11,
      "percentage-pledged-successful": 23.86,
      "pledged": 800380,
      "refunded": 59358
    },
    "2015": {
      "average-donation": 61.75,
      "average-donation-paypal": 64.2,
      "average-failed": 963.33,
      "average-minimum": 6502.5,
      "average-received": 11608.5,
      "average-second-round": 2263.5,
      "cash-amount": 32500,
      "creditcard-amount": 156333,
      "fee-amount": 14931.36,
      "matchfund-amount": 0,
      "matchfundpledge-amount": 0,
      "meta": {
        "from_date": "2015-01-01",
        "to_date": "2015-03-24"
      },
      "paypal-amount": 15640,
      "percentage-pledged-failed": 10.24,
      "percentage-pledged-successful": 51.17,
      "pledged": 204473,
      "refunded": 6923
    }
  },
  "endpoint": "reports/money",
  "global": {
    "average-donation": 48.38,
    "average-donation-paypal": 36.79,
    "average-failed": 937.9,
    "average-minimum": 4864.58,
    "average-received": 6262.13,
    "average-second-round": 1114.34,
    "cash-amount": 160201,
    "creditcard-amount": 1851085,
    "fee-amount": 180132.72,
    "matchfund-amount": 57938,
    "matchfundpledge-amount": 74000,
    "paypal-amount": 342850,
    "percentage-pledged-failed": 22.56,
    "percentage-pledged-successful": 27.74,
    "pledged": 2412074,
    "refunded": 143119
  }
}
```


#### Digesting the licenses used in the year 2014 in a radius of 100Km around Barcelona city:

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/digests/licenses/?year=2014&location=41.38879,2.15899,100
```

Response:

```json
{
  "buckets": {
    "01": {
      "items": [],
      "meta": {
        "from_date": "2014-01-01",
        "location": {
          "latitude": "41.38879",
          "longitude": "2.15899",
          "radius": 100
        },
        "to_date": "2014-01-31"
      }
    },
    "02": {
      "items": [
        {
          "description": "Licencia Creative Commons (bienes comunes creativos) con reconocimiento de autor\u00eda",
          "id": "ccby",
          "name": "CC - Reconocimiento",
          "svg-url": "https://goteoassets.org/api/svg/licenses/ccby.svg",
          "total-projects": 1,
          "total-rewards": 1,
          "url": "http://creativecommons.org/licenses/by/4.0/deed.es_ES"
        },
        {
          "description": "Licencia Creative Commons (bienes comunes creativos) con reconocimiento de autor\u00eda y sin que se pueda hacer uso comercial",
          "id": "ccbync",
          "name": "CC - Reconocimiento - NoComercial",
          "svg-url": "https://goteoassets.org/api/svg/licenses/ccbync.svg",
          "total-projects": 1,
          "total-rewards": 2,
          "url": "http://creativecommons.org/licenses/by-nc/2.0/deed.es_ES"
        },
        {
          "description": "Licencia Creative Commons (bienes comunes creativos) con reconocimiento de autor\u00eda y a compartir en id\u00e9nticas condiciones",
          "id": "ccbysa",
          "name": "CC - Reconocimiento - CompartirIgual",
          "svg-url": "https://goteoassets.org/api/svg/licenses/ccbysa.svg",
          "total-projects": 1,
          "total-rewards": 1,
          "url": "http://creativecommons.org/licenses/by-sa/2.0/deed.es_ES"
        }
      ],
      "meta": {
        "from_date": "2014-02-01",
        "location": {
          "latitude": "41.38879",
          "longitude": "2.15899",
          "radius": 100
        },
        "to_date": "2014-02-28",
        "total": 3
      }
    },
    "03": {
      "items": [
        {
          "description": "Licencia Creative Commons (bienes comunes creativos) con reconocimiento de autor\u00eda y sin que se pueda hacer uso comercial",
          "id": "ccbync",
          "name": "CC - Reconocimiento - NoComercial",
          "svg-url": "https://goteoassets.org/api/svg/licenses/ccbync.svg",
          "total-projects": 1,
          "total-rewards": 1,
          "url": "http://creativecommons.org/licenses/by-nc/2.0/deed.es_ES"
        },
        {
          "description": "Licencia Creative Commons (bienes comunes creativos) con reconocimiento de autor\u00eda, sin que se pueda hacer uso comercial y a compartir en id\u00e9nticas condiciones",
          "id": "ccbyncsa",
          "name": "CC - Reconocimiento - NoComercial - CompartirIgual",
          "svg-url": "https://goteoassets.org/api/svg/licenses/ccbyncsa.svg",
          "total-projects": 2,
          "total-rewards": 2,
          "url": "http://creativecommons.org/licenses/by-nc-sa/3.0/deed.es_ES"
        },
        {
          "description": "Licencia Creative Commons (bienes comunes creativos) con reconocimiento de autor\u00eda, sin que se pueda hacer uso comercial ni otras obras derivadas",
          "id": "ccbyncnd",
          "name": "CC - Reconocimiento - NoComercial - SinObraDerivada",
          "svg-url": "https://goteoassets.org/api/svg/licenses/ccbyncnd.svg",
          "total-projects": 1,
          "total-rewards": 1,
          "url": "http://creativecommons.org/licenses/by-nc-nd/2.0/deed.es_ES"
        },
        {
          "description": "Licencia Creative Commons (bienes comunes creativos) con reconocimiento de autor\u00eda y a compartir en id\u00e9nticas condiciones",
          "id": "ccbysa",
          "name": "CC - Reconocimiento - CompartirIgual",
          "svg-url": "https://goteoassets.org/api/svg/licenses/ccbysa.svg",
          "total-projects": 1,
          "total-rewards": 1,
          "url": "http://creativecommons.org/licenses/by-sa/2.0/deed.es_ES"
        }
      ],
      "meta": {
        "from_date": "2014-03-01",
        "location": {
          "latitude": "41.38879",
          "longitude": "2.15899",
          "radius": 100
        },
        "to_date": "2014-03-31",
        "total": 4
      }
    },
    "04": {
      "items": [
        {
          "description": "Licencia Creative Commons (bienes comunes creativos) con reconocimiento de autor\u00eda, sin que se pueda hacer uso comercial y a compartir en id\u00e9nticas condiciones",
          "id": "ccbyncsa",
          "name": "CC - Reconocimiento - NoComercial - CompartirIgual",
          "svg-url": "https://goteoassets.org/api/svg/licenses/ccbyncsa.svg",
          "total-projects": 2,
          "total-rewards": 4,
          "url": "http://creativecommons.org/licenses/by-nc-sa/3.0/deed.es_ES"
        },
        {
          "description": "Licencia Creative Commons (bienes comunes creativos) con reconocimiento de autor\u00eda, sin que se pueda hacer uso comercial ni otras obras derivadas",
          "id": "ccbyncnd",
          "name": "CC - Reconocimiento - NoComercial - SinObraDerivada",
          "svg-url": "https://goteoassets.org/api/svg/licenses/ccbyncnd.svg",
          "total-projects": 2,
          "total-rewards": 3,
          "url": "http://creativecommons.org/licenses/by-nc-nd/2.0/deed.es_ES"
        }
      ],
      "meta": {
        "from_date": "2014-04-01",
        "location": {
          "latitude": "41.38879",
          "longitude": "2.15899",
          "radius": 100
        },
        "to_date": "2014-04-30",
        "total": 2
      }
    },
    "05": {
      "items": [
        {
          "description": "Licencia Creative Commons (bienes comunes creativos) con reconocimiento de autor\u00eda",
          "id": "ccby",
          "name": "CC - Reconocimiento",
          "svg-url": "https://goteoassets.org/api/svg/licenses/ccby.svg",
          "total-projects": 1,
          "total-rewards": 2,
          "url": "http://creativecommons.org/licenses/by/4.0/deed.es_ES"
        },
        {
          "description": "Licencia Creative Commons (bienes comunes creativos) con reconocimiento de autor\u00eda, sin que se pueda hacer uso comercial y a compartir en id\u00e9nticas condiciones",
          "id": "ccbyncsa",
          "name": "CC - Reconocimiento - NoComercial - CompartirIgual",
          "svg-url": "https://goteoassets.org/api/svg/licenses/ccbyncsa.svg",
          "total-projects": 2,
          "total-rewards": 3,
          "url": "http://creativecommons.org/licenses/by-nc-sa/3.0/deed.es_ES"
        },
        {
          "description": "Licencia Creative Commons (bienes comunes creativos) con reconocimiento de autor\u00eda, sin que se pueda hacer uso comercial ni otras obras derivadas",
          "id": "ccbyncnd",
          "name": "CC - Reconocimiento - NoComercial - SinObraDerivada",
          "svg-url": "https://goteoassets.org/api/svg/licenses/ccbyncnd.svg",
          "total-projects": 1,
          "total-rewards": 1,
          "url": "http://creativecommons.org/licenses/by-nc-nd/2.0/deed.es_ES"
        },
        {
          "description": "Licencia Creative Commons (bienes comunes creativos) con reconocimiento de autor\u00eda y a compartir en id\u00e9nticas condiciones",
          "id": "ccbysa",
          "name": "CC - Reconocimiento - CompartirIgual",
          "svg-url": "https://goteoassets.org/api/svg/licenses/ccbysa.svg",
          "total-projects": 1,
          "total-rewards": 1,
          "url": "http://creativecommons.org/licenses/by-sa/2.0/deed.es_ES"
        },
        {
          "description": "Licencia Creative Commons de obra dedicada al dominio p\u00fablico, mediante renuncia a todos los derechos de autor\u00eda sobre la misma",
          "id": "cc0",
          "name": "CC0 Universal (Dominio P\u00fablico)",
          "svg-url": "https://goteoassets.org/api/svg/licenses/cc0.svg",
          "total-projects": 1,
          "total-rewards": 1,
          "url": "http://creativecommons.org/publicdomain/zero/1.0/deed.es"
        }
      ],
      "meta": {
        "from_date": "2014-05-01",
        "location": {
          "latitude": "41.38879",
          "longitude": "2.15899",
          "radius": 100
        },
        "to_date": "2014-05-31",
        "total": 5
      }
    },
    "06": {
      "items": [
        {
          "description": "Licencia Creative Commons de obra dedicada al dominio p\u00fablico, mediante renuncia a todos los derechos de autor\u00eda sobre la misma",
          "id": "cc0",
          "name": "CC0 Universal (Dominio P\u00fablico)",
          "svg-url": "https://goteoassets.org/api/svg/licenses/cc0.svg",
          "total-projects": 1,
          "total-rewards": 1,
          "url": "http://creativecommons.org/publicdomain/zero/1.0/deed.es"
        }
      ],
      "meta": {
        "from_date": "2014-06-01",
        "location": {
          "latitude": "41.38879",
          "longitude": "2.15899",
          "radius": 100
        },
        "to_date": "2014-06-30",
        "total": 1
      }
    },
    "07": {
      "items": [],
      "meta": {
        "from_date": "2014-07-01",
        "location": {
          "latitude": "41.38879",
          "longitude": "2.15899",
          "radius": 100
        },
        "to_date": "2014-07-31"
      }
    },
    "08": {
      "items": [],
      "meta": {
        "from_date": "2014-08-01",
        "location": {
          "latitude": "41.38879",
          "longitude": "2.15899",
          "radius": 100
        },
        "to_date": "2014-08-31"
      }
    },
    "09": {
      "items": [],
      "meta": {
        "from_date": "2014-09-01",
        "location": {
          "latitude": "41.38879",
          "longitude": "2.15899",
          "radius": 100
        },
        "to_date": "2014-09-30"
      }
    },
    "10": {
      "items": [],
      "meta": {
        "from_date": "2014-10-01",
        "location": {
          "latitude": "41.38879",
          "longitude": "2.15899",
          "radius": 100
        },
        "to_date": "2014-10-31"
      }
    },
    "11": {
      "items": [
        {
          "description": "Licencia Creative Commons (bienes comunes creativos) con reconocimiento de autor\u00eda, sin que se pueda hacer uso comercial ni otras obras derivadas",
          "id": "ccbyncnd",
          "name": "CC - Reconocimiento - NoComercial - SinObraDerivada",
          "svg-url": "https://goteoassets.org/api/svg/licenses/ccbyncnd.svg",
          "total-projects": 1,
          "total-rewards": 1,
          "url": "http://creativecommons.org/licenses/by-nc-nd/2.0/deed.es_ES"
        }
      ],
      "meta": {
        "from_date": "2014-11-01",
        "location": {
          "latitude": "41.38879",
          "longitude": "2.15899",
          "radius": 100
        },
        "to_date": "2014-11-30",
        "total": 1
      }
    },
    "12": {
      "items": [
        {
          "description": "Licencia Creative Commons (bienes comunes creativos) con reconocimiento de autor\u00eda, sin que se pueda hacer uso comercial y a compartir en id\u00e9nticas condiciones",
          "id": "ccbyncsa",
          "name": "CC - Reconocimiento - NoComercial - CompartirIgual",
          "svg-url": "https://goteoassets.org/api/svg/licenses/ccbyncsa.svg",
          "total-projects": 1,
          "total-rewards": 1,
          "url": "http://creativecommons.org/licenses/by-nc-sa/3.0/deed.es_ES"
        }
      ],
      "meta": {
        "from_date": "2014-12-01",
        "location": {
          "latitude": "41.38879",
          "longitude": "2.15899",
          "radius": 100
        },
        "to_date": "2014-12-31",
        "total": 1
      }
    }
  },
  "endpoint": "licenses",
  "global": {
    "items": [
      {
        "description": "Licencia Creative Commons (bienes comunes creativos) con reconocimiento de autor\u00eda",
        "id": "ccby",
        "name": "CC - Reconocimiento",
        "svg-url": "https://goteoassets.org/api/svg/licenses/ccby.svg",
        "total-projects": 2,
        "total-rewards": 3,
        "url": "http://creativecommons.org/licenses/by/4.0/deed.es_ES"
      },
      {
        "description": "Licencia Creative Commons (bienes comunes creativos) con reconocimiento de autor\u00eda y sin que se pueda hacer uso comercial",
        "id": "ccbync",
        "name": "CC - Reconocimiento - NoComercial",
        "svg-url": "https://goteoassets.org/api/svg/licenses/ccbync.svg",
        "total-projects": 2,
        "total-rewards": 3,
        "url": "http://creativecommons.org/licenses/by-nc/2.0/deed.es_ES"
      },
      {
        "description": "Licencia Creative Commons (bienes comunes creativos) con reconocimiento de autor\u00eda, sin que se pueda hacer uso comercial y a compartir en id\u00e9nticas condiciones",
        "id": "ccbyncsa",
        "name": "CC - Reconocimiento - NoComercial - CompartirIgual",
        "svg-url": "https://goteoassets.org/api/svg/licenses/ccbyncsa.svg",
        "total-projects": 7,
        "total-rewards": 10,
        "url": "http://creativecommons.org/licenses/by-nc-sa/3.0/deed.es_ES"
      },
      {
        "description": "Licencia Creative Commons (bienes comunes creativos) con reconocimiento de autor\u00eda, sin que se pueda hacer uso comercial ni otras obras derivadas",
        "id": "ccbyncnd",
        "name": "CC - Reconocimiento - NoComercial - SinObraDerivada",
        "svg-url": "https://goteoassets.org/api/svg/licenses/ccbyncnd.svg",
        "total-projects": 5,
        "total-rewards": 6,
        "url": "http://creativecommons.org/licenses/by-nc-nd/2.0/deed.es_ES"
      },
      {
        "description": "Licencia Creative Commons (bienes comunes creativos) con reconocimiento de autor\u00eda y a compartir en id\u00e9nticas condiciones",
        "id": "ccbysa",
        "name": "CC - Reconocimiento - CompartirIgual",
        "svg-url": "https://goteoassets.org/api/svg/licenses/ccbysa.svg",
        "total-projects": 3,
        "total-rewards": 3,
        "url": "http://creativecommons.org/licenses/by-sa/2.0/deed.es_ES"
      },
      {
        "description": "Licencia Creative Commons de obra dedicada al dominio p\u00fablico, mediante renuncia a todos los derechos de autor\u00eda sobre la misma",
        "id": "cc0",
        "name": "CC0 Universal (Dominio P\u00fablico)",
        "svg-url": "https://goteoassets.org/api/svg/licenses/cc0.svg",
        "total-projects": 2,
        "total-rewards": 2,
        "url": "http://creativecommons.org/publicdomain/zero/1.0/deed.es"
      }
    ],
    "meta": {
      "from_date": "2014-01-01",
      "location": {
        "latitude": "41.38879",
        "longitude": "2.15899",
        "radius": 100
      },
      "to_date": "2014-12-31",
      "total": 6
    }
  },
  "meta": {
    "location": {
      "latitude": "41.38879",
      "longitude": "2.15899",
      "radius": 100
    }
  }
}
```

