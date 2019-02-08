# docker run \
# 					-d \
# 					--rm \
# 					--name android-studio \
# 					--net=host \
# 					--env=DISPLAY \
# 					--add-host=localhost:127.0.0.1 \
# 					--privileged -v /dev/bus/usb:/dev/bus/usb \
# 					-v /etc/localtime:/etc/localtime:ro \
# 					-v /tmp/.X11-unix:/tmp/.X11-unix \
# 					-v $HOME/.config/AndroidStudio:/root/.AndroidStudio3.2 \
# 					-v $HOME/.cache/android-sdk:/root/Android \
# 					-v $HOME/.cache/gradle-cache-android:/root/.gradle:rw \
# 					-v $HOME/AndroidProjects:/home/android/AndroidProjects \
# 					eugene/android-studio

# Please fill {{phoneId}} under 51-android.rules

# Known Bugs
# * Emulator is not working.

FROM openjdk:11-jdk
LABEL maintainer "anilgol@live.com"

ARG USER_ID=1000
ARG GROUP_ID=1000

ENV VERSION 3.2.1.0
ENV KEY 181.5056338

ENV URL https://dl.google.com/dl/android/studio/ide-zips/$VERSION/android-studio-ide-$KEY-linux.zip
ENV ANDROID_EMULATOR_USE_SYSTEM_LIBS=1

RUN wget -O /tmp/android-studio.zip $URL && \
		unzip /tmp/android-studio.zip -d /usr/share && \
    rm /tmp/android-studio.zip

RUN apt update && \
		apt install -y \
								adb \
								pulseaudio

RUN mkdir -p /etc/udev/rules.d && \
		chmod 766 /etc/udev/rules.d

ADD 51-android.rules /etc/udev/rules.d
RUN chmod 766 /etc/udev/rules.d/51-android.rules

RUN groupadd -g ${GROUP_ID} -r android && \
		useradd -m -u ${USER_ID} -r -g ${GROUP_ID} android && \
		chown -R android:android /home/android

USER android

CMD /usr/share/android-studio/bin/studio.sh
