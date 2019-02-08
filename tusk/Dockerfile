# docker run \
# 					-d \
# 					--rm \
# 					--name tusk \
# 					--net host \
# 					-e DISPLAY=unix$DISPLAY \
# 					-v /tmp/.X11-unix:/tmp/.X11-unix \
# 					-v $HOME/.config/tusk:/home/tusk/.config/Tusk \
# 					eugene/tusk

# Known Bugs
# * Application crashes on notes with photos cannot be opened.

FROM debian:sid-slim
LABEL maintainer "anilgol@live.com"

ARG USER_ID=1000
ARG GROUP_ID=1000

ENV VERSION 0.21.0
ENV URL https://github.com/klaussinani/tusk/releases/download/v${VERSION}/tusk_${VERSION}_amd64.deb

RUN apt update && \
		apt install -y \
					wget \
					libasound2 \
					gconf2 \
					libnotify4 \
					libappindicator1 \
					libnss3 \
					libxss1 \
					libx11-xcb-dev \
					libcanberra-gtk-module

RUN wget $URL -O tusk.deb && \
		dpkg -i tusk.deb && \
		apt install -fy && \
		apt install -y

RUN groupadd -g ${GROUP_ID} -r tusk && \
		useradd -m -u ${USER_ID} -r -g ${GROUP_ID} tusk && \
		chown -R tusk:tusk /home/tusk

USER tusk

CMD ["tusk"]
