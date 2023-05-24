# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zwina <zwina@student.1337.ma>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/21 12:18:51 by zwina             #+#    #+#              #
#    Updated: 2023/05/23 23:45:37 by zwina            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt update -y && apt upgrade -y && \
    apt install redis -y

CMD ["redis-server", \
    "--protected-mode no", \
    "--bind 0.0.0.0", \
    "--maxmemory 2mb", \
    "--maxmemory-policy allkeys-lru"]
