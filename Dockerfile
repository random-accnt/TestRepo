FROM golang:1.24-alpine

WORKDIR /app
COPY . /app
RUN go run main.go

EXPOSE 8080
