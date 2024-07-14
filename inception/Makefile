# Makefile

# Variables
DOCKER_COMPOSE := docker-compose -f srcs/docker-compose.yml

# Targets
all: setup build

setup:
	@mkdir -p /home/ahkalama/data/wordpress
	@mkdir -p /home/ahkalama/data/mariadb

build:
	$(DOCKER_COMPOSE) up --build

start:
	$(DOCKER_COMPOSE) start

stop:
	$(DOCKER_COMPOSE) stop

clean:
	$(DOCKER_COMPOSE) down --volumes

fclean: clean
	docker system prune -af
	rm -rf /home/ahkalama/data

re: fclean all

.PHONY: all setup build start stop clean fclean re

