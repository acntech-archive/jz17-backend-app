FROM tomcat:8.0-jre8

# Remove some default apps
RUN rm -rf /usr/local/tomcat/webapps/ROOT \
        /usr/local/tomcat/webapps/docs \
        /usr/local/tomcat/webapps/examples \
        /usr/local/tomcat/webapps/host-manager


ENV DOCKERIZE_VERSION v0.5.0
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz && rm dockerize-linux*.tar.gz

COPY tomcat/ /templates/

ENV TOMCAT_MNG_USERNAME=tomcat \
    TOMCAT_MNG_PASSWORD=tomcat \
    DATABASE_URL=jdbc:postgresql://database:5432/postgres

CMD [ "dockerize", \
        "-template", "/templates/tomcat-users.xml.tmpl:/usr/local/tomcat/conf/tomcat-users.xml", \
        "-template", "/templates/tomcat-context.xml.tmpl:/usr/local/tomcat/conf/context.xml", \
        "catalina.sh", "run" ]

# Add labels
ARG GIT_COMMIT=unknown
LABEL jz17demo.git.commitHash=$GIT_COMMIT

COPY target/backend-app-*.war /usr/local/tomcat/webapps/backend.war
