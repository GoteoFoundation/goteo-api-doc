---
layout: default
title: Projects
group: endpoint
permalink: /doc/projects/
---
# Projects endpoint

This section gives you information about projects in [Goteo.org](http://goteo.org)

<a name="projects"></a>
## /projects/

Obtains a list of projects.

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/projects/
```

### Filters available:

**The [standard set of filters](/doc/filters) applies to this endpoint with these particulars:**

{{ site.data.projects.parameters_table }}

### Response values:

| Attribute  | Type | Description |
| ------------- | ------------- | ------------ |
| * **items** | *array* | An array (limited to the maximum results per page specified in filters) with the list of projects |
| **meta** | *array* | Additionally, extra information will be provided here (such as pagination or parameter filtering ) |

#### * Array sub-fields:

**items** returns an array of the following object:

{{ site.data.projects.definitions_table }}


### Response body:

```json
{{ site.data.projects.example }}
```


<a name="project"></a>
## /projects/{PROJECT_ID}

Gets information about a single project.

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/projects/llevamealhuerto
```

### Filters available:

* No filters are available in this endpoint
* **{PROJECT_ID}** must be the unique identifier of the project


### Response values:

{{ site.data.project.definitions_table }}


### Response body:

```json
{{ site.data.project.example }}
```

<a name="project"></a>
## /projects/{PROJECT_ID}/donors/

Gets information about a single project.

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/projects/llevamealhuerto/donors/
```

* **{PROJECT_ID}** must be the unique identifier of the project

### Filters available:

**Some of the [standard set of filters](/doc/filters) can be applied here:**

{{ site.data.project_donors.parameters_table }}

### Response values:

| Attribute  | Type | Description |
| ------------- | ------------- | ------------ |
| * **items** | *array* | An array (limited to the maximum results per page specified in filters) with the list of projects |
| **meta** | *array* | Additionally, extra information will be provided here (such as pagination or parameter filtering ) |

#### * Array sub-fields:

**items** returns an array of the following object:

{{ site.data.project_donors.definitions_table }}


### Response body:

```json
{{ site.data.project_donors.example }}
```
