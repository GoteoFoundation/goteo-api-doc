---
layout: default
title: API Introduction
permalink: /
---
goteo
## Introduction

```bash
curl -i http://api.goteo.org/reports/money
curl -i -X GET -d from_date="2014-01-01" http://api.goteo.org/reports/money
curl -i -X GET -d project="diagonal" http://api.goteo.org/reports/money
curl -i -X GET -d location="36.716667,-4.416667,100" http://api.goteo.org/reports/projects

curl -i --basic --user "user:key" http://api.goteo.org/reports/ 
```
