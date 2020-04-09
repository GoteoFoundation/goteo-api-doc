---
layout: default
title: Social Commitments
group: endpoint
permalink: /doc/social_commitments.html
---
# Social Commitments endpoint

This section gives you information about the social commitment used by projects in [Goteo.org](http://goteo.org).

Social Commitments an alternative way of categorization for projects in Goteo.

Each social commitment can belong to a one or more SDG (Sustainable Development Goals) and footprints.

<a name="socialcommitments"></a>
## /socialcommitments/

Obtains a list of socialcommitments.

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/socialcommitments/
```

### Filters available:

**The [standard set of filters](filters.html) applies to this endpoint with these particulars:**

{{ site.data.socialcommitments.parameters_table }}

### Response values:

{{ site.data.socialcommitments.definitions_table }}

### Response body

```json
{{ site.data.socialcommitments.example }}
```
