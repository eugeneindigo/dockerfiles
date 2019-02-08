# docker run \
# 					-d \
# 					--name brave \
# 					--rm \
# 					--net host \
# 					--device /dev/snd \
# 					--device /dev/dri \
# 					--security-opt seccomp=$HOME/.config/chrome.json \
# 					-e DISPLAY=unix$DISPLAY \
# 					-v /dev/shm:/dev/shm \
# 					-v /etc/localtime:/etc/localtime:ro \
# 					-v /tmp/.X11-unix:/tmp/.X11-unix \
# 					-v $HOME/Downloads:/home/brave/Downloads \
# 					eugene/brave

# Please get the custom seccomp profile from Jess Frazelle:
# 	wget https://raw.githubusercontent.com/jfrazelle/dotfiles/master/etc/docker/seccomp/chrome.json -O ~/.config/chrome.json

FROM ubuntu:xenial
LABEL maintainer "anilgol@live.com"

ARG USER_ID=1000
ARG GROUP_ID=1000

ENV TZ=Europe/Amsterdam

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
		echo $TZ > /etc/timezone

RUN apt-get update && \
		apt-get -y install \
										apt-transport-https \
										ca-certificates \
										curl \
										gnupg \
										locales \
										lsb-release \
										--no-install-recommends && \
			rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
		locale-gen && \
		echo "LANG=en_US.UTF-8" > /etc/locale.conf

RUN curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | apt-key add - && \
		echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ `lsb_release -sc` main" | tee /etc/apt/sources.list.d/brave-browser-release-`lsb_release -sc`.list && \
		apt update && \
		apt install -y \
									brave-browser \
									brave-keyring

RUN groupadd -g ${GROUP_ID} -r brave && \
		useradd -G audio,video -u ${USER_ID} -g ${GROUP_ID} brave && \
    mkdir -p /home/brave/Downloads && \
    chown -R brave:brave /home/brave

USER brave

ENTRYPOINT ["brave-browser"]
