---
layout: default
title: Footprints
group: endpoint
permalink: /doc/footprints.html
---
# Footprints endpoint

This section gives you information about the footprints used by projects in [Goteo.org](http://goteo.org).

Footprints are a sort of meta-categorization for projects in Goteo which include them in one "big" area of influence, Ecological footprint, Social footprint and Democratic footprint.

Each category, social commitment and SDG (Sustainable Development Goals) belongs to one or more footprints.

<a name="footprints"></a>
## /footprints/

Obtains a list of footprints.

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/footprints/
```

### Filters available:

**The [standard set of filters](filters.html) applies to this endpoint with these particulars:**

{{ site.data.footprints.parameters_table }}

### Response values:

{{ site.data.footprints.definitions_table }}

### Response body

```json
{{ site.data.footprints.example }}
```
