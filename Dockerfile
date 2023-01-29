FROM registry.access.redhat.com/rhel7/rhel
#FROM registry.redhat.io/rhel7.4
RUN useradd webuser
RUN mkdir /apps
RUN mkdir /apps/LPP
RUN mkdir /apps/LPP/apache-tomcat-9.0.30
RUN mkdir /apps/LPP/FO2_LIQUIDITY
RUN mkdir /apps/LPP/zulu8.46.0.19-ca-jdk8.0.252-linux_x64
ADD apache-tomcat-9.0.30 /apps/LPP/apache-tomcat-9.0.30
ADD zulu8.46.0.19-ca-jdk8.0.252-linux_x64 /apps/LPP/zulu8.46.0.19-ca-jdk8.0.252-linux_x64

RUN chown -R webuser:webuser /apps/LPP/
USER webuser
RUN chmod -R 777 /apps/LPP/apache-tomcat-9.0.30/bin
ENV JAVA_HOME /apps/LPP/zulu8.46.0.19-ca-jdk8.0.252-linux_x64
ENV PATH /apps/LPP/zulu8.46.0.19-ca-jdk8.0.252-linux_x64/bin:$PATH
WORKDIR /apps/LPP/apache-tomcat-9.0.30/bin
#EXPOSE 8059
EXPOSE 8989
CMD ["/apps/LPP/apache-tomcat-9.0.30/bin/catalina.sh", "run"]

#WORKDIR /apps/jboss/apache/bin
#ENV PATH /apps/jboss/apache/bin:$PATH
#RUN chmod -R 775 /apps/jboss/apache/bin
#EXPOSE 9090
##CMD apachectl -D FOREGROUND
