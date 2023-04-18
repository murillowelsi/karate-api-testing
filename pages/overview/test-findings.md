# Test Findings

## Issue 1

I have noticed that when I start the Api Service docker container, the following error is returned in the logs:

```
2023-03-20 22:36:35 unknown format "email" ignored in schema at path "#/properties/value/definitions/UserRequest/properties/email"
2023-03-20 22:36:35 unknown format "email" ignored in schema at path "#/properties/value/definitions/UserRequest/properties/email"
2023-03-20 22:36:35 unknown format "email" ignored in schema at path "#/properties/value/definitions/UserRequest/properties/email"
2023-03-20 22:36:35 unknown format "email" ignored in schema at path "#/properties/value/definitions/UserRequest/properties/email"
2023-03-20 22:36:35 unknown format "email" ignored in schema at path "#/properties/value/properties/email"
2023-03-20 22:36:35 unknown format "email" ignored in schema at path "#/properties/value/properties/email"
2023-03-20 22:36:35 unknown format "email" ignored in schema at path "#/properties/value/definitions/UserRequest/properties/email"
2023-03-20 22:36:35 unknown format "email" ignored in schema at path "#/properties/value/definitions/UserRequest/properties/email"
2023-03-20 22:36:35 Listening on port 8900
```

Apparently, the "email" format is being ignored in the JSON schema for some properties, which can happen either because
the JSON schema validator being used does not support the "email" format or because the format is not correctly defined
in the schema.

## Issue 2

I found a potential issue when sending a **PUT** request to an endpoint that only accepts **POST** or **GET** methods.
The server responded with a **404** error, indicating that the resource was not found.

**cURL to reproduce:**

```bash
curl --location --request DELETE 'http://localhost:8900/booking/2'
```

**Response:**

```json
{
  "errors":  null,
  "message": "Not Found"
}
```

It is suggested that the server should return a **405** status code instead, indicating that the **method is not allowed**
for the requested endpoint.
