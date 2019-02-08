# docker run \
# 					-it \
# 					--rm \
# 					--name zsh \
# 					eugene/zsh

FROM debian:sid-slim
LABEL maintainer "anilgol@live.com"

ARG USER_ID=1000
ARG GROUP_ID=1000

RUN apt update && \
		apt install -y \
						zsh \
						git \
						curl

RUN groupadd -g ${GROUP_ID} -r zsh && \
		useradd -s /bin/zsh -m -u ${USER_ID} -r -g ${GROUP_ID} zsh

RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && \
	mv /root/.zshrc /root/.oh-my-zsh /home/zsh/ && \
	sed -i "s/\/root/\/home\/zsh/g" /home/zsh/.zshrc

RUN	chown -R zsh:zsh /home/zsh

RUN apt remove -y --purge \
												git \
												curl

USER zsh

WORKDIR /home/zsh

ENTRYPOINT ["/bin/zsh"]
