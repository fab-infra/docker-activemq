#!/bin/sh -ex

# Set variables
ACTIVEMQ_DIR="/opt/activemq"
ACTIVEMQ_ADMIN_PASSWORD="${ACTIVEMQ_ADMIN_PASSWORD:-admin}"

# Set admin password
sed -i "s/@ACTIVEMQ_ADMIN_PASSWORD@/$ACTIVEMQ_ADMIN_PASSWORD/g" "$ACTIVEMQ_DIR/conf/jetty-realm.properties"

# Start ActiveMQ
exec "$ACTIVEMQ_DIR/bin/activemq" console
