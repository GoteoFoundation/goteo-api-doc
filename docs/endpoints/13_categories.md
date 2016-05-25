---
layout: default
title: Categories
group: endpoint
permalink: /doc/categories/
---
# Categories endpoint

This section gives you information about the categories used by projects or users in [Goteo.org](http://goteo.org)

<a name="categories"></a>
## /categories/

Obtains a list of categories.

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/categories/
```

### Filters available:

**The [standard set of filters](/doc/filters) applies to this endpoint with these particulars:**

{{ site.data.categories.parameters_table }}

### Response values:

{{ site.data.categories.definitions_table }}

### Response body

```json
{{ site.data.categories.example }}
```
