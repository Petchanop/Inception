# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: npiya-is <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/09/14 00:02:27 by npiya-is          #+#    #+#              #
#    Updated: 2023/10/03 01:49:40 by npiya-is         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME= inception

SRC= srcs

all: $(NAME)

$(NAME):
	@echo "Compiling inception..."
	mkdir -p $(HOME)/data/
	mkdir -p $(HOME)/data/wordpress
	mkdir -p $(HOME)/data/database

up:$(NAME)
	docker-compose --env-file ./srcs/.env -f srcs/docker-compose.yml up --build -d

down:
	docker-compose -f srcs/docker-compose.yml stop
	docker-compose -f srcs/docker-compose.yml down --volumes

clean:down
	docker network prune -f

fclean:clean
	sudo rm -rf $(HOME)/data/*
	sudo rm -rf $(HOME)/data
	docker image prune -a

re:fclean all
	docker-compose --env-file ./srcs/.env -f srcs/docker-compose.yml up --force-recreate --build -d

.PHONY: all up down clean fclean re

# docker rm $$(docker ps -qa)
# docker rmi -f $$(docker images -qa)
# docker volume rm $$(docker volume ls -q)
