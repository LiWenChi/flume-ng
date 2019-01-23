#!/usr/bin/env bash
# CLOUDERA-BUILD
export JAVA8_BUILD=true
. /opt/toolchain/toolchain.sh
export JAVA_HOME=$JAVA_1_8_HOME
echo "Versions used for the build:"
java -version
mvn -version

# activate mvn-gbn wrapper
mv "$(which mvn-gbn-wrapper)" "$(dirname "$(which mvn-gbn-wrapper)")/mvn"

echo "Running maven test"
export MAVEN_OPTS="-Xms512m -Xmx1024m -XX:PermSize=256m -XX:MaxPermSize=512m"
mvn --update-snapshots -Dsurefire.rerunFailingTestsCount=5 clean test -B
