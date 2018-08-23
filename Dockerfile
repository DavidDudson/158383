FROM ubuntu:16.04

COPY ./setup.sh .

RUN ./setup.sh

CMD service start mysql && service start apache2
