FROM golang:1.24-alpine AS builder

WORKDIR /app
COPY . .

RUN go mod tidy \
 && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /app/service

FROM alpine:latest
COPY --from=builder /app/service /bin/service
EXPOSE 8080
ENTRYPOINT ["/bin/service"]