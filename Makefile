# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zwina <zwina@student.1337.ma>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/06 15:50:59 by zwina             #+#    #+#              #
#    Updated: 2023/05/23 23:26:46 by zwina            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NGX 	:= nginx
WDP 	:= wordpress
MDB 	:= mariadb

build:
	mkdir -p /home/zwina/data/wordpress_vol /home/zwina/data/mariadb_vol
	docker compose -f ./srcs/docker-compose.yml build
up:
	mkdir -p /home/zwina/data/wordpress_vol /home/zwina/data/mariadb_vol
	docker compose -f ./srcs/docker-compose.yml up
down:
	docker compose -f ./srcs/docker-compose.yml down
down-all:
	docker compose -f ./srcs/docker-compose.yml down --rmi all -v
	sudo rm -rf /home/zwina/data/*/*
prune:
	docker system prune --all --force

re-up: down up
re-build: down-all build
clean: down-all prune
