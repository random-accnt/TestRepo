FROM golang:1.24-alpine AS builder

WORKDIR /app
COPY . .
RUN go mod init service2 \
    && go mod tidy \
    && CGO_ENABLED=0 GOOS=linux go build -o service2

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/service2 .

EXPOSE 8082

CMD ["./service2"]
