# docker run \
# 		--rm \
# 		-w /project \
# 		-v `pwd`:/project \
# 		-v $HOME/.config/maven-cache:/home/maven/.m2 \
# 		eugene/maven mvn $@
#
# docker run \
# 		-it \
# 		--rm \
# 		-w /project \
# 		-v `pwd`:/project \
# 		-v $HOME/.config/maven-cache:/home/maven/.m2 \
# 		eugene/maven /bin/zsh

FROM maven:3-jdk-8
LABEL maintainer "anilgol@live.com"

ARG USER_ID=1000
ARG GROUP_ID=1000

RUN ln -snf /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime && \
		echo Europe/Amsterdam > /etc/timezone

RUN apt update && \
		apt install -yq --no-install-recommends \
											zsh \
											curl \
											git \
											vim

RUN groupadd -g ${GROUP_ID} -r maven && \
		useradd -m -u ${USER_ID} -r -g ${GROUP_ID} maven

RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && \
		mv /root/.zshrc /root/.oh-my-zsh /home/maven/ && \
		sed -i "s/\/root/\/home\/maven/g" /home/maven/.zshrc

RUN apt remove --purge -y \
												curl \
												git

RUN chown -R maven:maven /home/maven

USER maven

WORKDIR /project

CMD ["mvn","--version"]
