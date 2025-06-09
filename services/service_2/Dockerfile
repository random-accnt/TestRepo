FROM golang:1.24-alpine AS builder

WORKDIR /app
COPY . .
RUN go mod init service2 \
    && go mod tidy \
    && CGO_ENABLED=0 GOOS=linux go build -o /service2

FROM alpine:latest
WORKDIR /app
COPY --from=builder /service2 /app/
RUN chmod +x /app/service2

EXPOSE 8082

CMD ["/app/service2"]
