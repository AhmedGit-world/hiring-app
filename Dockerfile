FROM tomcat:8.0.20-jre8

ENV NEXUS_REPO_URL="http://192.168.137.13:8081/repository/hiring/"
ENV ARTIFACT_PATH="in/javahome/hiring/0.1/hiring-0.1.war"
ENV TOMCAT_HOME="/opt/apache-tomcat-9.0.109"
ENV TOMCAT_WEBAPPS="$TOMCAT_HOME/webapps"

RUN apt-get update && apt-get install -y curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl -L $NEXUS_REPO_URL$ARTIFACT_PATH -o $TOMCAT_WEBAPPS/hiring.war

EXPOSE 8080

CMD ["$TOMCAT_HOME/bin/catalina.sh", "run"]
