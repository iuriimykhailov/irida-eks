FROM tomcat:9.0-jre11
RUN mkdir -p /etc/irida/plugins /opt/irida/data/sequence /opt/irida/data/reference /opt/irida/data/output
ADD irida.conf /etc/irida/
RUN curl -Lo /usr/local/tomcat/webapps/irida.war https://github.com/phac-nml/irida/releases/download/19.01.1/irida-19.01.1.war
EXPOSE 8080
ENTRYPOINT ["catalina.sh","run"]