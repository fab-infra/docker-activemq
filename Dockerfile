# ActiveMQ server based on openSUSE 15.3
FROM ghcr.io/fab-infra/base-image:opensuse15.3

# Arguments
ARG ACTIVEMQ_VERSION=5.15.15
ARG ACTIVEMQ_URL=http://archive.apache.org/dist/activemq/${ACTIVEMQ_VERSION}/apache-activemq-${ACTIVEMQ_VERSION}-bin.tar.gz

# Environment
ENV ACTIVEMQ_ADMIN_PASSWORD=admin

# Java
RUN zypper in -y java-1_8_0-openjdk-headless &&\
	zypper clean -a

# ActiveMQ
RUN mkdir -p /opt/activemq /opt/activemq/tmp &&\
	curl -fsSL -o /tmp/apache-activemq.tar.gz ${ACTIVEMQ_URL} &&\
	tar -xzf /tmp/apache-activemq.tar.gz -C /opt/activemq --strip-components=1 &&\
	rm -f /tmp/apache-activemq.tar.gz

# Files
COPY ./root /
RUN groupadd activemq &&\
	useradd -d /opt/activemq -g activemq -s /bin/bash activemq &&\
	chmod a+rw /etc/passwd /etc/group &&\
	chown -R activemq:activemq /opt/activemq &&\
	chmod -R a+rwX /opt/activemq/conf /opt/activemq/data /opt/activemq/tmp

# Execution
USER activemq
EXPOSE 61616 5672 61613 1883 61614 8161
