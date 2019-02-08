# docker run \
# 					-it \
# 					--rm \
# 					--name subliminal \
# 					-v $HOME/Videos:/videos \
# 					eugene/subliminal \
# 					download \
# 						-l en \
# 						/videos/some-video.mkv

FROM python:3
LABEL maintainer "anilgol@live.com"

ARG USER_ID=1000
ARG GROUP_ID=1000

ENV URL https://github.com/Diaoul/subliminal.git

RUN git clone -b develop $URL && \
		cd subliminal && \
		python setup.py install

RUN groupadd -g ${GROUP_ID} -r subliminal && \
		useradd -m -u ${USER_ID} -r -g ${GROUP_ID} subliminal && \
		chown -R subliminal:subliminal /home/subliminal

ENTRYPOINT ["subliminal"]
CMD ["--help"]
