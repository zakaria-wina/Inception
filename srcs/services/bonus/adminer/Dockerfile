# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zwina <zwina@student.1337.ma>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/21 16:38:18 by zwina             #+#    #+#              #
#    Updated: 2023/05/23 23:35:48 by zwina            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt update -y && apt upgrade -y && \
    apt install wget php -y

RUN wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer.php && \
    chmod 744 /var/www/html/adminer.php

WORKDIR /var/www/html

CMD [ "php", "-S", "0.0.0.0:8080" ]
