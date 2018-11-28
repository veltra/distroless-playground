FROM golang:1.8 as build
WORKDIR /go/src/hello
COPY hello.go .
RUN go install

FROM gcr.io/distroless/base
COPY --from=build /go/bin/hello /
CMD ["/hello"]
