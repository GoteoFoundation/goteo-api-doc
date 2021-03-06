---
layout: default
title: Filters
group: apidoc
permalink: /doc/filters.html
---
# Filtering data in endpoints

The endpoints are designed to provide a easy interface to a complex data. Its possible to get information about users, projects, licenses, categories or advanced pre-calculated reports.

A common set of filters may be available trough all the endpoints with slightly different meanings depending on the context.

Some endpoints may have a reduced set of filters or have a bigger one. Check documentation for each of them.


**Apply any filter by sending it in the request's query string**

```http
GET https://api.goteo.org/v1/users/?node=barcelona HTTP/1.1
```

<a name="filters"></a>
## COMMON FILTERS:

| Parameter  | Type | Description |
| ------------- | ------------- | ------------ |
| page | number | Some endpoints are paginated, by appending **?page=** to the request you will obtain the specified page in the response. This parameter is zero-based, number **0** is the first page, **1** is the second and so on...|
| limit | number | Also for the paginated endpoints you can specify the maximum number of items per page. The maximum items per page allowed is **50**.  |
| lang | string (*multiple) | Some endpoints returns may return content in different languages. This parameter allows to specify one or two languages ([ISO 639-1](http://en.wikipedia.org/wiki/ISO_639-1) code) for the displayed content.<br><br>Note that not all content are available in all languages. Missing content will be displayed in the second specified language (if available) or in the platform default.<br><br>Currently, these languages are available:<br> **es** (Spanish, default), **en** (English), **ca** (Catalan), **eu** (Basque) **gl** (Galician), **it** (Italy), **nl** (Dutch) |
| project | string (*multiple) | Providing a **project-id** here will restrict the results to the specified projects. |
| category | number (*multiple) | Same as before, you can restrict the results to the specified categories.<br><br>**Note that the value expected here is the id of the category**.<br>You can obtain this id from the [categories endpoint](categories.html). |
| social_commitment | number (*multiple) | Like categories, you can restrict the results to the specified social commitments.<br><br>**Note that the value expected here is the id of the social_commitment**.<br>You can obtain this id from the [social commitments endpoint](social_commitments.html). |
| sdg | number (*multiple) | Sustainable Development Goals can also be used to restrict the results.<br><br>**Note that the value expected here is the id of the sdg**.<br>You can obtain this id from the [SDGs endpoint](sdgs.html). |
| footprint | number (*multiple) | Footprints is a meta-categorization scope, you can restrict results by this value too.<br><br>**Note that the value expected here is the id of the footprint**.<br>You can obtain this id from the [footprints endpoint](footprints.html). |
| node | string (*multiple) | This allows you to restrict the results to a single node (known as *channel* as well) of Goteo.<br><br>Currently, we don't have and endpoint for channels (yet), check out the active ones in the official website: [goteo.org/channels](https://goteo.org/channels), to exclude channels results use **goteo** as the general node |
| call | string (*multiple) | This allows you to restrict the results to a single matchfunding call.<br><br>Check for existing calls in [Calls](calls.html) |
| matcher | string (*multiple) | This allows you to restrict the results to a single matchfunding matcher.<br><br>Check for existing matchers in [Matchers](matchers.html) |
| from_date | date | Results can be confined into a range of dates, use this parameter to specify the start date you want results for.<br><br>The date expected format is **YYYY-MM-DD** |
| to_date | date | Same as **from_date**, sets the last date you want results for. |
| location | numbers (csv) | This parameter allows you to restrict results to a certain geographic point and a radius around it. The point coordinates must be in [decimal degrees](http://en.wikipedia.org/wiki/Decimal_degrees) (latitude, longitude) and the radius in Km (with a maximum of 500Km).<br><br>All 3 values must separated by a comma(**,**): **longitude,latitude,radius**<br><br>For instance: **?location=41.38879,2.15899,100** will return results around the city of Barcelona in a radius of 100Km. |

> ***multiple**: These parameters can be queried multiple times and all values will be included in the filter.
> 
> For instance:
> 
> **?node=barcelona&node=euskadi** appended to the request will return all the items related to this 2 nodes (barcelona and euskadi).
> 
> **?lang=eu&lang=en** appended to the request will return the results localized in Basque language, English if Basque is not available or, finally, in the default language (Spanish) if none of them matches.

## Examples:

Obtaining a list of users created in Goteo around Barcelona in a radius of 50Km during the year 2014:

```bash
curl --basic --user "user:key" \
"{{ site.apiurl }}/users/?location=41.38879,2.15899,50&from_date=2014-01-01&to_date=2014-12-31"
```

Obtaining all the money statistics for the project a single project:

```bash
curl --basic --user "user:key" \
"{{ site.apiurl }}/reports/money/?project=crowdfundparato"
```

Obtaining all the community reports for the nodes of barcelona, euskadi an andalucia together:

```bash
curl --basic --user "user:key" \
"{{ site.apiurl }}/reports/community/?node=barcelona&node=euskadi&node=andalucia"
```