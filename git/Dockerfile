# docker run \
# 					-it \
# 					--rm \
# 					-w /project \
# 					-v `pwd`:/project \
# 					eugene/git git $@
#
# docker run \
# 					-it \
# 					--rm \
# 					-w /project \
# 					-v `pwd`:/project \
# 					eugene/git /bin/zsh

FROM debian:sid-slim
LABEL maintainer "anilgol@live.com"

ARG USER_ID=1000
ARG GROUP_ID=1000

ARG SSH_PRIVATE_KEY

RUN apt update && \
		apt install -y \
						git \
						zsh \
						curl \
						vim

RUN groupadd -g ${GROUP_ID} -r git && \
		useradd -m -u ${USER_ID} -r -g ${GROUP_ID} git

RUN mkdir /home/git/.ssh && \
    chmod 0700 /home/git/.ssh

RUN echo "$SSH_PRIVATE_KEY" > /home/git/.ssh/id_rsa && \
    chmod -R 0600 /home/git/.ssh/*

RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && \
		mv /root/.zshrc /root/.oh-my-zsh /home/git/ && \
		sed -i "s/\/root/\/home\/git/g" /home/git/.zshrc

RUN	chown -R git:git /home/git

USER git

WORKDIR /project

CMD ["git"]
