---
layout: default
title: Reports
group: endpoint
permalink: /reports/
---
# Introduction

This section give you information about average numbers in [Goteo.org](http://goteo.org) over a period of time. 

### ENDPOINTS FOR REPORTS:

<a name="money"></a>
## /reports/money

Statistics about the money collected

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/reports/money
```

- TODO: translate, response

### Response values:

- **average-failed**: Recaudación media por proyectos que no alcanzaron el mínimo
- **average-invest**: Aportación media por cofinanciador (micromecenas)
- **average-invest-paypal**: Aportación media por cofinanciador (micromecenas) a través de PayPal
- **average-mincost**: Coste medio de los proyectos exitosos. Nota: no le afecta el filtro location.
- **average-received**: Recaudación media por proyectos exitosos (que sí alcanzaron el mínimo)
- **average-second-round**: Recaudación media en segunda ronda
- **call-amount**: Suma recaudada en Convocatorias (Capital riego distribuido + crowd)
- **call-committed-amount**: Capital Riego de Goteo (fondos captados de instituciones y empresas destinados a la bolsa de [Capital Riego](https://goteo.org/service/resources))
- **cash-amount**: Suma recaudada mediante transferencia bancaria directa
- **committed**: Suma recaudada por la plataforma
- **comprometido-fail**: Porcentaje de recaudación media sobre el mínimo en proyectos fallidos
- **comprometido-success**: Porcentaje de recaudación media sobre el mínimo en proyectos exitosos
- **devuelto**: Dinero devuelto (en proyectos archivados)
- **fee-amount**: Total 8% recaudado por Goteo
- **paypal-amount**: Suma recaudada mediante PayPal
- **tpv-amount**: Suma recaudada mediante TPV

        Además se añade el campo "filters"

<a name="projects"></a>
## /reports/projects

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/reports/projects
```

-TODO: translate! response

### Response values:

- **failed**: Proyectos fallidos
- **published**: Proyectos publicados
- **received**: Proyectos recibidos (enviados a revisión)
- **succesful**: Proyectos exitosos (alcanzaron el mínimo)
- **successful-percentage**: % de proyectos exitosos
- **successful-finished**: Número de proyectos exitosos con campaña finalizada
- **successful-finished-perc**: % éxito campañas finalizadas
- **top10-collaborations**: Las 10 campañas con más colaboraciones
- **top10-investors**: Las 10 campañas con más cofinanciadores
- **top10-invests**: Las 10 campañas que han recaudado más dinero
- **average-success-percentage**: % de recaudación media conseguida por proyectos exitosos
- **average-successful-posts**: Media de posts en proyectos exitosos

Además se añade el campo "filters"

<a name="community"></a>
## /reports/community

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/reports/community
```

### Response description:

| Attribute  | Type | Description |
| ------------- | ------------- | ------------- |
|**users** | *number* | Total number of registered users |
|**percentage-unsubscribed-users** | *number (percentage)* | Percentage of unsubscribed users (over the  |total number of users)
|**donors** | *number* | Number of donors (co-financiers peers) |
|**percentage-donors-users** | *number (percentage)* | Percentage of registered user that are donors (*100 * donors / users*)
|**donors-collaborators** | *number* | Number of donors who collaborate |
|**multidonors** | *number* | Number of donors who donate to more than 1 project |
|**percentage-multidonor-users** | *number (percentage)* | Percentage of multi-donors (over total users: *100 * multidonors / users*)
|**percentage-multidonor-donors** | *number (percentage)* | Percentage of multi-donors (over total donors: *100 * multidonors / donors*)
|**paypal-donors** | *number* | Number of donors using PayPal |
|**paypal-multi-donors** | *number* | Number of multi-donors using PayPal |
|**collaborators** | *number* | Number of collaborators |
|**average-donors** | *number* | Average number of donors per successful project |
|**average-collaborators** | *number* | Average number of collaborators per succesful  |project
|**creators-donors** | *number* | Number of creators funding other projects |
|**creators-collaborators** | *number* | Number of creators collaborating with other  |projects
|**leading-category** | *number* | First category with the most number of interested users |
|**percentage-users-leading-category** | *number (percentage)* | Percentage of users in this category |
|**second-category** | *number* | Second category with more users |
|**percentage-users-second-category** | *number (percentage)* | Percentage of users in this category |
|* **top10-donors** | *array* | The top 10 donors who spend more money on projects (the most generous co-financiers) |
|* **top10-multidonors** | *array* | Top 10 multi-donors who are contributed to more different projects (The most diversified co-financiers) |
|* **top10-collaborators** | *array* | Top 10 collaborators |
|* **categories** | *array* | Array of categories |
|**filters** | *array* | If any filter is provided it will be printed here as well |

#### * Array sub-fields:
**top10-donors** and **top10-multidonors** return an array of the following object:

| Attribute  | Type | Description |
| ------------- | ------------- | ------------- |
|**amount** | *number (currency)* | Total amount of money (Euro) spent by the user in projects |
|**contributions** | *number* | Total number of different projects the user has contributed to |
|**user** | *string* | User nickname |

**top10-collaborators** returns an array of the following object:

| Attribute  | Type | Description |
| ------------- | ------------- | ------------- |
|**interactions** | *number* | Karma number of the user collaborations |
|**user** | *string* | User nickname |

**categories** returns an array of the following object:

| Attribute  | Type | Description |
| ------------- | ------------- | ------------- |
|**id** | *number* | Identifier of the category |
|**name** | *string* | Name of the category (currently in Spanish) |
|**users** | *number* | Total number of users interested in the category |
|**percentage-users** | *number (percent)* | Percentage of users in this category over the total number of users |

### Response body:
```json
{
  "average-collaborators": 9.4704,
  "average-donors": 125.1323,
  "categories": [
    {
      "2": {
        "id": 2,
        "name": "Social",
        "percentage-users": 8.02,
        "users": 4533
      }
    },
    {
      "10": {
        "id": 10,
        "name": "Educativo",
        "percentage-users": 6.27,
        "users": 3544
      }
    },
    {
      "11": {
        "id": 11,
        "name": "Cultural",
        "percentage-users": 6.26,
        "users": 3537
      }
    },
    {
      "13": {
        "id": 13,
        "name": "Ecol\u00f3gico",
        "percentage-users": 4.76,
        "users": 2693
      }
    },
    {
      "7": {
        "id": 7,
        "name": "Tecnol\u00f3gico",
        "percentage-users": 4.74,
        "users": 2680
      }
    },
    {
      "6": {
        "id": 6,
        "name": "Comunicativo",
        "percentage-users": 3.88,
        "users": 2192
      }
    },
    {
      "14": {
        "id": 14,
        "name": "Cient\u00edfico",
        "percentage-users": 3.17,
        "users": 1791
      }
    },
    {
      "9": {
        "id": 9,
        "name": "Emprendedor",
        "percentage-users": 2.26,
        "users": 1275
      }
    },
    {
      "16": {
        "id": 16,
        "name": "Dise\u00f1o",
        "percentage-users": 1.36,
        "users": 767
      }
    }
  ],
  "collaborators": 4777,
  "creators-collaborators": 26,
  "creators-donors": 37,
  "donors": 37183,
  "donors-collaborators": 900,
  "filters": {},
  "leading-category": 2,
  "multidonors": 4758,
  "paypal-donors": 12160,
  "paypal-multidonors": 894,
  "percentage-donors-users": 65.79,
  "percentage-multidonor-donors": 12.8,
  "percentage-multidonor-users": 8.42,
  "percentage-unsubscribed-users": 2.32,
  "percentage-users-leading-category": 8.02,
  "percentage-users-second-category": 6.27,
  "second-category": 10,
  "top10-collaborators": [
    {
      "interactions": 51,
      "user": "afinidadrebelde"
    },
    {
      "interactions": 48,
      "user": "watsdesign"
    },
    {
      "interactions": 35,
      "user": "fablabbcn"
    },
    {
      "interactions": 34,
      "user": "dirk-eric"
    },
    {
      "interactions": 33,
      "user": "test"
    },
    {
      "interactions": 33,
      "user": "davidcabo"
    },
    {
      "interactions": 30,
      "user": "jngsax"
    },
    {
      "interactions": 28,
      "user": "reevo"
    },
    {
      "interactions": 24,
      "user": "arsgames"
    },
    {
      "interactions": 23,
      "user": "freedonia"
    }
  ],
  "top10-donors": [
    {
      "amount": 14500,
      "contributions": 2,
      "user": "assembleapagesa"
    },
    {
      "amount": 7500,
      "contributions": 1,
      "user": "ins"
    },
    {
      "amount": 7000,
      "contributions": 7,
      "user": "focus-abengoa"
    },
    {
      "amount": 6669,
      "contributions": 4,
      "user": "burujabetech"
    },
    {
      "amount": 6530,
      "contributions": 3,
      "user": "mhealth"
    },
    {
      "amount": 6500,
      "contributions": 2,
      "user": "elikaherriaaportaciones"
    },
    {
      "amount": 6080,
      "contributions": 34,
      "user": "carmeliya"
    },
    {
      "amount": 6000,
      "contributions": 1,
      "user": "jediupc"
    },
    {
      "amount": 6000,
      "contributions": 1,
      "user": "aytoquintanar"
    },
    {
      "amount": 5005,
      "contributions": 1,
      "user": "mentxuiriondo"
    }
  ],
  "top10-multidonors": [
    {
      "amount": 4095,
      "contributions": 152,
      "user": "olivier"
    },
    {
      "amount": 4373,
      "contributions": 145,
      "user": "esenabre"
    },
    {
      "amount": 4655,
      "contributions": 67,
      "user": "olatzarra"
    },
    {
      "amount": 1815,
      "contributions": 63,
      "user": "colaborabora"
    },
    {
      "amount": 1455,
      "contributions": 50,
      "user": "evasaura"
    },
    {
      "amount": 321,
      "contributions": 49,
      "user": "pablo.checadejoz"
    },
    {
      "amount": 668,
      "contributions": 49,
      "user": "jcanaves"
    },
    {
      "amount": 1670,
      "contributions": 44,
      "user": "arantxamendi"
    },
    {
      "amount": 1930,
      "contributions": 41,
      "user": "amoya62"
    },
    {
      "amount": 1107,
      "contributions": 37,
      "user": "papakorkel"
    }
  ],
  "users": 56522,
  "users-leading-category": 4533,
  "users-second-category": 3544
}
```

<a name="rewards"></a>
## /reports/rewards

### Curl Example

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/reports/rewards
```

### Response values:


| Attribute  | Type | Description |
| ------------- | ------------- | ------------- |
|**reward-refusal** | *number* | Number of co-financiers who renounce reward |
|**percentage-reward-refusal** | *number* | % of co-financiers who renounce reward |
|**favorite-rewards** | *number* | Reward type used in successful projects. (__NOTE that  |this field is not affected by the location filter__).
|* **rewards-per-amount** | *array* | Number of rewards picked by the users in steps |
|**filters** | *array* | Any given filter will be added back here |

#### * Array sub-fields

| Attribute  | Type | Description |
| ------------- | ------------- | ------------- |
| **rewards-between-100-400** | *number* | Num. of users choosing rewards from 100 &euro; to 400 &euro; |
| **rewards-between-15-30** | *number* | Num. of users choosing rewards from 15 &euro; to 30 &euro;
| **rewards-between-30-100** | *number* | Num. of users choosing rewards from 30 &euro; to 100 &euro; |
| **rewards-less-than-15** | *number* | Num. of users choosing rewards cheaper than 15 &euro; |
| **rewards-more-than-400** | *number* | Num. of users choosing rewards more expensive than 400 &euro; |

### Response Body

```json
{
  "favorite-rewards": [
    {
      "icon": "product",
      "uses": 1051
    },
    {
      "icon": "service",
      "uses": 531
    },
    {
      "icon": "thanks",
      "uses": 393
    },
    {
      "icon": "file",
      "uses": 139
    },
    {
      "icon": "other",
      "uses": 110
    },
    {
      "icon": "money",
      "uses": 11
    }
  ],
  "filters": {},
  "percentage-reward-refusal": 35.96,
  "reward-refusal": 13372,
  "rewards-per-amount": {
    "rewards-between-100-400": 2880,
    "rewards-between-15-30": 14203,
    "rewards-between-30-100": 15002,
    "rewards-less-than-15": 9294,
    "rewards-more-than-400": 2880
  }
}
```