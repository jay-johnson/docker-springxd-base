FROM java:8
MAINTAINER Jay Johnson jay.p.h.johnson@gmail.com

ENV XD_BUILD RELEASE
ENV XD_VERSION 1.3.0.${XD_BUILD}

RUN groupadd -r springxd && useradd -r -g springxd springxd

RUN apt-get update && apt-get install -y net-tools curl rsync wget unzip zip

RUN wget http://repo.spring.io/libs-release/org/springframework/xd/spring-xd/${XD_VERSION}/spring-xd-${XD_VERSION}-dist.zip \
      -O /opt/spring-xd-${XD_VERSION}-dist.zip \
    && unzip /opt/spring-xd-${XD_VERSION}-dist.zip -d /opt/ \
    && rm /opt/spring-xd-${XD_VERSION}-dist.zip \
    && /opt/spring-xd-${XD_VERSION}/zookeeper/bin/install-zookeeper \
    && chown -R springxd:springxd /opt/spring-xd-${XD_VERSION} \
    && ln -s /opt/spring-xd-${XD_VERSION} /opt/spring-xd

USER springxd

RUN mkdir /opt/spring-xd-${XD_VERSION}/xd/data \
      && mkdir /opt/spring-xd-${XD_VERSION}/xd/custom-modules

WORKDIR /opt/spring-xd


