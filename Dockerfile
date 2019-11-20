FROM hyperized/scratch:latest as trigger
# Used to trigger Docker hubs auto build, which it wont do on the official images

FROM golang:alpine as builder

LABEL maintainer="Gerben Geijteman <gerben@hyperized.net>"
LABEL description="A simple Alpine container with the latest version of AZCopy"

RUN apk add --no-cache git && rm -rf /var/cache/apk/*
RUN go get -u github.com/Azure/azure-storage-azcopy
WORKDIR /go/src/github.com/Azure/azure-storage-azcopy
ENV GOOS linux
ENV GARCH amd64
ENV CGO_ENABLED 0
RUN go install -v -a -installsuffix cgo

FROM alpine
COPY --from=builder /go/bin/azure-storage-azcopy /app/azcopy
RUN apk add --no-cache ca-certificates && rm -rf /var/cache/apk/*
ENTRYPOINT ["/app/azcopy"]
CMD ["--version"]
