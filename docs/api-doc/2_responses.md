---
layout: default
title: Responses
group: apidoc
permalink: /doc/responses/

---

# Responses

In response to a request, a response body will typically be sent back in the form of JSON object.

There's two types of responses, those involving collections of objects and the responses with a single object:

### Collections

Collections returns arrays in response to a query made against and endpoint which always ends with `/` (trailing slash).

Response body always contents 2 main keys:

| Attribute  | Type | Description |
| ------------- | ------------- | ------------ |
| items | array | An array of the endpoint objects (limited to the maximum results per page specified in filters) |
| meta | object | This object will return meta information with some relevant information about the current request. Such as the total number of elements, the current page or the applied filters &#9758; [MetaProject](#MetaProject) |
| extra | object | Some endpoints may return this additional object with some relevant information, this is documented where applies |

```json
{
    items: [
            {
                "..."
            }
        ],
    meta: {
            "..."
        },
    extra: {
            "..."
        }
}
```

### Single objects

Single object endpoints does not ends with the `/` (trailing slash).

Response body will be the final object returned by the endpoint

```json
{
    "..."
}
```

### Error responses

For **40X** errors, the response body will be in JSON format as well. Typically with a description of the error:

```json
{
  "error": 401,
  "message": "Invalid access method or wrong credentials"
}
```

## Meta

Meta information may include (depending on the endpoint, this applies for the projects endpoint) this keys:

{{ site.data.metaproject.definitions_table }}

