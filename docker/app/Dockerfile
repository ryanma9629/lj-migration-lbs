FROM tomcat:8.5.100-jdk8-temurin

ENV CATALINA_OPTS="-Dfile.encoding=UTF-8 -Duser.timezone=Asia/Shanghai"
ENV APP_CONTEXT=LBIBS

WORKDIR /workspace

COPY legacy /workspace/legacy
COPY docker/app/entrypoint.sh /entrypoint.sh
COPY docker/app/lib /opt/legacy-lib

RUN chmod +x /entrypoint.sh \
    && rm -rf /usr/local/tomcat/webapps/*

ENTRYPOINT ["/entrypoint.sh"]
