#!/bin/bash

if [ -f /.plugin_setup ]; then
	exit 0
fi

ELASTICSEARCH_HOST=${ELASTICSEARCH_HOST:-localhost}
ELASTICSEARCH_PORT=${ELASTICSEARCH_PORT:-9200}
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
