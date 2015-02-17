---
layout: default
title: API Introduction
permalink: /doc/
---
# GOTEO API v1.0
> Currently in **BETA** (big changes can be expected at any moment!)

## Introduction

This is the API for the crowdfunding platform [Goteo.org](http://goteo.org).

#### API URL: [{{ site.apiurl }}]({{ site.apiurl }})

The API is compatible with the [Swagger](http://swagger.io/) specification. Checkout the [html interface]({{ site.apiurl }}/api/spec.html#!/spec) for a live testing console or the [json interface]({{ site.apiurl }}/api/spec.json)


## Authentication

This API uses Http authentication, please get your **user** and **password** from your activity dashboard in [http://goteo.org/dashboard/activity/apikey](http://goteo.org/dashboard/activity/apikey)

## Quick start: Basic usage

Once you have your user/key you can make petitions, here are few examples:

### CURL example from a command line:

```bash
curl -i  --basic --user "user:key" {{ site.apiurl }}/reports/money/
curl -i  --basic --user "user:key" -X GET -d from_date="2014-01-01" {{ site.apiurl }}/reports/money/
curl -i  --basic --user "user:key" -X GET -d project="diagonal" {{ site.apiurl }}/reports/money/
curl -i  --basic --user "user:key" -X GET -d location="36.716667,-4.416667,100" {{ site.apiurl }}/reports/projects/

curl -i --basic --user "user:key" {{ site.apiurl }}/users/ 
```

### JQuery example:

```javascript
API_USER = 'you api user';
API_KEY = 'you api key';

//Sets the authorization headers for ajax calls (suc as $.get or $.post)
$.ajaxSetup({
    headers: { 'Authorization': "Basic " + btoa(API_USER + ':' + API_KEY)},
});

//Retrieve some user information:
$.get('http://api.goteo.org/v1/users/ivan')
    .done(function(data){
        console.log(data);
        alert('User name is: ' + data.name);
    }).error(function(){
        alert('User not found');
    });


```

## Requests

The API is accessible through both HTTP and HTTPS protocols by any tool capable to communicate using http basic user authentication.

Currently, the API is in a read-only state so only GET, OPTIONS and HEAD methods are available at this point.

|  Method | Usage |
| ------- | ----- |
| GET     | This is the method that should be used to retrieve any data from the Goteo platform. The response will be  returned in to you as a JSON object.<br><br> Additionally, some endpoints accepts parameters in the URL letting you filter the result in several ways.<br><br> All requests using the GET method are read-only.    |
| OPTIONS | This method is used mainly to retrieve the methods available (GET, OPTIONS, HEAD) in the API. Also is needed to obtain information about if CORS authorization is enabled.<br><br> Normally, this is used automatically by modern browsers before doing the requested GET petition.<br><br>**CORS** is enabled for full access in this API. |
| HEAD    | To retrieve metadata information, the HEAD method returns the headers associated to a specific GET request.<br><br>Response headers contain some useful information about your API access and the results that are available for your request.<br><br>For instance, the headers contain your current rate-limit value and the amount of time available until the limit resets. It also contains metrics about the total number of objects found, pagination information, and the total content length.  |

### Curl example:

Info about the users requests without the response:

```bash
curl --basic --user 'user:key' -i -X HEAD http://api.goteo.org/v1/users/
```

```
HTTP/1.0 200 OK
Content-Type: application/json
Content-Length: 2113
Access-Control-Allow-Origin: *
Access-Control-Allow-Credentials: true
Access-Control-Allow-Methods: POST, OPTIONS, GET
Access-Control-Allow-Headers: Authorization
Access-Control-Max-Age: 1
X-RateLimit-Remaining: 59
X-RateLimit-Limit: 60
X-RateLimit-Reset: 1424167620
Date: Tue, 17 Feb 2015 10:06:37 GMT
```

## HTTP Statuses

todo...

## Responses

todo ...

## Meta

todo ...

## Rate limit