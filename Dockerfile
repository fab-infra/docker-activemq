# ActiveMQ server based on Java 11
FROM eclipse-temurin:11-jre-jammy

# Arguments
ARG ACTIVEMQ_VERSION=5.18.4
ARG ACTIVEMQ_URL=https://archive.apache.org/dist/activemq/${ACTIVEMQ_VERSION}/apache-activemq-${ACTIVEMQ_VERSION}-bin.tar.gz

# ActiveMQ
RUN mkdir -p /opt/activemq /opt/activemq/tmp &&\
	curl -fsSL -o /tmp/apache-activemq.tar.gz ${ACTIVEMQ_URL} &&\
	tar -xzf /tmp/apache-activemq.tar.gz -C /opt/activemq --strip-components=1 &&\
	rm -f /tmp/apache-activemq.tar.gz &&\
	sed -i 's#name="host" value="127.0.0.1"#name="host" value="0.0.0.0"#g' /opt/activemq/conf/jetty.xml

# Files
COPY ./root /
RUN groupadd activemq &&\
	useradd -d /opt/activemq -g activemq -s /bin/bash activemq &&\
	chown -R activemq:activemq /opt/activemq &&\
	chmod -R a+rwX /opt/activemq/conf /opt/activemq/data /opt/activemq/tmp

# Execution
USER activemq
WORKDIR /opt/activemq
EXPOSE 61616 5672 61613 1883 61614 8161
ENTRYPOINT ["/entrypoint.sh"]
CMD ["console"]
