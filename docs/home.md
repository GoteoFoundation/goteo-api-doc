---
layout: default
title: API Introduction
permalink: /
---
## Introduction

```bash
curl -i {{ site.apiurl }}/reports/money
curl -i -X GET -d from_date="2014-01-01" {{ site.apiurl }}/reports/money
curl -i -X GET -d project="diagonal" {{ site.apiurl }}/reports/money
curl -i -X GET -d location="36.716667,-4.416667,100" {{ site.apiurl }}/reports/projects

curl -i --basic --user "user:key" {{ site.apiurl }}/reports/ 
```
