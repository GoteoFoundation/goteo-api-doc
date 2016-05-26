---
layout: default
title: Security
group: apidoc
permalink: /doc/security/

---

# Authentication

This API requires authentication, currently we support 2 types: *Basic* and *OAuth implict*

<a name="basic"></a>
### Basic authentication

Basic authentication is the first method we implemented in the API. It grants permissions to access public resources (such as minimal user data, published projects information, etc.)

You will need (**mandatory**) an API USER/KEY to use this authentication method.

> Get your **user** and **key** from your activity dashboard in the  [Goteo platform](http://goteo.org/dashboard/activity/apikey)

Then you are ready to make requests on the endpoints that supports this authentication method:

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/projects/
```

This authentication method is intended, mostly, for machines or scripts accessing the API.

<a name="oauth"></a>
### OAuth authentication

We have introduced a new authentication method to increase security whilst accessing the API. This method does not requires to send your *user* and *password* in every requests through Internet, you will authenticate using a special *login* endpoint to obtain a temporary *token* to be sent on your behalf instead.

This method will allow the creation of more complex applications for the final user in the future.

#### OAuth implicit flow

1. The user makes a request by sending *user* and *password* to the login endpoint:

    **Note that, in this case, an API KEY is not needed (although can be used as well), the regular user/password will get the job done**:

   ```bash
    curl -i --basic --user "user:password" {{ site.apiurl }}/login
    ```

    *Alternatively:*

   ```bash
    curl -i --basic --user "user:key" {{ site.apiurl }}/login
    ```

    Either way, if the authentication is successful will receive a proper `200 OK` response with the necessary token:

    ```json
    {
      "access_token": "eyJleHAiOjE0NjQyODg1NTgsImlhdCI6MTQ2NDI4Nzk1OCwiYWxnIjoiSFMyNTYifQ",
      "expires_in": 600,
      "token_type": "bearer"
    }
    ```

    If the authentication is not valid, you will receive a `401 Unauthorized` code with some error message in the JSON body.

    ```json
    {
      "error": 401,
      "message": "Invalid access method or wrong credentials"
    }
    ```

    The token will expire in the number of seconds specified by the key `expires_in`, once the token is expired you will need to get a new one.

2. Once the *token* is obtained, you are ready to make requests to any endpoint by sending it through the `Authorization` HTTP Header and specifying `Bearer` instead of `Basic`:

   ```bash
    curl -H "Authorization: Bearer eyJleHAiOjE0NjQyODg1NTgsImlhdCI6MTQ2NDI4Nzk1OCwiYWxnIjoiSFMyNTYifQ" https://api.goteo.org/v1/projects/
    ```

    If the *token* is valid a proper `200 OK` with a JSON body will be returned. 
    If the *token* has expired or is not valid for any other reason the  `401 Unauthorized` response will be sent back.

> Currently, all endpoints can be accessed with both authentication methods.
> This may not be necessarily true for future endpoints (which may only use the OAuth method)

<a name="limits"></a>
## Rate limit

The API also implements and additional layer of security by limit the number of requests that can be made in a period of time. The frequency and the current status of this limits will be sent by using special custom HTTP headers:

1. `X-RateLimit-Remaining: XXX`
   Number of requests still available to the user for the current time window

2. `X-RateLimit-Limit: XXX`
   Maximum number of requests that can be made in a time window

3. `X-RateLimit-Reset: XXXXXXXXXXX`
   Date when the current time window will be reset. If the limit of requests has been reached, the user will not be allowed to make new petitions until this moment.

   This number is formated in Unix-time (number of seconds since Thursday, 1 January 1970)

### Example:

This could be the headers returned in response to successful request:

```http
HTTP/1.1 200 OK
Date: Wed, 30 Sep 2015 15:51:04 GMT
Content-Type: application/json
Content-Length: 6756
Connection: keep-alive
X-RateLimit-Remaining: 298
X-RateLimit-Limit: 300
X-RateLimit-Reset: 1443628800
```

This response indicates that the client still has 298 petitions available until the time window starts again (30 September 2015).

In case of the limit is reached, a `429 Too many requests` response will be returned.
