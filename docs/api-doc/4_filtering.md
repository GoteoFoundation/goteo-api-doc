---
layout: default
title: Filters
group: apidoc
permalink: /doc/filters/
---
# Filtering data in endpoints

The endpoints are designed to provide a easy interface to a complex data. Its possible to get information about users, projects, licenses, categories or advanced pre-calculated reports.

A common set of filters may be available trough all the endpoints with slightly different meanings depending on the context.

Some endpoints may have a reduced set of filters or have a bigger one. Check documentation for each of them.


 **Apply any filter by sending it in the request's query string**

 {% highlight http %}
 GET https://api.goteo.org/v1/users/?node=barcelona HTTP/1.1
 {% endhighlight %}

<a name="filters"></a>
## COMMON FILTERS:

| Parameter  | Type | Description |
| ------------- | ------------- | ------------ |
| page | number | Some endpoints are paginated, by appending **?page=** to the request you will obtain the specified page in the response. This parameter is zero-based, number **0** is the first page, **1** is the second and so on...|
| limit | number | Also for the paginated endpoints you can specify the maximum number of items per page. The maximum items per page allowed is **50**.  |
| lang | string (*multiple) | Some endpoints returns may return content in different languages. This parameter allows to specify one or two languages ([ISO 639-1](http://en.wikipedia.org/wiki/ISO_639-1) code) for the displayed content.<br><br>Note that not all content are available in all languages. Missing content will be displayed in the second specified language (if available) or in the platform default.<br><br>Currently, these languages are available:<br> **es** (Spanish, default), **en** (English), **ca** (Catalan), **eu** (Basque) **gl** (Galician), **it** (Italy), **nl** (Dutch) |
| project | string (*multiple) | Providing a **project-id** here will restrict the results to the specified projects. |
| category | number (*multiple) | Same as before, you can restrict the results to the specified categories.<br><br>**Note that the value expected here is the id of the category**.<br>You can obtain this id from the categories endpoint. |
| node | string (*multiple) | This allows you to restrict the results to a single node of Goteo.<br><br>Currently, 4 different nodes are available: **barcelona**, **euskadi**, **andalucia** and **goteo** (general node) |
| from_date | date | Results can be confined into a range of dates, use this parameter to specify the start date you want results for.<br><br>The date expected format is **YYYY-MM-DD** |
| to_date | date | Same as **from_date**, sets the last date you want results for. |
| location | date | This parameter allows you to restrict results to a certain geographic point and a radius around it. The point coordinates must be in [decimal degrees](http://en.wikipedia.org/wiki/Decimal_degrees) (latitude, longitude) and the radius in Km (with a maximum of 500Km).<br><br>All 3 values must separated by a comma(**,**): **longitude,latitude,radius**<br><br>For instance: **?location=41.38879,2.15899,100** will return results around the city of Barcelona in a radius of 100Km. |

> ***multiple**: These parameters can be queried multiple times and all values will be included in the filter.
> 
> For instance:
> 
> **?node=barcelona&node=euskadi** appended to the request will return all the items related to this 2 nodes (barcelona and euskadi).
> 
> **?lang=eu&lang=en** appended to the request will return the results localized in Basque language, English if Basque is not available or, finally, in the default language (Spanish) if none of them matches.

## Examples:

Obtain a list of users created in Goteo around Barcelona in a radius of 50Km during the year 2014:

```bash
curl --basic --user "user:key" \
"{{ site.apiurl }}/users/?location=41.38879,2.15899,50&from_date=2014-01-01&to_date=2014-12-31"
```

Obtain all the money statistics for the project a single project:

```bash
curl --basic --user "user:key" \
"{{ site.apiurl }}/reports/money/?project=crowdfundparato"
```

Obtain all the community reports for the nodes of barcelona, euskadi an andalucia together:

```bash
curl --basic --user "user:key" \
"{{ site.apiurl }}/reports/community/?node=barcelona&node=euskadi&node=andalucia"
```