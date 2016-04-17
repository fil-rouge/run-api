# testing devise with curl


_create a new session_
```
curl -v -H 'Content-Type: application/json' -H 'Accept: application/json' -X POST http://localhost:3000/users/sign_in -d "{\"user\":{\"email\":\"test@test.com\",\"password\":\"password\"}}"
```

## USERS


_create a new account/user_
```
curl -v -H 'Content-Type: application/json' -H 'Accept: application/json' -X POST http://localhost:3000/users -d "{\"user\":{\"email\":\"test@test.com\",\"password\":\"password\"}}"
```


_get a user_ (pretty print in terminal)
```
curl -v -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'user_id: 2' -H 'token: 447hXkTzyj6j19JDcun8' -X GET localhost:3000/users/2 -d "{\"user\":{\"email\":\"test@test.com\",\"password\":\"password\"}}" | python -m json.tool
```

_update a user_
```
curl -v -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'user_id: 11' -H 'token: jcqL7ggms3gZu5HSj8ob' -X PUT localhost:3000/users/11 -d "{\"user\":{\"email\":\"lol@lol.com\", \"name\":\"lol\" ,\"password\":\"password\"}}" | python -m json.tool
```

_get all users_
```
curl localhost:3000/users | python -m json.tool
```

## CIRCUITS

_get all circuits_
```
curl localhost:3000/circuits
```
## GROUPS

_get all groups_
```
curl localhost:3000/groups
```

_create a group_
```
curl -v -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'user_id: 20' -H 'token: cxjC-2JhQgzzuTzEVDrV' -X POST http://localhost:3000/groups -d "{\"group\":{\"name\":\"ccacaca\",\"description\":\"c'est mon groupe\", \"admin_id\":\"20\"}}"
```


## DEPLOYEMENT

_push to heroku_

```
git push heroku master
```

*OR*

```
git push develop develop:master
```
