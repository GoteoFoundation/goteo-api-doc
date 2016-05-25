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

| Attribute  | Type | Description |
| ------------- | ------------- | ------------ |
| * **items** | *array* | An array with the list of licenses |
| **meta** | *array* | Additionally, extra information will be provided here (such as  parameter filtering) |

#### * Array sub-fields:

**items** returns an array of the following object:

{{ site.data.licenses.definitions_table }}

### Response body

```json
{{ site.data.licenses.example }}
```
