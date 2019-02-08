# docker run \
#           -it \
#           -h duplicity \
#           -v $HOST_GNUPG_PATH:/home/duplicity/.gnupg \
#           -v $HOST_BACKUP_SOURCE_PATH:/backup \
#           -v $HOST_BACKUP_DESTINATION_PATH:/workspace \
#           -e PASSPHRASE=$PRIVATE_FOLDER_PASSPHRASE \
#           eugene/duplicity \
#           duplicity \
#             --encrypt-key $PRIVATE_FOLDER_ENCRYPT_KEY \
#             /backup \
#             file:///workspace

FROM alpine
LABEL maintainer "anilgol@live.com"

ARG USER_ID=1000
ARG GROUP_ID=1000

ENV MAJOR_VERSION=0.7
ENV MINOR_VERSION=18.2

ENV DUPLICITY_URL=https://code.launchpad.net/duplicity/$MAJOR_VERSION-series/$MAJOR_VERSION.$MINOR_VERSION/+download/duplicity-$MAJOR_VERSION.$MINOR_VERSION.tar.gz

RUN apk add --no-cache \
									ca-certificates \
									curl \
									python \
									py-pip \
									py-setuptools \
									python-dev \
									gcc \
									libc-dev \
									openssl \
						      lftp \
						      openssh \
						      py-crypto \
						      py-paramiko \
						      py-setuptools \
						      rsync \
						      librsync-dev \
						      gnupg \
						      linux-headers && \
    pip install --upgrade pip

RUN curl -L $DUPLICITY_URL -o /tmp/duplicity.tar.gz && \
		cd /tmp && \
		tar xzvf duplicity.tar.gz && \
		rm duplicity.tar.gz

RUN cd /tmp/duplicity-$MAJOR_VERSION.$MINOR_VERSION && \
		pip install -r requirements.txt && \
		python setup.py install

RUN addgroup -g ${GROUP_ID} -S duplicity && \
		adduser -u ${USER_ID} -SG duplicity duplicity && \
		chown -R duplicity:duplicity /home/duplicity

USER duplicity

CMD ["duplicity", "--help"]
