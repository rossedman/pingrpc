# pingrpc

This is a simple project I'm hacking on to learn how to create GRPC servers that also use the HTTP/1.1 reverse gateway proxy. 

## running

Make sure your `$GOPATH/bin` folder is in your `$PATH` and then run:

```
make setup
```

To build the project then run:

```
make
```

Then run the things!

```
bin/server
bin/client
curl -XPOST localhost:7778/v1/hello -d '{"greeting": "something"}'
```