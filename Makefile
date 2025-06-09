.PHONY: all build run clean rebuild

all: build run

build:
	docker-compose build --no-cache

run:
	docker-compose up --remove-orphans

clean:
	docker-compose down --rmi all --remove-orphans
	rebuild: clean build
