
compose_file=./srcs/docker-compose.yml

build:
	docker-compose -f $(compose_file) build

run:
	docker-compose -f $(compose_file) up


down:
	docker-compose -f $(compose_file) down
	docker system prune -f --all --volumes

.PHONY: build run