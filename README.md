Run in dev mode

mvn clean compile quarkus:dev

go to http://localhost:8080/hello/greeting/justin

change the GreetingService

go to http://localhost:8080/hello/greeting/justin

Build a native image

mvn package verify -Pnative

for openshift (a linux binary)

mvn package -Pnative -Dnative-image.docker-build=true