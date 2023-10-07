
compose_file=./srcs/docker-compose.yml

build:
	mkdir -p /home/ubuntu/inception/srcs/data_db
	mkdir -p /home/ubuntu/inception/srcs/data_wp
	sudo docker-compose -f $(compose_file) up --build -d

run:
	sudo docker-compose -f $(compose_file) up -d


down:
	sudo docker-compose -f $(compose_file) down
	sudo docker system prune -f --all --volumes
	sudo rm -rf /home/ubuntu/inception/srcs/data_db
	sudo rm -rf /home/ubuntu/inception/srcs/data_wp

.PHONY: build run down