# docker run \
# 					 -d \
# 					 --rm \
# 					 --name postman \
# 					 --net=host \
# 					 --env=DISPLAY \
# 					 --add-host=localhost:127.0.0.1 \
# 					 -v /tmp/.X11-unix:/tmp/.X11-unix \
# 					 -v $HOME/.config/Postman:/home/postman/.config/Postman \
# 					 eugene/postman

FROM debian:sid-slim
LABEL maintainer "anilgol@live.com"

ARG USER_ID=1000
ARG GROUP_ID=1000

ENV URL https://dl.pstmn.io/download/latest/linux64

RUN apt update && \
		apt install -y \
								wget \
								libx11-xcb-dev \
								libgtk2.0-0 \
								libxtst6 \
								libxss1 \
								libfontconfig1 \
								libsm6 \
								libfreetype6 \
								libglib2.0-0 \
								libx11-xcb1 \
								libxi6 \
								libgconf-2-4 \
								libxcursor-dev \
								libnss3-dev \
								libasound2 \
								libcanberra-gtk-module

RUN wget -O /tmp/postman.tar.gz $URL && \
    mkdir -p /usr/share/postman && \
    tar xzvf /tmp/postman.tar.gz -C /usr/share/postman && \
    rm /tmp/postman.tar.gz

RUN groupadd -g ${GROUP_ID} -r postman && \
    useradd -m -u ${USER_ID} -r -g ${GROUP_ID} postman && \
    chown -R postman:postman /home/postman

WORKDIR /usr/share/postman/Postman

USER postman

CMD ["./Postman"]
