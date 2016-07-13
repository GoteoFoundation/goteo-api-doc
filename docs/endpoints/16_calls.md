---
layout: default
title: Matchfunding calls
group: endpoint
permalink: /doc/calls.html
---
# Matchfunding calls endpoint

This section gives you information about [matchfunding calls](https://www.goteo.org/service/resources) in [Goteo.org](http://goteo.org)

Since 2011, Goteo has been engaged in what we call our "Matchfunding", namely a pool of large donations from different types of public and private entities which make an annual commitment. These donations are allocated to specific projects through specific temporary calls tenders (using predesigned forms or ad hoc arrangements). This makes it possible to link up contributions from various kinds of entities, tailoring them to specific projects, certain thematic areas, geographical zones or types of returns and licenses.

At Goteo we have created a social investment pool with contributions from public institutions, businesses, other private institutions and individuals. The aim is to bring about a multiplier effect and thus encourage co-responsible investment in projects that rely on the support of civil society.


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

**Some of the [standard set of filters](filters.html)) can be applied here:**

{{ site.data.call_projects.parameters_table }}

### Response values:

{{ site.data.call_projects.definitions_table }}

### Response body:

```json
{{ site.data.call_projects.example }}
```
