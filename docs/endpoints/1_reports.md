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

- TODO: translate!, response

### Response values:

- **users**: Número total de usuarios registrados
- **perc-bajas**: Porcentaje de usuarios que se han dado de baja
- **cofinanciadores**: Número de cofinanciadores
- **users-cofi-perc**: % usuarios registrados que son cofinanciadores
- **coficolaboradores**: Número de cofinanciadores que colaboran
- **multicofi**: Número de Multi-Cofinanciadores (a más de 1 proyecto)
- **users-multicofi-perc**: % de Multi-Cofinanciadores (a más de 1 proyecto)
- **paypal**: Número de cofinanciadores que usan PayPal
- **paypal-multicofi**: Número de Multi-Cofinanciadores que usan PayPal
- **colaboradores**: Número de colaboradores
- **media-cofi**: Media de cofinanciadores por proyecto exitoso
- **media-colab**: Media de colaboradores por proyecto
- **impulcofinanciadores**: Número de impulsores que cofinancian a otros
- **impulcolaboradores**: Número de impulsores que colaboran con otros
- **categoria1**: 1ª categoría con más usuarios interesados
- **perc-categoria1**: % usuarios en esta 1ª categoría
- **categoria2**: 2ª categoría con más usuarios interesados
- **perc-categoria2**: % usuarios en esta 2ª categoría
- **top10-investors**: Top 10 cofinanciadores
- **top10-invests**: Top 10 cofinanciadores con más caudal (más generosos) sin incluir usuarios convocadores
- **top10-collaborations**: Top 10 colaboradores

**categorias**:

Además se añade el campo "filters"

<a name="rewards"></a>
## /reports/rewards

### Curl Example

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/reports/rewards
```

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

### Response values:

- **reward-refusal**: Number of co-financiers who renounce reward
- **percentage-reward-refusal**: % of co-financiers who renounce reward
- **favorite-rewards**: Reward type used in successful projects. (__NOTE that this field is not affected by the location filter__).
- **rewards-per-amount**: Number of rewards picked by the users in steps:
    - **rewards-between-100-400**: Num. of users choosing rewards from 100 to 400 Euro
    - **rewards-between-15-30**: Num. of users choosing rewards from 15 to 30 Euro
    - **rewards-between-30-100**: Num. of users choosing rewards from 30 to 100 Euro
    - **rewards-less-than-15**: Num. of users choosing rewards cheaper than 15 Euro
    - **rewards-more-than-400**: Num. of users choosing rewards more expensive than 400 Euro
- **filters**: Any given filter will be added here
