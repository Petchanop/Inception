# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: npiya-is <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/09/14 00:02:27 by npiya-is          #+#    #+#              #
#    Updated: 2023/09/30 00:31:51 by npiya-is         ###   ########.fr        #
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

up:all
	docker-compose -f srcs/docker-compose.yml up -d

down:
	docker-compose -f srcs/docker-compose.yml down --volumes

clean:down
	docker image prune -a

fclean:clean
	rm -rf $(HOME)/data/
	rm -rf $(HOME)/data/wordpress
	rm -rf $(HOME)/data/database

re:fclean
	docker-compose -f srcs/docker-compose.yml up --force-recreate --build -d

.PHONY: all up down clean fclean re