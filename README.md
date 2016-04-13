#### testing devise with curl


_create a new account_
```
curl -v -H 'Content-Type: application/json' -H 'Accept: application/json' -X POST http://localhost:3000/users -d "{\"user\":{\"email\":\"test@test.com\",\"password\":\"password\"}}"
```

_create a new session_
```
curl -v -H 'Content-Type: application/json' -H 'Accept: application/json' -X POST http://localhost:3000/users/sign_in -d "{\"user\":{\"email\":\"test@test.com\",\"password\":\"password\"}}"
```

_get a user_ (pretty print in terminal)
```
curl -v -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'user_id: 2' -H 'token: 447hXkTzyj6j19JDcun8' -X GET localhost:3000/users/2 -d "{\"user\":{\"email\":\"test@test.com\",\"password\":\"password\"}}" | python -m json.tool
```

_get all users_
```
curl localhost:3000/users | python -m json.tool
```


_get all circuits_
```
curl localhost:3000/circuits
```

_get all groups
```
curl localhost:3000/groups
```


_push to heroku_

```
git push heroku master
```

*OR*

```
git push develop develop:master
```
