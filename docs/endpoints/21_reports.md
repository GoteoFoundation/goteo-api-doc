---
layout: default
title: Reports
group: endpoint
permalink: /doc/reports.html
---
# Reports endpoint
This section gives you information about average numbers in [Goteo.org](http://goteo.org).

## Filters available

**The [standard set of filters](/doc/filters) applies to all of these endpoints with these particulars:**

{{ site.data.reports_community.parameters_table }}

* Parameters **page** and **limit** are not available in none of these endpoints
* Parameter **lang** is available only in the /reports/community/ endpoint

<a name="summary"></a>
## /reports/summary/

Some of the data provided by the other **/reports/*/** endpoints is provided here as a summary. This allows to retrieve all the important data (choosen by the Goteo team) in one API call only.

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/reports/summary/
```

### Response values:

{{ site.data.reports_summary.definitions_table }}

#### * Array sub-fields:

**categories** returns an array of the object specified in the [reports/community](/doc/reports#community) response.

**favorite-rewards** returns an array of the object specified in the [reports/rewards](/doc/reports#rewards) response.

**top10-collaborations** and **top10-donations** returns an array of the objects specified in the [reports/projects](/doc/reports#projects) response.

### Response body:

```json
{{ site.data.reports_summary.example }}
```

<a name="money"></a>
## /reports/money/

Statistics about the money collected

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/reports/money/
```

### Response values:

{{ site.data.reports_money.definitions_table }}

### Response body:

```json
{{ site.data.reports_money.example }}
```

<a name="projects"></a>
## /reports/projects/

Statistics around the projects

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/reports/projects/
```

### Response description:

{{ site.data.reports_projects.definitions_table }}

### Response body:

```json
{{ site.data.reports_projects.example }}
```

<a name="community"></a>
## /reports/community/

Statistics involving the community, creators and donors

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/reports/community/
```

### Response description:

{{ site.data.reports_community.definitions_table }}

### Response body:

```json
{{ site.data.reports_community.example }}
```

<a name="rewards"></a>
## /reports/rewards/

Statistics around the rewards and licenses

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/reports/rewards/
```

### Response values:

{{ site.data.reports_rewards.definitions_table }}

### Response Body

```json
{{ site.data.reports_rewards.example }}
```
