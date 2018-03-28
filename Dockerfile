FROM tomcat:8.5.20

# Maintainer
MAINTAINER ywn202@nyu.edu

#this change to the app manager context.xml file will enable us to access tomcat manager gui from different hosts
ADD context.xml /usr/local/tomcat/webapps/manager/META-INF/

# Copy tomcat-users.xml
ADD tomcat-users.xml /usr/local/tomcat/conf/

# Copy catalina.sh with JAVA_OPTS
ADD catalina.sh /usr/local/tomcat/bin/

# Copy JAR
ADD fortress-realm-proxy-2.0.0-RC1.jar /usr/local/tomcat/lib/

# Copy images to tomcat path, the fortress-rest and fortress-core built file
ADD fortress-rest.war /usr/local/tomcat/webapps/
ADD fortress-web.war /usr/local/tomcat/webapps/

EXPOSE 8080

# Start the Service
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
