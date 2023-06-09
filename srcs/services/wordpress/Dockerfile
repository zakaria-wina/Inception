# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zwina <zwina@student.1337.ma>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/06 07:46:20 by zwina             #+#    #+#              #
#    Updated: 2023/06/09 15:39:56 by zwina            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt update -y && apt upgrade -y && \
    apt install php7.3 php-fpm php-mysql php-mbstring php-zip php-gd php-curl php-xml php-redis php-json mariadb-client sendmail wget curl -y && \
    mkdir -p /var/www/html && mkdir -p /run/php

RUN wget "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar" -O /usr/local/bin/wp && \
    chmod 744 /usr/local/bin/wp

COPY tools/launch.sh /

RUN chmod 744 /launch.sh

CMD [ "/launch.sh" ]
