# docker-fluentd-elasticsearch

Base docker image to run fluentd, with the ElasticSearch plugin.

The `latest` tag will use the latest version of `openfirmware/fluentd` and the latest version of fluentd-elasticsearch.

The `2.2.0` tag will lock fluentd td-agent to v2.2.0, and fluentd-elasticsearch to the latest version.

The `2.2.0-0.9.0` tag will lock fluentd td-agent to v2.2.0, and fluentd-elasticsearch to version 0.9.0.

## Building a tagged release from Github

As an alternative to the [Docker Registry](https://registry.hub.docker.com/), an image can be created from my Github repository:

    # docker build -t openfirmware/fluentd-elasticsearch github.com/openfirmware/docker-fluentd-elasticsearch.git

Once built, the image will be available locally as `openfirmware/fluentd-elasticsearch`. The command can be re-run to update the image with any changes to the Dockerfile.

## Running fluentd

Run the following command to start fluentd:

    # docker run -d -p 8888:8888 -p 24224:24224 openfirmware/fluentd-elasticsearch

By default, the plugin will assume these details for ElasticSearch:

    host: localhost
    port: 9200
    index_name: fluentd
    type_name: fluentd

These are almost certainly not useful unless you are using a different base image that includes ElasticSearch. Instead, customize the settings using environment variables as explained in the following sections.

## Running fleuntd with a remote Elastic Search host

With ElasticSearch running on `192.168.1.10` and port `9500`:

    # docker run -d -p 8888:8888 -p 24224:24224 -e ES_HOST="192.168.1.10" -e ES_PORT="9500" openfirmware/fluentd-elasticsearch

Enviroment Variables you can customize:

### ES_HOST

Host IP or address for ElasticSearch. Multiple hosts are not supported in this Dockerfile currently. Defaults to `$ELASTICSEARCH_PORT_9200_TCP_ADDR` then `localhost`.

### ES_PORT

Host port for ElasticSearch. Defaults to `$ELASTICSEARCH_PORT_9200_TCP_PORT` then `9200`.

### ES_INDEX

Index name for ElasticSearch. Defaults to `fluentd`.

### ES_TYPE

Type name for ElasticSearch. Defaults to `fluentd`.

## Running fluentd with a local container running Elastic Search

Docker supports linking named containers together, allowing IPs and ports to be automatically configured from random values. Let's assume ElasticSearch is running in another docker container:

    # docker run -d --name=elasticsearch dockerfile/elasticsearch

That container has the name `elasticsearch` and has the ports 9200 and 9300 exposed but not bound. We can link it to `fluentd-elasticsearch`:

    # docker run -d -p 8888:8888 -p 24224:24224 --link elasticsearch:elasticsearch openfirmware/fluentd-elasticsearch

This will feed the IP and port from the `elasticsearch` container as default values instead of `localhost` and `9200`.

## Credits

* [Original docker-fluentd repository](https://github.com/jplock/docker-fluentd) created by jplock
