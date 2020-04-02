FROM golang:1.14.1-alpine3.11 as builder

WORKDIR /go/src/app
COPY . .
RUN go build ola.go


FROM hello-world

COPY --from=builder /go/src/app .
CMD ["/ola"]