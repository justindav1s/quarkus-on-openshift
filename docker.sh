#!/usr/bin/env bash

docker rmi jd/proteantest1

docker build -f Dockerfile -t jd/proteantest1 .

docker run -i --rm -p 8080:8080 jd/proteantest1