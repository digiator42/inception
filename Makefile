
all:
	@if [ ! -d /home/${USER}/data ]; then \
		mkdir -p /home/${USER}/data/wordpress  /home/${USER}/data/mariadb; \
	fi
	@docker-compose -f ./srcs/docker-compose.yml up -d

build:
	@if [ ! -d /home/${USER}/data ]; then \
		mkdir -p /home/${USER}/data/wordpress  /home/${USER}/data/mariadb; \
	fi
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker-compose -f ./srcs/docker-compose.yml down

up:
	@docker-compose -f ./srcs/docker-compose.yml up -d

re: fclean all

clean: down
	@docker system prune -a
	@sudo rm -rf /home/${USER}/data


fclean:
	@if [ ! -z "$$(docker ps -aq)" ]; then \
		docker stop $$(docker ps -aq); \
	fi
	@docker system prune --all --force --volumes
	@if [ ! -z "$$(docker volume ls -q)" ]; then \
		docker volume rm $$(docker volume ls -q); \
	fi
	@sudo rm -rf /home/${USER}/data
	

.PHONY	: all build down re clean fclean
