FROM golang:1.11 as builder
WORKDIR /go/theykk
COPY . .
RUN make build

# Create a minimal container to run a Golang static binary
FROM scratch
COPY --from=builder /go/theykk/environ .
ENTRYPOINT ["/environ"]
