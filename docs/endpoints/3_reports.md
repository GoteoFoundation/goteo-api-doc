---
layout: default
title: Reports
group: endpoint
permalink: /doc/reports/
---
# Reports endpoint
This section gives you information about average numbers in [Goteo.org](http://goteo.org). 

## Filters available
**The [standard set of filters](/doc/filters) applies to all of these endpoints with these particulars:**

* Parameters **page** and **limit** are not available in none of this endpoints
* Parameter **lang** is available only in the /reports/community/ endpoint

<a name="money"></a>
## /reports/money/

Statistics about the money collected

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/reports/money/
```

### Response values:

| Attribute  | Type | Description |
| ------------- | ------------- | ------------ |
| **average-failed** | *number* | Average money raised for failed projects (which haven't reached the minimum required amount) |
| **average-donation** | *number (money)* | Average amount of money (&euro;) given by a donor |
| **average-donation-paypal** | *number (money)* | Average amount of money (&euro;) given by a donor using Paypal |
| **average-minimum** | *number (money)* | Average minimum cost (&euro;) for successful projects (NOTE: this field is not affected by the location filter) |
| **average-received** | *number (money)* | Average money raised (&euro;) for successful projects (those which reached the minimum) |
| **average-second-round** | *number (money)* | Average money raised only in the second round (&euro;) |
| **matchfund-amount** | *number (money)* | Amount of money raised in calls (*Capital riego distribuido* + crowdfunding money) |
| **matchfundpledge-amount** | *number (money)* | *Capital Riego de Goteo* (funds from institutions and companies added to the [Capital Riego](https://goteo.org/service/resources)) |
| **cash-amount** | *number (money)* | Total amount of money (&euro;) collected by direct bank transfer |
| **pledged** | *number (money)* | Total amount of money (&euro;) raised by Goteo |
| **pledged-failed** | *number (percentage)* | Percentage of money raised over the minimum on failed projects |
| **pledged-successful** | *number (percentage)* | Percentage of money raised over the minimum on successful projects |
| **refunded** | *number (money)* | Refunded money (&euro;) on failed projects |
| **fee-amount** | *number (money)* | Total fee collected by Goteo |
| **paypal-amount** | *number (money)* | Total amount of money (&euro;) raised using PayPal transactions |
| **creditcard-amount** | *number* | Total amount of money (&euro;) raised using Credit Card transactions |
| **meta** | *array* | Additionally, extra information will be provided here (such as pagination or parameter filtering ) |

### Response body:
```json
{
  "average-donation": 47.15,
  "average-donation-paypal": 36.22,
  "average-failed": 933.13,
  "average-minimum": 4886.11,
  "average-received": 6236.44,
  "average-second-round": 1032.95,
  "cash-amount": 132963,
  "creditcard-amount": 2441427,
  "fee-amount": 162147.36,
  "meta": {},
  "matchfund-amount": 57938,
  "matchfundpledge-amount": 74000,
  "paypal-amount": 529107,
  "pledged": 2216778,
  "pledged-failed": 23.11,
  "pledged-successful": 27.12,
  "refunded": 134819
}
```

<a name="projects"></a>
## /reports/projects/

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/reports/projects/
```

### Response description:

| Attribute  | Type | Description |
| ------------- | ------------- | ------------ |
| **failed** | *number* | Number of failed projects (unsuccessful crowdfunding campaigns) |
| **published** | *number* | Number of published projects |
| **received** | *number* | Number of received projects (accepted for review by Goteo administrators) |
| **successful** | *number* | Number of successful projects (which have achieved the minimum required amount) |
| **percentage-successful** | *number (percentage)* | Percentage of successful projects |
| **successful-completed** | *number* | Number of successful projects with completed campaign |
| **percentage-successful-completed** | *number (percentage)* | Percentage of successful projects with completed campaign (over the total projects: *100 * successful-complete / (successful-complete + failed)* ) |
| **average-amount-successful** | *number (money)* | Average amount (&euro;) of money raised in successful projects |
| **average-posts-successful** | *number* | Average number of posts published by successful projects |
| * **top10-collaborations** | *array* | The 10 campaigns with the most collaborations |
| * **top10-donations** | *array* | The 10 campaigns with the most donors (individual contributions) |
| * **top10-receipts** | *array* | The 10 campaigns with the most money raised |
| **meta** | *array* | Additionally, extra information will be provided here (such as pagination or parameter filtering ) |

#### * Array sub-fields:

**top10-collaborations** and **top10-donations** return an array of the following object:

| Attribute  | Type | Description |
| ------------- | ------------- | ------------- |
| **project** | *string* | Identifier for the project |
| **total** | *number* | Total number contributions (or collaborations) |

**top10-receipts** return an array of the following object:

| Attribute  | Type | Description |
| ------------- | ------------- | ------------- |
| **project** | *string* | Identifier for the project |
| **amount** | *number (money)* | Total amount (&euro;) of money raised for the project |

### Response body:
```json
{
  "average-amount-successful": 6236.44,
  "average-posts-successful": 11.8,
  "failed": 145,
  "meta": {},
  "percentage-successful": 67.14,
  "percentage-successful-complete": 69.15,
  "published": 522,
  "received": 1810,
  "successful": 333,
  "successful-complete": 325,
  "top10-collaborations": [
    {
      "project": "rebelaos-publicacion-por-la-autogestion",
      "total": 142
    },
    {
      "project": "foldarap-peer-to-peer-edition",
      "total": 141
    },
    {
      "project": "crowdfundparato",
      "total": 120
    },
    {
      "project": "smart-citizen-sensores-ciudadanos",
      "total": 101
    },
    {
      "project": "bhoreal",
      "total": 94
    },
    {
      "project": "tuderechoasaber.es",
      "total": 87
    },
    {
      "project": "reevo",
      "total": 84
    },
    {
      "project": "infinit-loop",
      "total": 71
    },
    {
      "project": "outreach-box",
      "total": 70
    },
    {
      "project": "diagonal",
      "total": 66
    }
  ],
  "top10-donations": [
    {
      "project": "diagonal",
      "total": 1802
    },
    {
      "project": "gnupg-new-website-and-infrastructure",
      "total": 1409
    },
    {
      "project": "crowdfundparato",
      "total": 1172
    },
    {
      "project": "oligopolyoff",
      "total": 731
    },
    {
      "project": "d-callaos-nuevo-disco",
      "total": 573
    },
    {
      "project": "listabierta-org",
      "total": 536
    },
    {
      "project": "yo-tambien-estaba-en-el-parlament",
      "total": 484
    },
    {
      "project": "hormiga-mutantea",
      "total": 434
    },
    {
      "project": "ahotsa-behar-dugu",
      "total": 420
    },
    {
      "project": "multireferendum",
      "total": 398
    }
  ],
  "top10-receipts": [
    {
      "amount": 70506,
      "project": "diagonal"
    },
    {
      "amount": 52835,
      "project": "foldarap-peer-to-peer-edition"
    },
    {
      "amount": 36732,
      "project": "gnupg-new-website-and-infrastructure"
    },
    {
      "amount": 35412,
      "project": "multireferendum"
    },
    {
      "amount": 32491,
      "project": "hormiga-mutantea"
    },
    {
      "amount": 24461,
      "project": "oligopolyoff"
    },
    {
      "amount": 23098,
      "project": "ahotsa-behar-dugu"
    },
    {
      "amount": 22109,
      "project": "ayuda-a-la-resistencia-campesina-de-Gaza"
    },
    {
      "amount": 21015,
      "project": "makusitv"
    },
    {
      "amount": 19755,
      "project": "proyecto-baraka"
    }
  ]
}
```
<a name="community"></a>
## /reports/community/

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/reports/community/
```

### Response description:

| Attribute  | Type | Description |
| ------------- | ------------- | ------------- |
| **users** | *number* | Total number of registered users |
| **percentage-unsubscribed-users** | *number (percentage)* | Percentage of unsubscribed users (over the  total number of users) |
| **donors** | *number* | Number of donors |
| **percentage-donors-users** | *number (percentage)* | Percentage of registered users that are donors (*100 * donors / users*)
| **donors-collaborators** | *number* | Number of donors who collaborate |
| **multidonors** | *number* | Number of donors who donate to more than 1 project |
| **percentage-multidonor-users** | *number (percentage)* | Percentage of multidonors (over total users: *100 * multidonors / users*)
| **percentage-multidonor-donors** | *number (percentage)* | Percentage of multidonors (over total donors: *100 * multidonors / donors*)
| **paypal-donors** | *number* | Number of donors using PayPal |
| **paypal-multidonors** | *number* | Number of multidonors using PayPal |
| **collaborators** | *number* | Number of collaborators |
| **average-donors** | *number* | Average number of donors per successful project |
| **average-collaborators** | *number* | Average number of collaborators per succesful  project |
| **creators-donors** | *number* | Number of creators funding other projects |
| **creators-collaborators** | *number* | Number of creators collaborating with other  projects |
| **leading-category** | *number* | Category with the highest number of interested users |
| **users-leading-category** | *number* | Number of users in this category |
| **percentage-users-leading-category** | *number (percentage)* | Percentage of users in this category |
| **second-category** | *number* | Second category with more users |
| **users-second-category** | *number* | Number of users in this category |
| **percentage-users-second-category** | *number (percentage)* | Percentage of users in this category |
| * **top10-donors** | *array* | The top 10 donors who spend more money on projects (the most generous co-financiers) |
| * **top10-multidonors** | *array* | Top 10 multidonors who are contributed to more different projects (The most diversified co-financiers) |
| * **top10-collaborators** | *array* | Top 10 collaborators |
| * **categories** | *array* | Array of categories |
| **meta** | *array* | Additionally, extra information will be provided here (such as pagination or parameter filtering ) |

#### * Array sub-fields:
**top10-donors** and **top10-multidonors** return an array of the following object:

| Attribute  | Type | Description |
| ------------- | ------------- | ------------- |
| **amount** | *number (money)* | Total amount of money (&euro;) spent by the user in projects |
| **contributions** | *number* | Total number of different projects the user has contributed to |
| **user** | *string* | User nickname |

**top10-collaborators** returns an array of the following object:

| Attribute  | Type | Description |
| ------------- | ------------- | ------------- |
| **interactions** | *number* | Karma number of the user collaborations |
| **user** | *string* | User nickname |

**categories** returns an array of the following object:

| Attribute  | Type | Description |
| ------------- | ------------- | ------------- |
| **id** | *number* | Identifier of the category |
| **name** | *string* | Name of the category (currently in Spanish) |
| **users** | *number* | Total number of users interested in the category |
| **percentage-users** | *number (percent)* | Percentage of users in this category over the total number of users |

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
  "meta": {},
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
## /reports/rewards/

### Curl Example

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/reports/rewards/
```

### Response values:


| Attribute  | Type | Description |
| ------------- | ------------- | ------------- |
| **reward-refusal** | *number* | Number of co-financiers who renounce reward |
| **percentage-reward-refusal** | *number* | % of co-financiers who renounce reward |
| * **favorite-rewards** | *array* | Reward type used in successful projects. |
| * **rewards-per-amount** | *array* | Number of rewards picked by the users in steps |
| **meta** | *array* | Additionally, extra information will be provided here (such as pagination or parameter filtering ) |

#### * Array sub-fields

**favorite-rewards** returns an array of this object:

| Attribute  | Type | Description |
| ------------- | ------------- | ------------- |
| **icon** | *string* | Identifier of the reward's icon (a link to a SVG image will be provided soon) |
| **total** | *number* | Number of uses of this reward in successful projects  |

**rewards-per-amount** returns an array of this object:

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
      "total": 1051
    },
    {
      "icon": "service",
      "total": 531
    },
    {
      "icon": "thanks",
      "total": 393
    },
    {
      "icon": "file",
      "total": 139
    },
    {
      "icon": "other",
      "total": 110
    },
    {
      "icon": "money",
      "total": 11
    }
  ],
  "meta": {},
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