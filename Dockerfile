FROM ubuntu:16.04

EXPOSE 80

COPY ./setup.sh .

RUN ./setup.sh

CMD service mysql start && service apache2 start && /bin/bash
