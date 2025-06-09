FROM golang:1.24-alpine AS builder

WORKDIR /app
COPY . .
RUN go mod init service1 \
    && go mod tidy \
    && CGO_ENABLED=0 GOOS=linux go build -o /service1

FROM alpine:latest
WORKDIR /app
COPY --from=builder /service1 /app/
RUN chmod +x /app/service1

EXPOSE 8081

CMD ["/app/service1"]
