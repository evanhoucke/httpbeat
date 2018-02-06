FROM alpine

ENV CONSOLE=true
ENV ES_HOST=localhost
ENV ES_PORT=9200
ENV httpbeat_version=4.1.0

RUN mkdir -p /opt && \
  mkdir -p /opt/beats

WORKDIR /opt

VOLUME [ "/opt/beats"]

ADD https://github.com/christiangalsterer/httpbeat/releases/download/$httpbeat_version/httpbeat-$httpbeat_version-linux-x86_64.tar.gz httpbeat.tar.gz
RUN \
  tar -zxvf httpbeat.tar.gz --strip 1 && \
  rm -rf httpbeat.tar.gz

ENTRYPOINT ["./httpbeat", "-c", "/opt/beats/http.yml"]
