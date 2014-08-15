# DOCKER-VERSION 1.1.2
# VERSION        0.1

FROM openfirmware/fluentd
MAINTAINER James Badger <james@jamesbadger.ca>

RUN /usr/lib/fluent/ruby/bin/fluent-gem install fluent-plugin-elasticsearch

EXPOSE 24224 8888

ENTRYPOINT ["/usr/sbin/td-agent"]
CMD ["-v"]
