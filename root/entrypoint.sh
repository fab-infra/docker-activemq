#!/bin/sh -e

# Generate admin password
if [ -z "$ACTIVEMQ_ADMIN_PASSWORD" ]; then
    ACTIVEMQ_ADMIN_PASSWORD=$(cat /dev/urandom | tr -dc A-Za-z0-9 | head -c32)
    echo "Random admin password generated in /opt/activemq/conf/jetty-realm.properties"
    echo "To set it permanently, set the ACTIVEMQ_ADMIN_PASSWORD environment variable."
fi

# Set admin password
sed -i "s/@ACTIVEMQ_ADMIN_PASSWORD@/$ACTIVEMQ_ADMIN_PASSWORD/g" "/opt/activemq/conf/jetty-realm.properties"

# Start ActiveMQ
exec "/opt/activemq/bin/activemq" "$@"
