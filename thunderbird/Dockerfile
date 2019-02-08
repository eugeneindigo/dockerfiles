# docker run \
#          --name thunderbird \
#          -d \
#          --rm \
#          -v /etc/localtime:/etc/localtime:ro \
#          -v /tmp/.X11-unix:/tmp/.X11-unix \
#          -e DISPLAY=unix$DISPLAY \
#          -v $HOME/.config/thunderbird:/home/thunderbird/.thunderbird \
#          eugene/thunderbird

FROM debian:sid-slim
LABEL maintainer "anilgol@live.com"

RUN groupadd thunderbird && \
    useradd -m -g thunderbird thunderbird && \
    chown -R thunderbird:thunderbird /home/thunderbird

RUN apt-get -y update && \
    apt-get install -y thunderbird && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get autoremove -y

USER thunderbird

CMD ["thunderbird"]
