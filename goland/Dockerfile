# docker run \
# 				 -d \
# 				 --rm \
# 				 --name goland \
# 				 --privileged \
# 				 --net=host \
# 				 --env=DISPLAY \
# 				 --add-host=localhost:127.0.0.1 \
# 				 -v /tmp/.X11-unix:/tmp/.X11-unix \
# 				 -v $HOME/.config/GoLand:/home/goland/.GoLand2018.3 \
# 				 -v $HOME/go:/home/goland/go \
# 				 eugene/goland

FROM openjdk:11-jdk
LABEL maintainer "anilgol@live.com"

ARG USER_ID=1000
ARG GROUP_ID=1000

ENV GO_VERSION 1.11.4
ENV GOLAND_VERSION 2018.3.2

ENV GO_URL https://dl.google.com/go/go$GO_VERSION.linux-amd64.tar.gz
ENV GOLAND_URL https://download-cf.jetbrains.com/go/goland-$GOLAND_VERSION.tar.gz

ENV GOROOT /usr/share/go
ENV GOPATH="/home/goland/go"
ENV PATH="${GOROOT}/bin:${PATH}"

RUN apt update && \
		apt install -y build-essential

RUN wget -O /tmp/go-$GO_VERSION.tar.gz $GO_URL && \
    mkdir -p /usr/share/go && \
    tar -xzvf /tmp/go-$GO_VERSION.tar.gz --strip-components=1 -C /usr/share/go && \
    rm /tmp/go-$GO_VERSION.tar.gz

RUN wget -O /goland-$GOLAND_VERSION.tar.gz $GOLAND_URL && \
    mkdir -p /usr/share/goland && \
    tar -xzvf /goland-$GOLAND_VERSION.tar.gz --strip-components=1 -C /usr/share/goland && \
    rm /goland-$GOLAND_VERSION.tar.gz

RUN groupadd -g ${GROUP_ID} -r goland && \
		useradd -m -u ${USER_ID} -r -g ${GROUP_ID} goland && \
		chown -R goland:goland /home/goland

USER goland

CMD /usr/share/goland/bin/goland.sh
