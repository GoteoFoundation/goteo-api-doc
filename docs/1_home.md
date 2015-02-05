---
layout: default
title: API Introduction
permalink: /
---
# GOTEO API v1.0
> Currently in **BETA** (big changes can be expected at any moment!)

## Introduction

This is the API for the crowdfunding platform [Goteo.org](http://goteo.org).

#### API URL: [http://api.goteo.org/v1](http://api.goteo.org/v1)


## Authentication

This API uses Http authentication, please get your **user** and **password** from your activity dashboard in [http://goteo.org/dashboard/activity/apikey](http://goteo.org/dashboard/activity/apikey)

## Basic usage

TODO...

```bash
curl -i {{ site.apiurl }}/reports/money
curl -i -X GET -d from_date="2014-01-01" {{ site.apiurl }}/reports/money
curl -i -X GET -d project="diagonal" {{ site.apiurl }}/reports/money
curl -i -X GET -d location="36.716667,-4.416667,100" {{ site.apiurl }}/reports/projects

curl -i --basic --user "user:key" {{ site.apiurl }}/reports/ 
```
