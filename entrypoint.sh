#!/bin/bash
# Run the make target with both jdk versions

# Show the base container OS info
cat /etc/os-release
set -vx
ls -al /usr/bin/java* /usr/lib/jvm
ln -snf java-18-openjdk-amd64 /usr/lib/jvm/selected
ls -al /usr/bin/java* /usr/lib/jvm
java --version
make "${@}" &

sleep 10

ls -al /usr/bin/java* /usr/lib/jvm
ln -snf jdk-17.0.3+7 /usr/lib/jvm/selected
ls -al /usr/bin/java* /usr/lib/jvm
java --version
make "${@}" &

sleep 10

