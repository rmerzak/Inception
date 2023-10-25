
compose_file=./srcs/docker-compose.yml

build:
	mkdir -p /home/rmerzak/data/data_db
	mkdir -p /home/rmerzak/data/data_wp
	docker-compose -f $(compose_file) build
run:
	docker-compose -f $(compose_file) up -d

stop:
	docker-compose -f $(compose_file) stop

down:
	docker-compose -f $(compose_file) down
	docker system prune -f --all --volumes
	rm -rf /home/rmerzak/data/data_db
	rm -rf /home/rmerzak/data/data_wp

.PHONY: build run down stop