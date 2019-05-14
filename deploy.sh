#!/usr/bin/env bash

IP=ocp.datr.eu
USER=justin
PROJECT=protean-test2

oc login https://${IP}:8443 -u justin

APP=protean-test

oc delete project $PROJECT
oc adm new-project $PROJECT 2> /dev/null
while [ $? \> 0 ]; do
    sleep 1
    printf "."
oc adm new-project $PROJECT 2> /dev/null
done

oc project $PROJECT

oc delete imagestream ${APP}
oc delete buildconfig ${APP}-docker-build
oc delete deploymentconfig ${APP}
oc delete serviceaccounts ${APP}
oc delete service ${APP}
oc delete route ${APP}

mvn package -Pnative -Dnative-image.docker-build=true

oc new-app -f app-template.yml \
    -p APPLICATION_NAME=${APP} \
    -p SOURCE_REPOSITORY_URL=https://github.com/justindav1s/protean-openshift.git \
    -p SOURCE_REPOSITORY_REF=master \
    -p DOCKERFILE_PATH="."

oc start-build ${APP}-docker-build  --from-dir=. --follow
