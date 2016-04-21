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

_Destroy a user_
```
curl -v -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'user_id: 20' -H 'token: cxjC-2JhQgzzuTzEVDrV' -X DELETE localhost:3000/users/20  | python -m json.tool
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


## TEST


```
bundle exec rspec
```


#####Scenarii:

- [ ] un utilisateur cree un compte
- [ ] un utilisateur cree une session
- [ ] un utilisateur detruit une session
- [ ] un utilisateur non enregistré essaie de creer/supprimer/modifier une session
- [ ] un utilisateur supprimer son compte
- [ ] un utilisateur oublie son mdp
- [ ] un utilisateur bloque son compte
- [ ] un utilisateur change son mdp
- [ ] un utilisateur change son email


- [ ] un utilisateur cree un group/circuits
- [ ] un utilisateur joint un group
- [ ] un utilisateur quite un groupe
- [ ] un utilisateur essaie de modifier un groupe
- [ ] un admin modifie un groupe
- [ ] un admin quitte un groupe
- [ ] un admin supprimer un groupe
- [ ] un admin donne son droit d'admin a qqn

- [ ] un utilisateur ajoute un circuits
- [ ] un utilisateur modfifier un circuits ?? # que fait si il y a d'autre user dessus
- [ ] un utilisateur supprmier le circuit ? (cb de user reste il)


###### test secu

- [ ] un serveur sans les api key veut consumer l'api
- [ ] on recoit un flood d'un utilisateur
- [ ] on recoit une alternance forte de 2 ip differentes pour un users ? => invalider la session
- [ ] injection














