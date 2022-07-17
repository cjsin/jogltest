FROM docker.io/library/ubuntu:22.04

RUN rm -rf /var/lib/apt/lists \
    && apt-get update \
    && apt-get -y install apt-file \
    && apt-file update

# Install ubuntu openjdk-18 which fails
RUN apt-get -y install openjdk-18-jdk && ls -al /usr/lib/jvm

# Install 'eclipse adoptium openjdk17u' which works fine
ADD OpenJDK17U*.tar.gz /usr/lib/jvm/

# Put symlink in place for easy script switching of java version
RUN cd /usr/lib/jvm && ls -al && ln -sf jdk-17* selected
RUN cd /usr/bin && bash -c 'for e in javac java jar; do ln -sf /usr/lib/jvm/selected/bin/$e; done && ls -al /usr/bin/java*'

# Minimal libs for running the opengl test
RUN apt-get -y install \
        mesa-utils \
        x11-apps \
        make \
        libxtst6 \
        libxi6

COPY entrypoint.sh /
ENTRYPOINT /entrypoint.sh
CMD [ "/entrypoint.sh" ]
