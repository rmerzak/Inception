
compose_file=./srcs/docker-compose.yml

build:
	mkdir -p /home/rmerzak/data/data_db
	mkdir -p /home/rmerzak/data/data_wp
	docker-compose -f $(compose_file) up --build -d

run:
	docker-compose -f $(compose_file) up -d


down:
	docker-compose -f $(compose_file) down
	docker system prune -f --all --volumes
	rm -rf /home/rmerzak/data/data_db
	rm -rf /home/rmerzak/data/data_wp

.PHONY: build run down