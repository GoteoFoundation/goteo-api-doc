---
layout: default
title: Matchfunding matchers
group: endpoint
permalink: /doc/matchers.html
---
# Matchfunding matchers endpoint

This section gives you information about [matchfunding matchers](https://www.goteo.org/service/resources) in [Goteo.org](http://goteo.org)

This endpoint provides information about matchers, which are a "lighter" versions for the Goteo Matchfunding formula. The difference between `matchers` and `calls` is about flexibility and, usually, the entity behind them. While `matchers` can be a collection of individuals with custom rules of how to distribute the money, `calls` are reserved to big institutions with much more defined rules of who can participate, how and when.


<a name="matchers"></a>
## /matchers/

Obtains a list of matchfunding matchers.

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/matchers/
```

### Filters available:

**The [standard set of filters](/doc/filters/) applies to this endpoint with these particulars:**

{{ site.data.matchers.parameters_table }}

### Response values:

{{ site.data.matchers.definitions_table }}

### Response body:

```json
{{ site.data.matchers.example }}
```

<a name="project"></a>
## /matchers/{MATCHER_ID}

Gets information about a single project.

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/matchers/ahoracomparte
```

### Filters available:

* No filters are available in this endpoint
* **{MATCHER_ID}** must be the unique identifier of the project

### Response values:

{{ site.data.matcher.definitions_table }}

### Response body:

```json
{{ site.data.matcher.example }}
```

<a name="matcher"></a>
## /projects/{MATCHER_ID}/projects/

List all projects in a matchfunding matcher

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/matchers/ahoracomparte/projects/
```

* **{MATCHER_ID}** must be the unique identifier of the project

### Filters available:

**The [standard set of filters](/doc/filters/) applies to this endpoint with these particulars:**

{{ site.data.matcher_projects.parameters_table }}

### Response values:

{{ site.data.matcher_projects.definitions_table }}

### Response body:

```json
{{ site.data.matcher_projects.example }}
```
