FROM mesosphere/mesos:0.27.2-2.0.15.ubuntu1404

ENV CHRONOS_VERSION=2.5.0-0.1.20160223054243.ubuntu1404

RUN apt-get update && apt-get -y install chronos=$CHRONOS_VERSION curl
RUN rm -rf /etc/mesos
RUN rm -rf /etc/chronos/conf

EXPOSE 4400

CMD ["/usr/bin/chronos", "run_jar", "--http_port", "4400", "--zk_hosts",  "localhost:2181", "--master", "zk://localhost:2181"]