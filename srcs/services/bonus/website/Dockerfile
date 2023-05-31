# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zwina <zwina@student.1337.ma>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/22 18:38:57 by zwina             #+#    #+#              #
#    Updated: 2023/05/31 18:34:57 by zwina            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt update -y && apt upgrade -y && \
    apt install nginx -y

COPY tools /var/www/html

COPY conf/nginx.conf /etc/nginx/conf.d

CMD [ "nginx", "-g", "daemon off;" ]
