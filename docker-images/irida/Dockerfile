FROM tomcat:9.0-jre11
RUN mkdir -p /etc/irida/plugins
ADD irida.conf /etc/irida/
ADD tomcat.conf /etc/tomcat/conf
#ADD irida.war /usr/local/tomcat/webapps/
ADD start_irida.sh /usr/local/tomcat
RUN curl -Lo /usr/local/tomcat/webapps/irida.war https://github.com/phac-nml/irida/releases/download/20.01.2/irida-20.01.2.war
ENV JAVA_OPTS="${JAVA_OPTS} -Dspring.profiles.active=prod"
EXPOSE 8080
ENTRYPOINT ["sh","/usr/local/tomcat/start_irida.sh"]
