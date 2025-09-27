# Use official Tomcat 8 image
FROM tomcat:8.0.20-jre8

# ------------------------------
# Add WAR from Nexus directly (SonarQube compliant)
# ------------------------------
ADD http://192.168.137.13:8081/repository/hiring/in/javahome/hiring/0.1/hiring-0.1.war /usr/local/tomcat/webapps/hiring.war

# ------------------------------
# Expose Tomcat port
# ------------------------------
EXPOSE 8080

# ------------------------------
# Start Tomcat
# ------------------------------
CMD ["catalina.sh", "run"]
