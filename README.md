# docker-fluentd-elasticsearch

Base docker image to run fluentd, with the ElasticSearch plugin.

## Building a tagged release from Github

As an alternative to the [Docker Index](https://index.docker.io/), an image can be created from my Github repository:

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

    # docker run -d -p 8888:8888 -p 24224:24224 -e ELASTICSEARCH_HOST="192.168.1.10" -e ELASTICSEARCH_PORT="9500" openfirmware/fluentd-elasticsearch

Enviroment Variables you can customize:

### ELASTICSEARCH_HOST

Host IP or address for ElasticSearch. Multiple hosts are not supported in this Dockerfile currently. Defaults to `localhost`.

### ELASTICSEARCH_PORT

Host port for ElasticSearch. Defaults to `9200`.

### ELASTICSEARCH_INDEX

Index name for ElasticSearch. Defaults to `fluentd`.

### ELASTICSEARCH_TYPE

Type name for ElasticSearch. Defaults to `fluentd`.

## Running fluentd with a local named docker container running Elastic Search

(WIP)

## Credits

* [Original docker-fluentd repository](https://github.com/jplock/docker-fluentd) created by jplock

