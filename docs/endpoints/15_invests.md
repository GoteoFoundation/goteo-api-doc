---
layout: default
title: Invests
group: endpoint
permalink: /doc/invests/
---
# Invests endpoint

This section gives you information about invests in [Goteo.org](http://goteo.org)

<a name="invests"></a>
## /invests/

Obtains a list of invests.

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/invests/
```

### Filters available:
**The [standard set of filters](/doc/filters) applies to this endpoint with these particulars:**

{{ site.data.invests.parameters_table }}

### Response values:

{{ site.data.invests.definitions_table }}

### Response body:

```json
{{ site.data.invests.example }}
```

<a name="user"></a>
## /invests/{INVEST_ID}

Gets information about a single user.

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/invests/1000
```

### Filters available:

* No filters are available in this endpoint
* **{INVEST_ID}** must be the unique identifier of the user


### Response values:

{{ site.data.user.definitions_table }}

### Response body:

```json
{{ site.data.user.example }}
```
