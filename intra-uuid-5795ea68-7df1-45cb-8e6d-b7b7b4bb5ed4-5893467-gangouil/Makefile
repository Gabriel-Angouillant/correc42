all: run

run:
	mkdir -p /home/gangouil/data/wordpress /home/gangouil/data/mariadb
	sudo docker compose -f srcs/docker-compose.yml up -d --build
	
down:
	sudo docker compose -f srcs/docker-compose.yml down
