German eIDAS middleware run container
=======

The [German middleware](https://github.com/Governikus/eidas-middleware) is not
a proper [12-factor](https://12factor.net/config) app. The Dockerfile here provides
a container using [docker-in-docker](https://hub.docker.com/_/docker) and our own
[govukverify/eidas-mw-config-generator](https://hub.docker.com/r/govukverify/eidas-mw-config-generator)
and [govukverify/eidas-middleware](https://hub.docker.com/r/govukverify/eidas-middleware)
images that behaves more like a 12-factor app and is fully configured through environment
variables.

## Build

Build the Docker image using the usual:

    docker build -t govukverify/eidas-mw-run .

## Run

To run the middleware using some test config (`config.env`), you can use

    docker-compose up
