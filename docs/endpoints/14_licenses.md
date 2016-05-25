---
layout: default
title: Licenses
group: endpoint
permalink: /doc/licenses/
---
# Licenses endpoint

This section gives you information about the licenses used by project rewards in [Goteo.org](http://goteo.org)

<a name="licenses"></a>
## /licenses/

Obtains a list of licenses.

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/licenses/
```

### Filters available:

**The [standard set of filters](/doc/filters) applies to this endpoint with these particulars:**

{{ site.data.licenses.parameters_table }}

### Response values:

{{ site.data.licenses.definitions_table }}

### Response body

```json
{{ site.data.licenses.example }}
```
