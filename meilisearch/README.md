

## Getting sample data file
```
$ curl -#LO https://www.meilisearch.com/assets/datasets/movies.json 
```

## Making index
```
$ curl \
  -X POST 'http://127.0.0.1:7700/indexes/movies/documents?primaryKey=id' \
  -H 'Content-Type: application/json' \
  --data-binary @movies.json
```

## Deleting index
```
$ curl -X DELETE 'http://localhost:7700/indexes/movies'
```

## Getting index
```
$ curl -X GET 'http://localhost:7700/indexes/movies'
```

## Getting status
```
$ curl \
  -X GET 'http://127.0.0.1:7700/tasks/0' 
```

## Searching with query
```
$ curl \
  -X POST 'http://127.0.0.1:7700/indexes/movies/search' \
  -H 'Content-Type: application/json' \
  --data-binary '{ "q": "botman" }'
```
