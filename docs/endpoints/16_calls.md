---
layout: default
title: Matchfunding calls
group: endpoint
permalink: /doc/calls.html
---
# Matchfunding calls endpoint

This section gives you information about matchfunding calls in [Goteo.org](http://goteo.org)

<a name="calls"></a>
## /calls/

Obtains a list of matchfunding calls.

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/calls/
```

### Filters available:

**The [standard set of filters](/doc/filters/) applies to this endpoint with these particulars:**

{{ site.data.calls.parameters_table }}

### Response values:

{{ site.data.calls.definitions_table }}

### Response body:

```json
{{ site.data.calls.example }}
```

<a name="project"></a>
## /calls/{CALL_ID}

Gets information about a single project.

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/calls/unia-capital-riego
```

### Filters available:

* No filters are available in this endpoint
* **{CALL_ID}** must be the unique identifier of the project

### Response values:

{{ site.data.call.definitions_table }}

### Response body:

```json
{{ site.data.call.example }}
```

<a name="call"></a>
## /projects/{CALL_ID}/projects/

List all projects in a matchfunding call

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/calls/unia-capital-riego/projects/
```

* **{CALL_ID}** must be the unique identifier of the project

### Filters available:

**Some of the [standard set of filters](/doc/filters) can be applied here:**

{{ site.data.call_projects.parameters_table }}

### Response values:

{{ site.data.call_projects.definitions_table }}

### Response body:

```json
{{ site.data.call_projects.example }}
```
