# docker run \
# 				 --rm \
# 				 -d \
# 				 --name robo3t \
# 				 --env=DISPLAY \
# 				 --net=host \
# 				 --privileged \
# 				 -v /tmp/.X11-unix:/tmp/.X11-unix \
# 				 -v /etc/localtime:/etc/localtime:ro \
# 				 -v $HOME/.cache/robo3t:/home/robo3t/.3T \
# 				 -v $HOME/.config/robo3t:/home/robo3t/.config/3T \
# 				 eugene/robo3t

# Known Bugs
# * Black/green view can occur sometimes on user interface.

FROM debian:buster-slim
LABEL maintainer "anilgol@live.com"

ARG SSH_PRIVATE_KEY

ARG USER_ID=1000
ARG GROUP_ID=1000

ENV VERSION 1.2.1
ENV KEY 3e50a65
ENV QT_DEBUG_PLUGINS 1
ENV QT_XKB_CONFIG_ROOT /usr/share/X11/xkb

RUN apt update && \
		apt install -y \
								wget \
								libgl1-mesa-glx \
								libfontconfig1 \
								libsm6 \
								libfreetype6 \
								libglib2.0-0 \
								libx11-xcb1 \
								libxi6 \
								libgconf-2-4 \
								libxcursor-dev

RUN wget https://download.robomongo.org/$VERSION/linux/robo3t-$VERSION-linux-x86_64-$KEY.tar.gz -O /tmp/robo3t.tar.gz && \
		cd /tmp && \
		tar xzvf /tmp/robo3t.tar.gz && \
		mv robo3t-* /usr/share/robo3t

RUN groupadd -g ${GROUP_ID} -r robo3t && \
		useradd -m -u ${USER_ID} -r -g ${GROUP_ID} robo3t

RUN mkdir /home/robo3t/.ssh && \
		chmod 0700 /home/robo3t/.ssh

RUN echo "$SSH_PRIVATE_KEY" > /home/robo3t/.ssh/id_rsa && \
		chmod -R 0600 /home/robo3t/.ssh/* && \
		chown -R robo3t:robo3t /home/robo3t

WORKDIR /usr/share/robo3t

USER robo3t

CMD [ "./bin/robo3t" ]
