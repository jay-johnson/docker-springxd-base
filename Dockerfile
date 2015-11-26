FROM java:8
MAINTAINER Jay Johnson jay.p.h.johnson@gmail.com

ENV XD_BUILD RELEASE
ENV XD_VERSION 1.3.0.${XD_BUILD}

RUN groupadd -r springxd && useradd -r -g springxd springxd

RUN wget http://repo.spring.io/libs-release/org/springframework/xd/spring-xd/1.3.0.RELEASE/spring-xd-1.3.0.RELEASE-dist.zip \
      -O /opt/spring-xd-1.3.0.RELEASE-dist.zip \
    && unzip /opt/spring-xd-1.3.0.RELEASE-dist.zip -d /opt/ \
    && rm /opt/spring-xd-1.3.0.RELEASE-dist.zip \
    && apt-get update && apt-get install -y net-tools curl rsync \
    && /opt/spring-xd-1.3.0.RELEASE/zookeeper/bin/install-zookeeper \
    && chown -R springxd:springxd /opt/spring-xd-1.3.0.RELEASE \
    && ln -s /opt/spring-xd-1.3.0.RELEASE /opt/spring-xd

USER springxd

RUN mkdir /opt/spring-xd-1.3.0.RELEASE/xd/data \
      && mkdir /opt/spring-xd-1.3.0.RELEASE/xd/custom-modules

WORKDIR /opt/spring-xd


