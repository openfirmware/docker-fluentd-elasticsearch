#!/bin/bash

if [ -f /.plugin_setup ]; then
	exit 0
fi

DEFAULT_HOST=${ELASTICSEARCH_PORT_9200_TCP_ADDR:-localhost}
DEFAULT_PORT=${ELASTICSEARCH_PORT_9200_TCP_PORT:-9200}

ELASTICSEARCH_HOST=${ELASTICSEARCH_HOST:-$DEFAULT_HOST}
ELASTICSEARCH_PORT=${ELASTICSEARCH_PORT:-$DEFAULT_PORT}
ELASTICSEARCH_INDEX=${ELASTICSEARCH_INDEX:-fluentd}
ELASTICSEARCH_TYPE=${ELASTICSEARCH_TYPE:-fluentd}

echo "
<match **>
	type elasticsearch
	logstash_format true
	host $ELASTICSEARCH_HOST
	port $ELASTICSEARCH_PORT
	index_name $ELASTICSEARCH_INDEX
	type_name $ELASTICSEARCH_TYPE
</match>" >> /etc/td-agent/td-agent.conf

touch /.plugin_setup
