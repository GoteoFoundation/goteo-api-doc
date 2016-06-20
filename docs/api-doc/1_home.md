---
layout: default
title: Introduction
group: apidoc
permalink: /doc/index.html

---
# GOTEO API v1.1

## Introduction

Welcome to the API for the crowdfunding platform [Goteo.org](http://goteo.org).

Fundación Goteo is pleased to present our open data API and to share our work with people interested in data, API and visualizations, specifically data on crowdfunding and our Goteo.org community. We offer you access to all of the activities and the impact of the Goteo platform. Our ultimate aim is to build new standards in the worlds of collective finance and collaborative economy, while also contributing to the open data commons.

We want to share this new development and battery of open resources with developers and experts in analysis and data visualization, as well as general researchers. If you've got ideas about new applications and uses for the data we have been gathering since 2012, and crowdfunding in general, we're ready for you!

We’re open to contributions in:

* Improving our API, along with the common good, in the aspect of open data.
* Creating new applications and visualizations
* Comparing and finding new hypotheses about the relationships emerging between resources, needs, people and open projects looking for funding.

Please contact us with any questions or comments.

#### API URL: [{{ site.apiurl }}]({{ site.apiurl }})

The API is compatible with the [Swagger](http://swagger.io/) specification. Checkout the [html console interface](console.html) for a live testing console or the [json interface]({{ site.api_spec }})


## Authentication

This API requires authentication, please referer to the [Authentication section](security.html) for details.

## Quick start: Basic usage

If you have a user/key, you can make petitions to some endpoints. Here are few examples:

### CURL example from the command line:

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

The API is accessible through both HTTP and HTTPS protocols by any tool that can communicate using http basic user authentication.

Currently, the API is in a read-only state so only GET, OPTIONS and HEAD methods are available at this point.

|  Method | Usage |
| ------- | ----- |
| GET     | This is the method that should be used to retrieve any data from the Goteo platform. The response will be  returned to you as a JSON object.<br><br> Additionally, some endpoints accept parameters in the URL letting you filter the result in several ways.<br><br> All requests using the GET method are read-only.    |
| OPTIONS | This method is used mainly to retrieve the methods available (GET, OPTIONS, HEAD) in the API. It is also necessary to obtain information about whether CORS authorization is enabled.<br><br> Normally, this is used automatically by modern browsers before performing the requested GET petition.<br><br>**CORS** is enabled for full access in this API. |
| HEAD    | To retrieve metadata information, the HEAD method returns the headers associated to a specific GET request.<br><br>Response headers contain some useful information about your API access and the results that are available for your request.<br><br>For instance, the headers contain your current rate-limit value and the amount of time available until the limit resets. It also contains metrics about the total number of objects found, pagination information, and the total content length.  |

### Curl example:

Info about the users requests without the response:

```bash
curl --basic --user 'user:key' -i --head http://api.goteo.org/v1/users/
```

Headers returned:

```http
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

Along with the HTTP methods that the API responds to, it will also return standard HTTP statuses, including error codes.

In the event of a problem, the status will contain the error code, while the body of the response will usually contain additional information about the problem that was encountered.

In general, if the status returned is in the 200 range, it indicates that the request was fulfilled successfully and that no error was encountered.

Return codes in the 400 range typically indicate that there was an issue with the request that was sent. Among other things, this could mean that you did not authenticate correctly, that you are requesting an action that you do not have authorization for, that the object you are requesting does not exist, or that your request is malformed.

If you receive a status in the 500 range, this generally indicates a server-side problem. This means that we are having an issue on our end and cannot fulfill your request currently.

**Tipical responses returned by the API:**

| Code | Error | Description |
|------|-------|-------------|
| 200  | None  | request ok |
| 401  | yes, in request | Resource requires authorization, authentication is needed or was unsuccessful |
| 400  | yes, in request | Invalid parameters format, typically when data passed in the query string does not much the proper required format |
| 404  | yes, in request | Resource not found, invalid endpoint or the OBJECT ID required does not exists |
| 429  | yes, in request | Too many resources, no more requests can be made until a new time window starts |
| 500  | yes, in server | Server error, that's on us! Please report and we will investigate. |
