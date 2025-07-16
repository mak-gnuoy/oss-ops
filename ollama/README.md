

## Listing LLMs
```
$ docker exec -it ollama ollama list
```

## Pulling LLM
```
$ docker exec -it ollama ollama pull llama3
```

## Calling API
```
$ curl http://localhost:11434/api/generate -d '{ "model": "llama3", "prompt": "Hello" }'
$ curl http://localhost:11434/api/chat -d '{ "model": "llama3", "messages": [ { "role": "user", "content": "Hello" } ] }'
```
