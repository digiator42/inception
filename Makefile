
all:
	@docker-compose -f ./docker-compose.yml --env-file ./.env up -d --build

down:
	@docker-compose -f ./docker-compose.yml --env-file ./.env down


clean: down
	@docker system prune -a
	@sudo rm -rf $PWD/data/wordpress/*
	@sudo rm -rf $PWD/data/mariadb/*

fclean:
	@if [ -z "$$(docker ps -qa)" ]; then \
		echo "NO docker ps, prune takes over"; \
	fi
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@rm -rf $PWD/data/wordpress/*
	@rm -rf $PWD/data/mariadb/*
ffclean:
	# @if [ ! -z "$$(docker ps -qa)" ]; then \
	# 	@docker stop $$(docker ps -qa); \
	# fi
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@rm -rf $PWD/data/wordpress/*
	@rm -rf $PWD/data/mariadb/*

.PHONY	: all build down re clean fclean
