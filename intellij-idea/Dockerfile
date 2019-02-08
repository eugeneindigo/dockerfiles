# docker run \
#        -d \
#        --rm \
#        --name intellij \
#        --net=host \
#        --env=DISPLAY \
#        --add-host=localhost:127.0.0.1 \
#        -v /tmp/.X11-unix:/tmp/.X11-unix \
#        -v $HOME/.config/IntelliJIdea:/home/intellij/.IntelliJIdea2018.3:rw \
#        -v $HOME/.config/gradle-cache:/home/intellij/.gradle:rw \
#        -v $HOME/.config/maven-cache:/home/intellij/.m2:rw \
#        -v $HOME/IdeaProjects:/home/intellij/IdeaProjects:rw \
#        eugene/intellij-idea

# Known Issues
# * License login information cannot be cached.

ARG JAVA_VERSION=11
FROM openjdk:${JAVA_VERSION}-jdk
LABEL maintainer "anilgol@live.com"

ARG USER_ID=1000
ARG GROUP_ID=1000

ENV VERSION 2018.3.4
ENV URL https://download-cf.jetbrains.com/idea/ideaIU-$VERSION.tar.gz

RUN wget -O /intellij-$VERSION.tar.gz $URL && \
    mkdir -p /usr/share/intellij && \
    tar -xf /intellij-$VERSION.tar.gz --strip-components=1 -C /usr/share/intellij && \
    rm /intellij-$VERSION.tar.gz

RUN groupadd -g ${GROUP_ID} -r intellij && \
  	useradd -m -u ${USER_ID} -r -g ${GROUP_ID} intellij && \
  	chown -R intellij:intellij /home/intellij

USER intellij

CMD /usr/share/intellij/bin/idea.sh
