# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zwina <zwina@student.1337.ma>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/23 23:16:24 by zwina             #+#    #+#              #
#    Updated: 2023/05/23 23:18:04 by zwina            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt update -y && apt upgrade -y && \
    apt install wget -y

RUN wget https://github.com/google/cadvisor/releases/download/v0.37.0/cadvisor && \
    chmod 744 cadvisor

CMD [ "./cadvisor" ]
