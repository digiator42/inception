
all:
	@docker-compose -f ./srcs/docker-compose.yml up -d

build:
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker-compose -f ./srcs/docker-compose.yml down

up:
	@docker-compose -f ./srcs/docker-compose.yml up -d

re: fclean all

clean: down
	@docker system prune -a
	@sudo rm -rf /home/${USER}/data/wordpress/*
	@sudo rm -rf /home/${USER}/data/mariadb/*
	@sudo rm -rf /home/${USER}/data/mariadb/./sh*


fclean:
	@if [ ! -z "$$(docker ps -aq)" ]; then \
		docker stop $$(docker ps -aq); \
	fi
	@docker system prune --all --force --volumes
	@if [ ! -z "$$(docker volume ls -q)" ]; then \
		docker volume rm $$(docker volume ls -q); \
	fi
	@sudo rm -rf /home/${USER}/data/wordpress/*
	@sudo rm -rf /home/${USER}/data/mariadb/*
	@sudo rm -rf /home/${USER}/data/mariadb/./sh*
	

.PHONY	: all build down re clean fclean
