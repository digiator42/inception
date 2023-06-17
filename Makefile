name = inception
all:
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

build:
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

down:
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

re:
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

clean: down
	@docker system prune -a
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*


fclean:
	@docker stop $$(docker ps -aq)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/wordpress/.*
	@sudo rm -rf ~/data/mariadb/*
	@sudo rm -rf ~/data/mariadb/.*
ffclean:
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/wordpress/.*
	@sudo rm -rf ~/data/mariadb/*
	@sudo rm -rf ~/data/mariadb/.*

.PHONY	: all build down re clean fclean
