
compose_file=./srcs/docker-compose.yml

build:
	mkdir -p /Users/rmerzak/Desktop/inception/srcs/data_db
	mkdir -p /Users/rmerzak/Desktop/inception/srcs/data_wp
	docker-compose -f $(compose_file) up --build

run:
	docker-compose -f $(compose_file) up


down:
	docker-compose -f $(compose_file) down
	docker system prune -f --all --volumes
	rm -rf /Users/rmerzak/Desktop/inception/srcs/data_db
	rm -rf /Users/rmerzak/Desktop/inception/srcs/data_wp

.PHONY: build run