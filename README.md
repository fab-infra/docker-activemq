[![build](https://github.com/fab-infra/docker-activemq/actions/workflows/build.yml/badge.svg)](https://github.com/fab-infra/docker-activemq/actions/workflows/build.yml)

# Apache ActiveMQ Docker image

## Ports

The following ports are exposed by this container image.

| Port | Description |
| ---- | ----------- |
| 1883 | MQTT port |
| 5672 | AMQP port |
| 8161 | HTTP port |
| 61613 | STOMP port |
| 61614 | WebSocket port |
| 61616 | OpenWire port |

## Environment variables

The following environment variables can be used with this container.

| Variable | Description | Default value |
| -------- | ----------- | ------------- |
| ACTIVEMQ_ADMIN_PASSWORD | HTTP admin user password | admin |

## Volumes

The following container paths can be used to mount a dedicated volume or to customize configuration.

| Path | Description |
| ---- | ----------- |
| /opt/activemq/conf/activemq.xml | Configuration file |
| /opt/activemq/data | Persistent data store directory |

## Useful links

- [Apache ActiveMQ documentation](https://activemq.apache.org/components/classic/documentation)
