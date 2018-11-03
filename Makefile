.PHONY: gen

all: gen
	go build -o bin/server server/main.go
	go build -o bin/client client/main.go

gen:
	protoc -I api/ \
		-I ${GOPATH}/src \
		-I ${GOPATH}/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
		--go_out=plugins=grpc:api \
		--grpc-gateway_out=logtostderr=true:api \
		--swagger_out=logtostderr=true:api \
		api/service.proto

setup:
	brew bundle
	go get -u github.com/golang/protobuf/protoc-gen-go
	go get -u github.com/grpc-ecosystem/grpc-gateway/{protoc-gen-swagger,protoc-gen-grpc-gateway}