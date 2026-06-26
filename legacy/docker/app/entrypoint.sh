#!/bin/sh
set -eu

APP_DIR="/usr/local/tomcat/webapps/${APP_CONTEXT}"
SRC_DIR="/workspace/legacy/src"
WEB_DIR="/workspace/legacy/WebContent"
CLASS_DIR="${APP_DIR}/WEB-INF/classes"
LIB_DIR="${APP_DIR}/WEB-INF/lib"

mkdir -p "${APP_DIR}" "${CLASS_DIR}" "${LIB_DIR}"
cp -R "${WEB_DIR}/." "${APP_DIR}/"

if [ -d /opt/legacy-lib ]; then
  find /opt/legacy-lib -type f \( -name '*.jar' -o -name '*.zip' \) -exec cp {} "${LIB_DIR}/" \;
fi

CLASSPATH="${LIB_DIR}/*:/usr/local/tomcat/lib/servlet-api.jar"
find "${SRC_DIR}" -name '*.java' \
  ! -path "${SRC_DIR}/com/customer/CustomerSelect.java" \
  ! -path "${SRC_DIR}/com/customer/CustomerUpdate.java" | sort > /tmp/legacy-sources.txt

javac -encoding UTF-8 -cp "${CLASSPATH}" -d "${CLASS_DIR}" @/tmp/legacy-sources.txt
cp -R "${SRC_DIR}/reportconfig" "${CLASS_DIR}/"
cp "${SRC_DIR}/log4j.properties" "${CLASS_DIR}/"

exec catalina.sh run
