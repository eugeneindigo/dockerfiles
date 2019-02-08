# docker run \
# 				 -it \
# 				 --rm \
# 				 --name go \
# 				 -v $HOME/go:/home/go/go \
# 				 eugene/go /bin/zsh

FROM golang
LABEL maintainer "anilgol@live.com"

ARG USER_ID=1000
ARG GROUP_ID=1000

ENV GOPATH="/home/go/go"
ENV PATH="${GOPATH}/bin:${PATH}"

RUN apt update && \
		apt install -y \
						git \
						zsh \
						curl \
						vim

RUN groupadd -g ${GROUP_ID} -r go && \
		useradd -m -u ${USER_ID} -r -g ${GROUP_ID} go

RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && \
		mv /root/.zshrc /root/.oh-my-zsh /home/go/ && \
		sed -i "s/\/root/\/home\/go/g" /home/go/.zshrc

RUN	chown -R go:go /home/go

USER go

WORKDIR /home/go

CMD ["go"]
