# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zwina <zwina@student.1337.ma>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/06 07:46:03 by zwina             #+#    #+#              #
#    Updated: 2023/05/21 19:50:46 by zwina            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt update -y && apt upgrade -y && \
    apt install mariadb-server -y

COPY tools/launch.sh /

RUN chmod 744 /launch.sh

CMD [ "/launch.sh" ]
