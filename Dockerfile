FROM golang:alpine

LABEL maintainer="Gerben Geijteman <gerben@hyperized.net>"
LABEL description="A simple Alpine container with the latest version of AZCopy"

RUN apk add --no-cache git
RUN go get -u github.com/Azure/azure-storage-azcopy
WORKDIR /go/src/github.com/Azure/azure-storage-azcopy
ENV GOOS linux
ENV GARCH amd64
ENV CGO_ENABLED 0
RUN go install -v -a -installsuffix cgo
COPY /go/bin/azure-storage-azcopy /usr/bin/azcopy
