# ActiveMQ Classic
FROM apache/activemq-classic:6.2.0

# Files
COPY ./root /
RUN groupadd activemq &&\
	useradd -d ${ACTIVEMQ_HOME} -g activemq -s /bin/bash activemq &&\
    mkdir -p ${ACTIVEMQ_HOME}/tmp &&\
	chown -R activemq:activemq ${ACTIVEMQ_HOME} &&\
	chmod -R a+rwX ${ACTIVEMQ_HOME}/conf ${ACTIVEMQ_HOME}/data ${ACTIVEMQ_HOME}/tmp

# Execution
USER activemq
