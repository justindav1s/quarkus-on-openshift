FROM frolvlad/alpine-glibc
WORKDIR /work/
COPY target/*-runner /work/application
RUN chmod 775 /work
EXPOSE 8080
CMD ["./application", "-Dshamrock.http.host=0.0.0.0"]