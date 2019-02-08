# docker run \
# 					-d \
# 					--rm \
# 					-e DISPLAY=unix$DISPLAY \
# 					-v /etc/localtime:/etc/localtime:ro \
# 					-v /tmp/.X11-unix:/tmp/.X11-unix \
# 					-v $HOME/.config/vncviewer:/home/vncviewer/.vnc \
# 					eugene/vncviewer

# Known Bugs
# * Black/green view can occur sometimes on user interface.

FROM debian:sid-slim
LABEL maintainer "anilgol@live.com"

ARG USER_ID=1000
ARG GROUP_ID=1000

ENV VERSION 6.18.907
ENV URL https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-${VERSION}-Linux-x64-ANY.tar.gz

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

RUN wget ${URL} -O /tmp/vncviewer.tar.gz && \
    cd /tmp && \
    tar xzvf vncviewer.tar.gz && \
    mv VNC-Viewer-* /usr/share/vncviewer && \
    rm vncviewer.tar.gz

RUN groupadd -g ${GROUP_ID} -r vncviewer && \
    useradd -m -u ${USER_ID} -r -g ${GROUP_ID} vncviewer

WORKDIR /usr/share/vncviewer

USER vncviewer

CMD ["./vncviewer"]
