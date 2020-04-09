---
layout: default
title: Sustainable Development Goals
group: endpoint
permalink: /doc/sdgs.html
---
# Sustainable Development Goals endpoint

This section gives you information about the Sustainable Development Goals (SDGs) used by projects in [Goteo.org](http://goteo.org).

SDGs are another way to categorize projects in Goteo based [The 2030 Agenda for Sustainable Development, adopted by all United Nations Member States in 2015](https://sustainabledevelopment.un.org/).

Each SDG belongs to a one or more footprints and social commitments.

<a name="sdgs"></a>
## /sdgs/

Obtains a list of sdgs.

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/sdgs/
```

### Filters available:

**The [standard set of filters](filters.html) applies to this endpoint with these particulars:**

{{ site.data.sdgs.parameters_table }}

### Response values:

{{ site.data.sdgs.definitions_table }}

### Response body

```json
{{ site.data.sdgs.example }}
```
