# docker-fluentd-elasticsearch

Base docker image to run fluentd, with the ElasticSearch plugin.

## Building a tagged release from Github

As an alternative to the [Docker Index](https://index.docker.io/), an image can be created from my Github repository:

    # docker build -t openfirmware/fluentd-elasticsearch github.com/openfirmware/docker-fluentd-elasticsearch.git

Once built, the image will be available locally as `openfirmware/fluentd-elasticsearch`. The command can be re-run to update the image with any changes to the Dockerfile.

## Running fluentd

Run the following command to start fluentd:

    # docker run -d -p 8888:8888 -p 24224:24224 openfirmware/fluentd-elasticsearch

## Running fleuntd with a remote Elastic Search host

(WIP)

## Running fluentd with a local named docker container running Elastic Search

(WIP)

## Credits

* [Original docker-fluentd repository](https://github.com/jplock/docker-fluentd) created by jplock

