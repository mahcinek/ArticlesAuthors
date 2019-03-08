# API Documentation

  * [AAPiwekWeb.ArticleController](#aapiwekweb-articlecontroller)
    * [index](#aapiwekweb-articlecontroller-index)
    * [create](#aapiwekweb-articlecontroller-create)
    * [delete](#aapiwekweb-articlecontroller-delete)
  * [AAPiwekWeb.AuthorController](#aapiwekweb-authorcontroller)
    * [create](#aapiwekweb-authorcontroller-create)
    * [show](#aapiwekweb-authorcontroller-show)
    * [update](#aapiwekweb-authorcontroller-update)

## AAPiwekWeb.ArticleController
### <a id=aapiwekweb-articlecontroller-index></a>index
#### List all articles
##### Request
* __Method:__ GET
* __Path:__ /api/v1/articles
* __Request headers:__
```
accept: application/json
authorization: Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJBQVBpd2VrIiwiZXhwIjoxNTUyMDU3NDcwLCJpYXQiOjE1NTIwNTM4NzAsImlzcyI6IkFBUGl3ZWsiLCJqdGkiOiI0ODkxZTgwOC02NTBmLTRjNTItYWQ4NC1lYjMzZWFkYjk0ZTIiLCJuYmYiOjE1NTIwNTM4NjksInN1YiI6IjE2NTUiLCJ0eXAiOiJhY2Nlc3MifQ.3bWaqAqptIXK3Tq2XgYV9PGW0_Plws9pQ9mS3l_iliOroycpgDDxGKbWCJ-HN_pdRMIfBhrPkEovWy7I4fyW0Q
```

##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: 2m501he3jb56s5qadk000111
```
* __Response body:__
```json
{
  "data": [
    {
      "author": {
        "age": 42,
        "first_name": "some first_name",
        "id": 1656,
        "last_name": "some  last_name"
      },
      "body": "some body",
      "description": "some description",
      "id": 684,
      "published_at": "2010-04-17T14:00:00Z",
      "title": "some title"
    }
  ]
}
```

### <a id=aapiwekweb-articlecontroller-create></a>create
#### Create article
##### Request
* __Method:__ POST
* __Path:__ /api/v1/articles
* __Request headers:__
```
accept: application/json
authorization: Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJBQVBpd2VrIiwiZXhwIjoxNTUyMDU3NDcwLCJpYXQiOjE1NTIwNTM4NzAsImlzcyI6IkFBUGl3ZWsiLCJqdGkiOiI2NjNjYzU5Mi1hOGVjLTRkODktYjVkYi1hMzVjNWEzZjNhOWYiLCJuYmYiOjE1NTIwNTM4NjksInN1YiI6IjE2NTQiLCJ0eXAiOiJhY2Nlc3MifQ.m6hxadkYM37_0zwteEhiWQ45_Ifs2UrWN0Cr-chKJwm0oo-wHvBbrFnHOfZZVAcWDORx6KkQgz1GJpEbb2J7WA
content-type: multipart/mixed; boundary=plug_conn_test
```
* __Request body:__
```json
{
  "article": {
    "body": "some body",
    "description": "some description",
    "published_at": "2010-04-17T14:00:00Z",
    "title": "some title"
  }
}
```

##### Response
* __Status__: 201
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: 2m501he3abumeeocuk000101
```
* __Response body:__
```json
{
  "data": {
    "body": "some body",
    "description": "some description",
    "id": 683,
    "published_at": "2010-04-17T14:00:00Z",
    "title": "some title"
  }
}
```

### <a id=aapiwekweb-articlecontroller-delete></a>delete
#### Delete article
##### Request
* __Method:__ DELETE
* __Path:__ /api/v1/articles/685
* __Request headers:__
```
accept: application/json
authorization: Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJBQVBpd2VrIiwiZXhwIjoxNTUyMDU3NDcwLCJpYXQiOjE1NTIwNTM4NzAsImlzcyI6IkFBUGl3ZWsiLCJqdGkiOiI1ZjJmZjM0OS1lMjdlLTRmYzMtOGYyNy0xMjdiOTBlYWVkOGEiLCJuYmYiOjE1NTIwNTM4NjksInN1YiI6IjE2NTgiLCJ0eXAiOiJhY2Nlc3MifQ.eXN7scPQ8uyUdvXz9rpL8k9G8ivdpm7FduqbXNC1TgVL5YVUci659mJJ8qlW_IneywBHS4x1p4aPeke9Qo3atw
```

##### Response
* __Status__: 204
* __Response headers:__
```
cache-control: max-age=0, private, must-revalidate
x-request-id: 2m501he3uv58lc9tds000131
```
* __Response body:__
```json

```

## AAPiwekWeb.AuthorController
### <a id=aapiwekweb-authorcontroller-create></a>create
#### Create Author
##### Request
* __Method:__ POST
* __Path:__ /api/v1/authors
* __Request headers:__
```
content-type: multipart/mixed; boundary=plug_conn_test
```
* __Request body:__
```json
{
  "author": {
    "age": 42,
    "first_name": "some first_name",
    "last_name": "some last_name"
  }
}
```

##### Response
* __Status__: 201
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: 2m501hdt9flbcss97g0000u1
location: /api/v1/authors/1649
```
* __Response body:__
```json
{
  "age": 42,
  "first_name": "some first_name",
  "id": 1649,
  "last_name": "some last_name",
  "token": "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJBQVBpd2VrIiwiZXhwIjoxNTUyMDU3NDcwLCJpYXQiOjE1NTIwNTM4NzAsImlzcyI6IkFBUGl3ZWsiLCJqdGkiOiJhODIyZDZkZC0yNDJhLTQyNmItYTdjYi0yYmE0NjNhYjBlZTEiLCJuYmYiOjE1NTIwNTM4NjksInN1YiI6IjE2NDkiLCJ0eXAiOiJhY2Nlc3MifQ.8nTQGhUDpBIG3L3cTMmjWzQbw_dTHr4_QPY9nuCHOLuonsB2GoAqfyEP763EDt3iU6hTnP9Q_dvDTPJYgve28w"
}
```

### <a id=aapiwekweb-authorcontroller-show></a>show
#### Show author
##### Request
* __Method:__ GET
* __Path:__ /api/v1/authors/1651
* __Request headers:__
```
accept: application/json
authorization: Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJBQVBpd2VrIiwiZXhwIjoxNTUyMDU3NDcwLCJpYXQiOjE1NTIwNTM4NzAsImlzcyI6IkFBUGl3ZWsiLCJqdGkiOiI1MzQzMzM3OC1mNjlhLTQ3YTEtOWE3MS1lNWE5YjRlMGYzZDkiLCJuYmYiOjE1NTIwNTM4NjksInN1YiI6IjE2NTEiLCJ0eXAiOiJhY2Nlc3MifQ.966-ewVNHInydv2YItnUtfU4EnopyQqWYZXbgNC1I46QfYIsdqg-U6nScbBrQFI_zCTWMmQWz9ronyMek1mc5Q
```

##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: 2m501he1j78f68v4jk0000n2
```
* __Response body:__
```json
{
  "data": {
    "age": 42,
    "first_name": "some first_name",
    "id": 1651,
    "last_name": "some last_name"
  }
}
```

### <a id=aapiwekweb-authorcontroller-update></a>update
#### Update author
##### Request
* __Method:__ PUT
* __Path:__ /api/v1/authors
* __Request headers:__
```
accept: application/json
authorization: Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJBQVBpd2VrIiwiZXhwIjoxNTUyMDU3NDcwLCJpYXQiOjE1NTIwNTM4NzAsImlzcyI6IkFBUGl3ZWsiLCJqdGkiOiIxOWVlZDNlYi1jNzlkLTQ0NTktODhlZS1kYmYyNzIzYWIxMTUiLCJuYmYiOjE1NTIwNTM4NjksInN1YiI6IjE2NTIiLCJ0eXAiOiJhY2Nlc3MifQ.bh4jYbSL_2e1TAr3oa4kKpUC218xKtI9VvgQAnrjCU65drn1uD1iv1iZt13EkmCIxkV3GFoJ3CrtW8Hqfl6-Og
content-type: multipart/mixed; boundary=plug_conn_test
```
* __Request body:__
```json
{
  "author": {
    "age": 43,
    "first_name": "some updated first_name",
    "last_name": "some updated last_name"
  }
}
```

##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: 2m501he2mrtpvmd4gg0000p2
```
* __Response body:__
```json
{
  "data": {
    "age": 43,
    "first_name": "some updated first_name",
    "id": 1652,
    "last_name": "some updated last_name"
  }
}
```

