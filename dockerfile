FROM ubuntu:latest

ENV TZ=Europe/Warsaw
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone 

RUN apt update && apt install -y build-essential unzip vim git curl wget zip

RUN apt-get update &&\
	apt-get upgrade -y &&\
    apt-get install -y  software-properties-common

# JS
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g npm@latest


RUN useradd -ms /bin/bash szymonlutowicz
RUN adduser szymonlutowicz sudo

USER szymonlutowicz
WORKDIR /home/szymonlutowicz/
RUN curl -s "https://get.sdkman.io" | bash
RUN chmod a+x "/home/szymonlutowicz/.sdkman/bin/sdkman-init.sh"
RUN bash -c "source /home/szymonlutowicz/.sdkman/bin/sdkman-init.sh && sdk install java 11.0.11.hs-adpt"
RUN bash -c "source /home/szymonlutowicz/.sdkman/bin/sdkman-init.sh && sdk install gradle 7.2"
RUN bash -c "source /home/szymonlutowicz/.sdkman/bin/sdkman-init.sh && sdk install kotlin 1.5.31"