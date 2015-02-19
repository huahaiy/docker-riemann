#
# Riemann server
#
# Version     0.2.8
#

FROM huahaiy/oracle-java

MAINTAINER Huahai Yang <hyang@juji-inc.com>

RUN \
  echo "===> install Riemann..."  && \ 
  wget https://aphyr.com/riemann/riemann_0.2.8_all.deb && \
  dpkg -i riemann_0.2.8_all.deb && \
  rm riemann_0.2.8_all.deb && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./docker-entrypoint.sh /

ENV RIEMANN_CONFIG_INCLUDE_DIR /riemann

ENV RIEMANN_LOG_DIR /var/log/riemann

VOLUME ["/riemann", "/var/log/riemann"]

EXPOSE 5555 5556

ENTRYPOINT ["/docker-entrypoint.sh"]
