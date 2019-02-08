# docker run \
# 					-d \
# 					--rm \
# 					--name dropbox \
# 					-h dropbox \
# 					-v $HOME/.config/dropbox:/home/dropbox/.dropbox \
# 					-v $HOME/Dropbox:/home/dropbox/Dropbox \
# 					eugene/dropbox

FROM debian:sid-slim
LABEL maintainer "anilgol@live.com"

ARG USER_ID=1000
ARG GROUP_ID=1000

RUN apt update && \
		apt install -y wget

RUN groupadd -g ${GROUP_ID} -r dropbox && \
		useradd -m -u ${USER_ID} -r -g ${GROUP_ID} dropbox

RUN cd /home/dropbox && \
		wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

RUN chown -R dropbox. /home/dropbox

WORKDIR /home/dropbox

USER dropbox

ENTRYPOINT [ ".dropbox-dist/dropboxd" ]
